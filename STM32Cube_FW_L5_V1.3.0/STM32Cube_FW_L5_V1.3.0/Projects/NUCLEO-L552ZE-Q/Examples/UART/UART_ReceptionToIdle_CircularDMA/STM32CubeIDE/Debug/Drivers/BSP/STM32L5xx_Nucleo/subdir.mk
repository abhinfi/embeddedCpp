################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.c 

C_DEPS += \
./Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.d 

OBJS += \
./Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.c Drivers/BSP/STM32L5xx_Nucleo/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32L5xx_Nucleo

clean-Drivers-2f-BSP-2f-STM32L5xx_Nucleo:
	-$(RM) ./Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.d ./Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.o ./Drivers/BSP/STM32L5xx_Nucleo/stm32l5xx_nucleo.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32L5xx_Nucleo

