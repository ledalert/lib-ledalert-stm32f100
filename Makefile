NAME = lib_ledalert_stm32f100
BUILD_DIR = build/

TARGET = $(BUILD_DIR)$(NAME).a


$(TARGET):
	$(MAKE) -f mk/hal-objects.mk
	$(MAKE) -f mk/util-objects.mk
	$(CC)


default: $(TARGET)


clean: $(MAKE_INCLUDES)
	$(MAKE) -f mk/hal-objects.mk clean
	$(MAKE) -f mk/util-objects.mk clean


include mk/common.mk

.PHONY: default clean