################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_hal_msp.c \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_it.c \
../Application/User/syscalls.c \
../Application/User/sysmem.c 

CPP_SRCS += \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/aes_process.cpp \
E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/main.cpp 

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
Application/User/aes_process.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/aes_process.cpp
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"Application/User/aes_process.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/main.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/main.cpp
	arm-none-eabi-g++ "$<" -mcpu=cortex-m33 -std=gnu++14 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"Application/User/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32l5xx_hal_msp.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_hal_msp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32l5xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32l5xx_it.o: E:/software/ST/video/STM32Cube_FW_L5_V1.3.0/Projects/NUCLEO-L552ZE-Q/Examples/UART/AES_UART_ReceptionToIdle_CircularDMA/Src/stm32l5xx_it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32l5xx_it.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/syscalls.o: ../Application/User/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/sysmem.o: ../Application/User/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L552xx -DDEBUG -c -I../../Inc -I../../../../../../../Middlewares/mbedtls/library -I../../../../../../../Middlewares/mbedtls/include -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32L5xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L5xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/STM32L5xx_Nucleo -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/sysmem.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

