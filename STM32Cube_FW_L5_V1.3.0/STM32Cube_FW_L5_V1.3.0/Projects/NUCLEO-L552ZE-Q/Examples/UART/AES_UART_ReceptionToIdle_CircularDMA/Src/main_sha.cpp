/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "ring_buffer.hpp"
#include "aes_process.hpp"
#include "sha.hpp"
#include "test.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

UART_HandleTypeDef hlpuart1;
DMA_HandleTypeDef hdma_lpuart1_rx;

/* USER CODE BEGIN PV */
/**
  * @brief Text strings printed on PC Com port for user information
  */

#define BLOCK_SIZE 32

uint8_t aTextInfoStart[] = "\r\nUSART Example : Enter characters to fill reception buffers.\r\n";
uint8_t aTextInfoBufferFull[] = "\r\nRing Buffer : Full.\r\n";

uint8_t aRXBufferUser[RX_BUFFER_SIZE];
RingBuffer<uint8_t, BLOCK_SIZE> UartReceiveRingBuffer;
__IO uint32_t     uwNbReceivedChars;
uint8_t UserSignal;

uint8_t InputMessage[2*BLOCK_SIZE];
uint8_t EncryptedMessage[2*BLOCK_SIZE];
uint8_t DecryptedMessage[2*BLOCK_SIZE];
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ICACHE_Init(void);
static void MX_LPUART1_UART_Init(void);
static void EXTI13_IRQHandler_Config(void);
/* USER CODE BEGIN PFP */
void PrintInfo(UART_HandleTypeDef *huart, uint8_t *String, uint16_t Size);
void StartReception(void);
void UserDataTreatment(UART_HandleTypeDef *huart, uint8_t* pData, uint16_t Size);
void SendUserData(UART_HandleTypeDef *huart);
void SendUserData(UART_HandleTypeDef *huart, uint8_t* data, uint8_t len);
void calculate_sha(unsigned char* in_data, unsigned char* digest, size_t len);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
  /* STM32L5xx HAL library initialization:
       - Systick timer is configured by default as source of time base, but user
         can eventually implement his proper time base source (a general purpose
         timer for example or other time source), keeping in mind that Time base
         duration should be kept 1ms since PPP_TIMEOUT_VALUEs are defined and
         handled in milliseconds basis.
       - Set NVIC Group Priority to 3
       - Low Level Initialization
     */
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ICACHE_Init();
  MX_LPUART1_UART_Init();
  /* -1- Initialize LEDs mounted on NUCLEO-L552ZE-Q C-01 board */
  BSP_LED_Init(LED1);
  /* -2- Configure External line 13 (connected to PC.13 pin) in interrupt mode */
  EXTI13_IRQHandler_Config();
  /* USER CODE BEGIN 2 */
  UserSignal = false;
  /* Initiate Continuous reception */
  StartReception();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  unsigned char digest[32] = {0};
  uint8_t size = 0;
  while (1)
  {
    /* USER CODE END WHILE */
	  while(!UartReceiveRingBuffer.isEmpty())
	  {
		  InputMessage[size] = UartReceiveRingBuffer.get();
		  size++;
		  if(size >= BLOCK_SIZE)
		  {
			  calculate_sha(&InputMessage[0], &digest[0], size);
			  SendUserData(&hlpuart1, digest, size);
			  size = 0;
			  break;
		  }
	  }
    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE0) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 55;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ICACHE Initialization Function
  * @param None
  * @retval None
  */
