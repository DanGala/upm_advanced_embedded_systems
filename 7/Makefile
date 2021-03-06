#******************************************************************************
# @file      Makefile
# @author    Álvarro Gutiérrez
# @version   V2.0
# @date      04/09/2016
# @copy
# ******************************************************************************

# Project name
PROJECT_NAME=ej7_sema2018

# Directory definition.
RTOS_BASE_PATH = ./
ST_LIB_BASE_PATH = ../lib
ST_LIB_DIR=$(ST_LIB_BASE_PATH)/STM32L4xx_HAL_Driver

RTOS_SOURCE_DIR=$(RTOS_BASE_PATH)FreeRTOS/Source

SOURCE_DIR=./source

# Directory for output files (lst, obj, dep, elf, sym, map, hex, bin etc.).
OUTDIR = Debug
BINDIR = bin

# Toolchain definition.
CC				= arm-none-eabi-gcc
OBJCOPY		= arm-none-eabi-objcopy
OBJDUMP		= arm-none-eabi-size
NM 				= arm-none-eabi-nm
LDSCRIPT	= STM32L476RGTx_FLASH.ld


# should use --gc-sections but the debugger does not seem to be able to cope with the option.
LINKER_FLAGS= \
							-o $(BINDIR)/$(PROJECT_NAME).axf \
							-Xlinker -Map=$(BINDIR)/$(PROJECT_NAME).map \
							-Xlinker --gc-sections \
							
#DEBUG = stabs
#DEBUG = dwarf-2
DEBUG=

# Optimization level, can be [0, 1, 2, 3, s].
# 0 = turn off optimization. s = optimize for size.
# (Note: 3 is not always the best optimization level. See avr-libc FAQ.)
OPT = 0
#OPT = 1
#OPT = 2
#OPT = 3
#OPT = s

STARTUP = startup_stm32l476xx

# Compiler flags definition.
CFLAGS= -g$(DEBUG) \
		-O$(OPT) \
		-T $(LDSCRIPT) \
   	-I includes \
   	-I $(ST_LIB_BASE_PATH)/BSP/STM32L4xx_Nucleo \
   	-I $(ST_LIB_DIR)/Inc \
   	-I $(ST_LIB_BASE_PATH)/CMSIS/Include \
   	-I $(ST_LIB_BASE_PATH)/CMSIS/Device/ST/STM32L4xx/Include \
		-I $(DRIVERS_SOURCE_DIR)/includes \
		-I $(RTOS_SOURCE_DIR)/include \
		-I $(RTOS_SOURCE_DIR)/portable/GCC/ARM_CM4F \
		-I . \
		-D gcc \
		-D STM32L476xx \
		-mthumb \
		-mcpu=cortex-m4 \
		-ffunction-sections \
		-fdata-sections \
		-std=c99 \
		-mfpu=fpv4-sp-d16 \
		-mfloat-abi=softfp \

# Source files
SOURCE=	$(wildcard $(SOURCE_DIR)/*.c) 
		
# ST Library source files.
ST_LIB_SOURCE= $(wildcard $(ST_LIB_DIR)/Src/*.c) \

# FreeRTOS source files.
FREERTOS_SOURCE= \
		$(wildcard $(RTOS_SOURCE_DIR)/*.c) \
		$(RTOS_SOURCE_DIR)/portable/GCC/ARM_CM4F/port.c \
		$(RTOS_SOURCE_DIR)/portable/MemMang/heap_2.c
	
#Add all sources
SOURCE+=$(ST_LIB_SOURCE)
SOURCE+=$(FREERTOS_SOURCE)

# List of all source files without directory and file-extension.
ALLSRCBASE = $(notdir $(basename $(SOURCE)))

# List of all objects files.
OBJS = $(addprefix $(OUTDIR)/, $(addsuffix .o, $(ALLSRCBASE)))

# Define Messages.
# English
MSG_BEGIN = -------- begin --------
MSG_END = --------  end  --------


# Rules definition. ***********************************************************

all: begin gccversion $(OUTDIR)/$(PROJECT_NAME).bin end

$(OUTDIR)/$(PROJECT_NAME).bin : $(PROJECT_NAME).axf
	$(OBJCOPY) $(BINDIR)/$(PROJECT_NAME).axf -O binary $(BINDIR)/$(PROJECT_NAME).bin
	$(OBJCOPY) $(BINDIR)/$(PROJECT_NAME).axf -O elf32-littlearm $(BINDIR)/$(PROJECT_NAME).elf

$(PROJECT_NAME).axf : $(OBJS) $(OUTDIR)/$(STARTUP).o Makefile
	$(CC) $(CFLAGS) $(OUTDIR)/$(STARTUP).o $(OBJS) $(LIBS) $(LINKER_FLAGS) -lm


# Compile: create object files from C source files.
define COMPILE_C_TEMPLATE
$(OUTDIR)/$(notdir $(basename $(1))).o : $(1)
	@echo $$< "->" $$@
	$(CC) -c  $$(CFLAGS) $$< -o $$@
endef
$(foreach src, $(SOURCE), $(eval $(call COMPILE_C_TEMPLATE, $(src))))

$(OUTDIR)/$(STARTUP).o : $(SOURCE_DIR)/$(STARTUP).s Makefile
	$(CC) -c $(CFLAGS) -O1 $(SOURCE_DIR)/$(STARTUP).s -o $(OUTDIR)/$(STARTUP).o

clean :
	rm -f $(OBJS)
	rm -f $(OUTDIR)/*
	rm -f $(BINDIR)/*

log : $(PROJECT_NAME).axf
	$(NM) -n $(BINDIR)/$(PROJECT_NAME).axf > $(OUTDIR)/$(PROJECT_NAME)_SymbolTable.txt
	$(OBJDUMP) --format=SysV $(BINDIR)/$(PROJECT_NAME).axf > $(OUTDIR)/$(PROJECT_NAME)_MemoryListingSummary.txt
	$(OBJDUMP) $(OBJS) > $(OUTDIR)/$(PROJECT_NAME)_MemoryListingDetails.txt

# Eye candy.
begin:
##	@echo
	@echo $(MSG_BEGIN)

end:
	@echo $(MSG_END)
##	@echo

# Display compiler version information.
gccversion :
	@$(CC) --version

$(shell mkdir $(OUTDIR) 2>log)
