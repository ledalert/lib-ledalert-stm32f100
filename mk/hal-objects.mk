#Note that := means stuff is expanded during assignment
BUILD_DIR = build/

SOURCES = adc.c dma.c gpio.c hal.c systick.c timer.c usart.c ws2812.c
OBJECTS = $(SOURCES:%.c=$(BUILD_DIR)%.o)

LIBS = $(LIBOPENCM3_LIB)


INCLUDE_DIRS = inc/hal inc $(LIBOPENCM3_INCLUDES)

vpath %.c src/hal

default: $(BUILD_DIR) $(OBJECTS)


include mk/libopencm3-settings.mk
include mk/common.mk
