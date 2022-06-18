################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/UART_ReceptionToIdle_CircularDMA/Src/system_stm32l5xx.c 

C_DEPS += \
./Drivers/CMSIS/system_stm32l5xx.d 

OBJS += \
./Drivers/CMSIS/system_stm32l5xx.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/system_stm32l5xx.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/UART_ReceptionToIdle_CircularDMA/Src/system_stm32l5xx.c Drivers/CMSIS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS

clean-Drivers-2f-CMSIS:
	-$(RM) ./Drivers/CMSIS/system_stm32l5xx.d ./Drivers/CMSIS/system_stm32l5xx.o ./Drivers/CMSIS/system_stm32l5xx.su

.PHONY: clean-Drivers-2f-CMSIS

