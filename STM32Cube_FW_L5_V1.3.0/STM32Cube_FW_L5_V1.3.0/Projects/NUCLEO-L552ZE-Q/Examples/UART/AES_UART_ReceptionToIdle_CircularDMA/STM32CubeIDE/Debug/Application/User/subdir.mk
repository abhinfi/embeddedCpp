################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_hal_msp.c \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_it.c \
../Application/User/syscalls.c \
../Application/User/sysmem.c 

CPP_SRCS += \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/aes_process.cpp \
D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/main.cpp 

C_DEPS += \
./Application/User/stm32l5xx_hal_msp.d \
./Application/User/stm32l5xx_it.d \
./Application/User/syscalls.d \
./Application/User/sysmem.d 

OBJS += \
./Application/User/aes_process.o \
./Application/User/main.o \
./Application/User/stm32l5xx_hal_msp.o \
./Application/User/stm32l5xx_it.o \
./Application/User/syscalls.o \
./Application/User/sysmem.o 

CPP_DEPS += \
./Application/User/aes_process.d \
./Application/User/main.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/aes_process.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/aes_process.cpp Application/User/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/main.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/main.cpp Application/User/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32l5xx_hal_msp.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_hal_msp.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32l5xx_it.o: D:/youtube_channel/embeddedCpp/STM32Cube_FW_L5_V1.3.0/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_it.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/%.o Application/User/%.su: ../Application/User/%.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User

clean-Application-2f-User:
	-$(RM) ./Application/User/aes_process.d ./Application/User/aes_process.o ./Application/User/aes_process.su ./Application/User/main.d ./Application/User/main.o ./Application/User/main.su ./Application/User/stm32l5xx_hal_msp.d ./Application/User/stm32l5xx_hal_msp.o ./Application/User/stm32l5xx_hal_msp.su ./Application/User/stm32l5xx_it.d ./Application/User/stm32l5xx_it.o ./Application/User/stm32l5xx_it.su ./Application/User/syscalls.d ./Application/User/syscalls.o ./Application/User/syscalls.su ./Application/User/sysmem.d ./Application/User/sysmem.o ./Application/User/sysmem.su

.PHONY: clean-Application-2f-User

