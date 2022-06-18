################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include mbedtls/library/subdir.mk
-include Drivers/STM32L5xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/STM32L5xx_Nucleo/subdir.mk
-include Application/User/subdir.mk
-include Application/Startup/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
endif

-include ../makefile.defs

BUILD_ARTIFACT_NAME := AES_UART_ReceptionToIdle_CircularDMA
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX := 
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME).$(BUILD_ARTIFACT_EXTENSION)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
AES_UART_ReceptionToIdle_CircularDMA.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
AES_UART_ReceptionToIdle_CircularDMA.list \

OBJCOPY_BIN += \
AES_UART_ReceptionToIdle_CircularDMA.bin \


# All Target
all: main-build

# Main-build Target
main-build: AES_UART_ReceptionToIdle_CircularDMA.elf secondary-outputs

# Tool invocations
AES_UART_ReceptionToIdle_CircularDMA.elf: $(OBJS) $(USER_OBJS) E:\software\ST\video\STM32Cube_FW_L5_V1.3.0\Projects\NUCLEO-L552ZE-Q\Examples\UART\AES_UART_ReceptionToIdle_CircularDMA\STM32CubeIDE\STM32L552ZETX_FLASH.ld
	arm-none-eabi-g++ -o "AES_UART_ReceptionToIdle_CircularDMA.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m33 -T"E:\software\ST\video\STM32Cube_FW_L5_V1.3.0\Projects\NUCLEO-L552ZE-Q\Examples\UART\AES_UART_ReceptionToIdle_CircularDMA\STM32CubeIDE\STM32L552ZETX_FLASH.ld" -Wl,-Map="AES_UART_ReceptionToIdle_CircularDMA.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

AES_UART_ReceptionToIdle_CircularDMA.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "AES_UART_ReceptionToIdle_CircularDMA.list"
	@echo 'Finished building: $@'
	@echo ' '

AES_UART_ReceptionToIdle_CircularDMA.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "AES_UART_ReceptionToIdle_CircularDMA.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents fail-specified-linker-script-missing warn-no-linker-script-specified
.SECONDARY:

-include ../makefile.targets
