/**
  ******************************************************************************
  * File Name          : buzzer.c
  * Description        : This file provides code for the configuration
  *                      of the TIM instances to generate a PWM signal
  *                      to drive the external buzzer.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "buzzer.h"

TIM_HandleTypeDef htim2;

/* TIM2 init function */
void BUZZER_Init(void)
{
  TIM_ClockConfigTypeDef sClockSourceConfig;
  TIM_MasterConfigTypeDef sMasterConfig;
  TIM_OC_InitTypeDef sConfigOC;

  htim2.Instance = BUZZ_TIM;
  htim2.Init.Prescaler = 47;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 199;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.RepetitionCounter = 0;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  HAL_TIM_Base_Init(&htim2);
  
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig); 

  HAL_TIM_PWM_Init(&htim2);

  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig);

  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 99;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, BUZZ_CHANNEL);

  HAL_TIM_MspPostInit(&htim2);

}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* tim_baseHandle)
{

  if(tim_baseHandle->Instance==BUZZ_TIM)
  {
    /* TIM2 clock enable */
    BUZZ_TIM_CLK_EN();
  }
}
void HAL_TIM_MspPostInit(TIM_HandleTypeDef* timHandle)
{

  GPIO_InitTypeDef GPIO_InitStruct;
  if(timHandle->Instance==BUZZ_TIM)
  {
    /**TIM2 GPIO Configuration    
    PA0     ------> TIM2_CH1 
    */
    GPIO_InitStruct.Pin = BUZZ_PIN;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
    GPIO_InitStruct.Alternate = BUZZ_AF_TIM;
    HAL_GPIO_Init(BUZZ_PORT, &GPIO_InitStruct);
  }

}

void buzzerEnableBuzzer()
{
  HAL_TIM_PWM_Start(&htim2, BUZZ_CHANNEL);
}

void buzzerDisableBuzzer()
{
  HAL_TIM_PWM_Stop(&htim2, BUZZ_CHANNEL);
}

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