static void MX_ICACHE_Init(void)
{

  /* USER CODE BEGIN ICACHE_Init 0 */

  /* USER CODE END ICACHE_Init 0 */

  /* USER CODE BEGIN ICACHE_Init 1 */

  /* USER CODE END ICACHE_Init 1 */
  /** Enable instruction cache in 1-way (direct mapped cache)
  */
  if (HAL_ICACHE_ConfigAssociativityMode(ICACHE_1WAY) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_ICACHE_Enable() != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ICACHE_Init 2 */

  /* USER CODE END ICACHE_Init 2 */

}

/**
  * @brief LPUART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_LPUART1_UART_Init(void)
{

  /* USER CODE BEGIN LPUART1_Init 0 */

  /* USER CODE END LPUART1_Init 0 */

  /* USER CODE BEGIN LPUART1_Init 1 */

  /* USER CODE END LPUART1_Init 1 */
  hlpuart1.Instance = LPUART1;
  hlpuart1.Init.BaudRate = 115200;
  hlpuart1.Init.WordLength = UART_WORDLENGTH_8B;
  hlpuart1.Init.StopBits = UART_STOPBITS_1;
  hlpuart1.Init.Parity = UART_PARITY_NONE;
  hlpuart1.Init.Mode = UART_MODE_TX_RX;
  hlpuart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  hlpuart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  hlpuart1.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  hlpuart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  hlpuart1.FifoMode = UART_FIFOMODE_DISABLE;
  if (HAL_UART_Init(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&hlpuart1, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&hlpuart1, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&hlpuart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN LPUART1_Init 2 */

  /* USER CODE END LPUART1_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMAMUX1_CLK_ENABLE();
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOG_CLK_ENABLE();
  HAL_PWREx_EnableVddIO2();

}

/* USER CODE BEGIN 4 */
/**
  * @brief  Configures EXTI line 13 (connected to PC.13 pin) in interrupt mode
  * @param  None
  * @retval None
  */
static void EXTI13_IRQHandler_Config(void)
{
  GPIO_InitTypeDef   GPIO_InitStructure;


  /* Enable GPIOC clock */
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /* Configure PC.13 pin as input floating */
  GPIO_InitStructure.Mode = GPIO_MODE_IT_FALLING;


  GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_InitStructure.Pin = BUTTON_USER_PIN;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStructure);


  /* Enable and set line 13 Interrupt to the lowest priority */
  HAL_NVIC_SetPriority(EXTI13_IRQn, 2, 0);
  HAL_NVIC_EnableIRQ(EXTI13_IRQn);
}

/**
  * @brief EXTI line detection callbacks
  * @param GPIO_Pin: Specifies the pins connected EXTI line
  * @retval None
  */
void HAL_GPIO_EXTI_Falling_Callback(uint16_t GPIO_Pin)
{
  if (GPIO_Pin == BUTTON_USER_PIN)
  {
    /* Toggle LED1 */
    BSP_LED_Toggle(LED1);
    UserSignal = true;
  }
}

/**
  * @brief  Send Txt information message on UART Tx line (to PC Com port).
  * @param  huart UART handle.
  * @param  String String to be sent to user display
  * @param  Size   Size of string
  * @retval None
  */
void PrintInfo(UART_HandleTypeDef *huart, uint8_t *String, uint16_t Size)
{
  if (HAL_OK != HAL_UART_Transmit(huart, String, Size, 100))
  {
    Error_Handler();
  }
}

void calculate_sha(unsigned char* in_data, unsigned char* digest, size_t len)
{
	  SHA<SHA256> sha;
	  sha.update(in_data, len);
	  sha.finish(digest);
}

/**
  * @brief  This function prints user info on PC com port and initiates RX transfer
  * @retval None
  */
void StartReception(void)
{
  /* Print user info on PC com port */
  PrintInfo(&hlpuart1, aTextInfoStart, COUNTOF(aTextInfoStart));

  /* Initializes Rx sequence using Reception To Idle event API.
     As DMA channel associated to UART Rx is configured as Circular,
     reception is endless.
     If reception has to be stopped, call to HAL_UART_AbortReceive() could be used.

     Use of HAL_UARTEx_ReceiveToIdle_DMA service, will generate calls to
     user defined HAL_UARTEx_RxEventCallback callback for each occurrence of
     following events :
     - DMA RX Half Transfer event (HT)
     - DMA RX Transfer Complete event (TC)
     - IDLE event on UART Rx line (indicating a pause is UART reception flow)
  */
  if (HAL_OK != HAL_UARTEx_ReceiveToIdle_DMA(&hlpuart1, aRXBufferUser, RX_BUFFER_SIZE))
  {
    Error_Handler();
  }
}

/**
  * @brief  This function handles buffer containing received data on PC com port
  * @note   In this example, received data are sent back on UART Tx (loopback)
  *         Any other processing such as copying received data in a larger buffer to make it
  *         available for application, could be implemented here.
  * @note   This routine is executed in Interrupt context.
  * @param  huart UART handle.
  * @param  pData Pointer on received data buffer to be processed
  * @retval Size  Nb of received characters available in buffer
  */
void UserDataTreatment(UART_HandleTypeDef *huart, uint8_t* pData, uint16_t Size)
{
  /*
   * This function might be called in any of the following interrupt contexts :
   *  - DMA TC and HT events
   *  - UART IDLE line event
   *
   * pData and Size defines the buffer where received data have been copied, in order to be processed.
   * During this processing of already received data, reception is still ongoing.
   *
   */
  uint8_t* pBuff = pData;
  uint8_t  i;

  /* Implementation of loopback is on purpose implemented in direct register access,
     in order to be able to echo received characters as fast as they are received.
     Wait for TC flag to be raised at end of transmit is then removed, only TXE is checked */
  for (i = 0; i < Size; i++)
  {
    while (!(__HAL_UART_GET_FLAG(huart, UART_FLAG_TXE))) {}
    huart->Instance->TDR = *pBuff;
    pBuff++;
  }

}

void SendUserData(UART_HandleTypeDef *huart)
{
    while(!UartReceiveRingBuffer.isEmpty())
    {
        while (!(__HAL_UART_GET_FLAG(huart, UART_FLAG_TXE))) {}
        huart->Instance->TDR = UartReceiveRingBuffer.get();
      }
}

void SendUserData(UART_HandleTypeDef *huart, uint8_t* data, uint8_t len)
{
    for(uint8_t i = 0; i < len; i++)
    {
        while (!(__HAL_UART_GET_FLAG(huart, UART_FLAG_TXE))) {}
        huart->Instance->TDR = data[i];
    }
}

/**
  * @brief  User implementation of the Reception Event Callback
  *         (Rx event notification called after use of advanced reception service).
  * @param  huart UART handle
  * @param  Size  Number of data available in application reception buffer (indicates a position in
  *               reception buffer until which, data are available)
  * @retval None
  */
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size)
{
      static uint8_t old_pos = 0;
      uint8_t i;

      /* Check if number of received data in recpetion buffer has changed */
      if (Size != old_pos)
      {
        /* Check if position of index in reception buffer has simply be increased
           of if end of buffer has been reached */
        if (Size > old_pos)
        {
          /* Current position is higher than previous one */
          uwNbReceivedChars = Size - old_pos;
          /* Copy received data in "User" buffer for evacuation */
          for (i = 0; i < uwNbReceivedChars; i++)
          {
              UartReceiveRingBuffer.put(aRXBufferUser[old_pos + i]);
              if(UartReceiveRingBuffer.isFull())
              {
                  //PrintInfo(&hlpuart1, aTextInfoBufferFull, COUNTOF(aTextInfoBufferFull));
              }
          }
        }
        else
        {
          /* Current position is lower than previous one : end of buffer has been reached */
          /* First copy data from current position till end of buffer */
          uwNbReceivedChars = RX_BUFFER_SIZE - old_pos;
          /* Copy received data in "User" buffer for evacuation */
          for (i = 0; i < uwNbReceivedChars; i++)
          {
              UartReceiveRingBuffer.put(aRXBufferUser[old_pos + i]);
              if(UartReceiveRingBuffer.isFull())
              {
                  //PrintInfo(&hlpuart1, aTextInfoBufferFull, COUNTOF(aTextInfoBufferFull));
              }
          }
          /* Check and continue with beginning of buffer */
          if (Size > 0)
          {
            for (i = 0; i < Size; i++)
            {
              UartReceiveRingBuffer.put(aRXBufferUser[i]);
              if(UartReceiveRingBuffer.isFull())
              {
                  //PrintInfo(&hlpuart1, aTextInfoBufferFull, COUNTOF(aTextInfoBufferFull));
              }
            }
            uwNbReceivedChars += Size;
          }
        }
      }
      /* Update old_pos as new reference of position in User Rx buffer that
         indicates position to which data have been processed */
      old_pos = Size;
}


/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  /* Turn LED3 on */
  BSP_LED_On(LED3);
  while (1);
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
