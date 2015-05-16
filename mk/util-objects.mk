BUILD_DIR = build/

SOURCES = filter.c timeutils.c
OBJECTS = $(SOURCES:%.c=$(BUILD_DIR)%.o)


INCLUDE_DIRS = inc/util

vpath %.c src/util


default: $(BUILD_DIR) $(OBJECTS)

include mk/common.mk
