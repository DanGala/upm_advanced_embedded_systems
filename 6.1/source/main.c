/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "fsm.h"
#include "buzzer.h"

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void EXTI15_10_IRQHandler_Config(void);
static void EXTI4_IRQHandler_Config(void);

/* FreeRTOS tasks */
static void domoticSysTask();

/* FSM functions */
/* Guard functions */
static int button_pressed(fsm_t* this);
static int timer_finished(fsm_t* this);
static int alarm_armed(fsm_t* this);
static int alarm_disarmed(fsm_t* this);
static int presence_detected(fsm_t* this);
/* Output functions */
static void switch_on(fsm_t* this);
static void switch_off(fsm_t* this);
static void alarm(fsm_t* this);
static void stop_alarm(fsm_t* this);

/* Private variables ---------------------------------------------------------*/
static GPIO_InitTypeDef  GPIO_InitStruct;
xTaskHandle domoticSysTask_Handle;
static int button = 0;
static TickType_t last = 0;
static TickType_t timeout = 0;

enum lights_state
{
  APAGADO,
  ENCENDIDO
};

static fsm_trans_t lights_tt[] = {
  { APAGADO, button_pressed, ENCENDIDO, switch_on },
  { ENCENDIDO, timer_finished, APAGADO, switch_off },
  { -1, NULL, -1, NULL },
};

enum alarm_state
{
  ARMADA,
  DESARMADA,
  INTRUSO
};

static fsm_trans_t alarm_tt[] = {
  { ARMADA, presence_detected, INTRUSO, alarm },
  { ARMADA, alarm_disarmed, DESARMADA, NULL },
  { DESARMADA, alarm_armed, ARMADA, NULL },
  { INTRUSO, alarm_disarmed, DESARMADA, stop_alarm },
  { -1, NULL, -1, NULL },
};

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  /* STM32L4xx HAL library initialization:
       - Configure the Flash prefetch
       - Systick timer is configured by default as source of time base, but user 
         can eventually implement his proper time base source (a general purpose 
         timer for example or other time source), keeping in mind that Time base 
         duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and 
         handled in milliseconds basis.
       - Set NVIC Group Priority to 4
       - Low Level Initialization
     */
  HAL_Init();

  /* Configure the system clock to 80 MHz */
  SystemClock_Config();
  
  /* -1- Enable each GPIO Clock (to be able to program the configuration registers) */
  LED2_GPIO_CLK_ENABLE();

  /* -2- Configure IOs in output push-pull mode to drive external LEDs */
  GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull  = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Pin = LED2_PIN;
  HAL_GPIO_Init(LED2_GPIO_PORT, &GPIO_InitStruct);

  /* -3- Configure IOs in input mode to read de PIR infrarred sensor and the arming signal */
  GPIO_InitStruct.Mode  = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull  = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Pin = PRES_PIN;
  HAL_GPIO_Init(PRES_PORT, &GPIO_InitStruct);

  GPIO_InitStruct.Mode  = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull  = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Pin = ARM_PIN;
  HAL_GPIO_Init(ARM_PORT, &GPIO_InitStruct);

  /* -3- Configure External line 13 (connected to PC.13 pin) and line 4 (connected to PA.4 pin) in interrupt mode */
  EXTI15_10_IRQHandler_Config();
  EXTI4_IRQHandler_Config();

  /* -4- Configure TIM2 to generate a PWM signal to drive the alarm */
  BUZZER_Init();

  /* -5- Create RTOS task and start the scheduler */
  xTaskCreate(domoticSysTask, "domoticSysTask", 70, NULL, 0, &domoticSysTask_Handle);
  vTaskStartScheduler();
}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follows :
  *            System Clock source            = PLL (MSI)
  *            SYSCLK(Hz)                     = 80000000
  *            HCLK(Hz)                       = 80000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 1
  *            APB2 Prescaler                 = 1
  *            MSI Frequency(Hz)              = 4000000
  *            PLL_M                          = 1
  *            PLL_N                          = 40
  *            PLL_R                          = 2
  *            PLL_P                          = 7
  *            PLL_Q                          = 4
  *            Flash Latency(WS)              = 4
  * @param  None
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};

  /* MSI is enabled after System reset, activate PLL with MSI as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_6;
  RCC_OscInitStruct.MSICalibrationValue = RCC_MSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_MSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 40;
  RCC_OscInitStruct.PLL.PLLR = 2;
  RCC_OscInitStruct.PLL.PLLP = 7;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if(HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }
  
  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;  
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;  
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }
}

/**
 * @brief  Configures EXTI line 4 (connected to PA.4 pin) in interrupt mode
 * @param  None
 * @retval None
 */
