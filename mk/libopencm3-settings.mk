#This uggly trick expands ~ to user dir
LIBOPENCM3_LOCATION = $(shell ls -d ~/projekt/libopencm3/)

ifeq ($(origin LIBOPENCM3_LOCATION), undefined)
$(error LIBOPENCM3_LOCATION is not specified!)
endif


LIBOPENCM3_INCLUDES = $(LIBOPENCM3_LOCATION)include
LIBOPENCM3_LIB = $(LIBOPENCM3_LOCATION)lib/libopencm3_stm32f1.a


$(LIBOPENCM3_LOCATION)libstm32f1.a:
	$(MAKE) -C $(LIBOPENCM3_LOCATION) lib/stm32/f1