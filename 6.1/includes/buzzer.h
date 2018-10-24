/**
  ******************************************************************************
  * File Name          : buzzer.h
  * Description        : This file provides code for the configuration
  *                      of the TIM instances to generate a PWM signal
  *                      to drive the external buzzer.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __buzzer_H
#define __buzzer_H
#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32l4xx_hal.h"
#include "main.h"

extern TIM_HandleTypeDef htim2;

void BUZZER_Init(void);
                    
void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);
                
void buzzerEnableBuzzer();
void buzzerDisableBuzzer();

#ifdef __cplusplus
}
#endif
#endif /*__ buzzer_H */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
