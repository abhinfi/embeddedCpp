################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/aes.c \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform.c \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform_util.c 

C_DEPS += \
./mbedtls/library/aes.d \
./mbedtls/library/platform.d \
./mbedtls/library/platform_util.d 

OBJS += \
./mbedtls/library/aes.o \
./mbedtls/library/platform.o \
./mbedtls/library/platform_util.o 


# Each subdirectory must supply rules for building sources it contributes
mbedtls/library/aes.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/aes.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"mbedtls/library/aes.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
mbedtls/library/platform.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"mbedtls/library/platform.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
mbedtls/library/platform_util.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform_util.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"mbedtls/library/platform_util.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

