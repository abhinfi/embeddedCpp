################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/aes.c \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform.c \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform_util.c 

C_DEPS += \
./mbedtls/library/aes.d \
./mbedtls/library/platform.d \
./mbedtls/library/platform_util.d 

OBJS += \
./mbedtls/library/aes.o \
./mbedtls/library/platform.o \
./mbedtls/library/platform_util.o 


# Each subdirectory must supply rules for building sources it contributes
mbedtls/library/aes.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/aes.c mbedtls/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
mbedtls/library/platform.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform.c mbedtls/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
mbedtls/library/platform_util.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Middlewares/mbedtls/library/platform_util.c mbedtls/library/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-mbedtls-2f-library

clean-mbedtls-2f-library:
	-$(RM) ./mbedtls/library/aes.d ./mbedtls/library/aes.o ./mbedtls/library/aes.su ./mbedtls/library/platform.d ./mbedtls/library/platform.o ./mbedtls/library/platform.su ./mbedtls/library/platform_util.d ./mbedtls/library/platform_util.o ./mbedtls/library/platform_util.su

.PHONY: clean-mbedtls-2f-library