static void EXTI4_IRQHandler_Config(void)
{
  GPIO_InitTypeDef   GPIO_InitStructure;

  /* Enable GPIOC clock */
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /* Configure PC.13 pin as input floating */
  GPIO_InitStructure.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_InitStructure.Pin = BUTTON_2_PIN;
  HAL_GPIO_Init(BUTTON_2_PORT, &GPIO_InitStructure);

  /* Enable and set EXTI line 4 Interrupt to the lowest priority */
  HAL_NVIC_SetPriority(EXTI4_IRQn, 5, 0);
  HAL_NVIC_EnableIRQ(EXTI4_IRQn);
}

/**
 * @brief  Configures EXTI lines 10 to 15 (connected to PC.13 pin) in interrupt mode
 * @param  None
 * @retval None
 */
static void EXTI15_10_IRQHandler_Config(void)
{
  GPIO_InitTypeDef   GPIO_InitStructure;

  /* Enable GPIOC clock */
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /* Configure PC.13 pin as input floating */
  GPIO_InitStructure.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_InitStructure.Pin = BUTTON_1_PIN;
  HAL_GPIO_Init(BUTTON_1_PORT, &GPIO_InitStructure);

  /* Enable and set EXTI lines 10 to 15 Interrupt to the lowest priority */
  HAL_NVIC_SetPriority(EXTI15_10_IRQn, 5, 0);
  HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);
}

/* domoticSysTask function */
static void domoticSysTask()
{
  TickType_t xLastWakeTime;
  // Task activation period is 200ms.
  const TickType_t xFrequency = 200 / portTICK_PERIOD_MS; 
  // Initialise the xLastWakeTime variable with the current time.
  xLastWakeTime = xTaskGetTickCount();

  fsm_t* alarm_fsm = fsm_new(alarm_tt);
  fsm_t* lights_fsm = fsm_new(lights_tt);
  switch_off(lights_fsm);

  while(1){
    fsm_fire(lights_fsm);
    fsm_fire(alarm_fsm);
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
  }
}

/* Guard functions */
static int button_pressed(fsm_t* this)
{
  return button;
}

static int timer_finished(fsm_t* this)
{
  if( xTaskGetTickCount() >= timeout ) return 1;
  return 0;
}

static int alarm_armed(fsm_t* this)
{
  return HAL_GPIO_ReadPin(ARM_PORT, ARM_PIN);
}

static int alarm_disarmed(fsm_t* this)
{
  return !(HAL_GPIO_ReadPin(ARM_PORT, ARM_PIN));
}

static int presence_detected(fsm_t* this)
{
  return HAL_GPIO_ReadPin(PRES_PORT, PRES_PIN);
}

/* Output functions */
static void switch_on(fsm_t* this)
{
  button = 0;
  timeout = xTaskGetTickCount() + TIMEOUT;
  HAL_GPIO_WritePin(LED2_GPIO_PORT, LED2_PIN, GPIO_PIN_SET);
}

static void switch_off(fsm_t* this)
{
  HAL_GPIO_WritePin(LED2_GPIO_PORT, LED2_PIN, GPIO_PIN_RESET);
}

static void alarm(fsm_t* this)
{
  buzzerEnableBuzzer();
}

static void stop_alarm(fsm_t* this)
{
  buzzerDisableBuzzer();
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  TickType_t now = xTaskGetTickCount();
  if (now - last > (pdMS_TO_TICKS(200))) {
    last = now;
    if ((GPIO_Pin == BUTTON_1_PIN)||(GPIO_Pin == BUTTON_2_PIN))
    {
      button = 1;
    }
  }
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(char *file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
