#Note that := means stuff is expanded during assignment
NAME = lib_ledalert_stm32f100
BUILD_DIR = build/

TARGET = $(BUILD_DIR)$(NAME).a

SOURCES_HAL = adc.c dma.c gpio.c systick.c timer.c usart.c ws2812.c
SOURCES_UTIL = filter.c timeutils.c
SOURCES = $(SOURCES_HAL:%=hal/%) $(SOURCES_UTIL:%=util/%)

OBJECTS = $(SOURCES:%.c=$(BUILD_DIR)%.o)

LIBS = $(LIBOPENCM3_LIB)


SUB_BUILD_DIRS = $(BUILD_DIR)hal $(BUILD_DIR)util

vpath %.c src

INCLUDE_DIRS = inc $(LIBOPENCM3_INCLUDES)


default: $(TARGET)


$(TARGET): $(SUB_BUILD_DIRS) $(OBJECTS) $(LIBS)
	$(AR) rcs $@ $(OBJECTS) 

$(BUILD_DIR)hal:
	mkdir -p $@

$(BUILD_DIR)util:
	mkdir -p $@

include mk/libopencm3-settings.mk
include mk/common.mk

.PHONY: default