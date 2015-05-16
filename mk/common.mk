#Uncomment following line for dry run
#TOOLCHAIN = @echo #This comment makes sure there is a trailing space

include mk/toolchain-settings.mk

TARGET ?= $(BUILD_DIR)$(NAME)
TARGET_ELF ?= $(TARGET).elf
TARGET_BIN ?= $(TARGET).bin

CPU_FLAGS = -mthumb -mcpu=cortex-m3 -msoft-float -DSTM32F1
CFLAGS = -std=gnu99 -Os -Wall -fno-common -ffunction-sections -fdata-sections $(CPU_FLAGS) $(INCLUDE_DIRS:%=-I%)


LINK_FLAGS = 	$(CPU_FLAGS) \
				$(LIB_INCLUDES:%=-L%) \
				--static -nostartfiles \
				-T$(LINK_SCRIPT) \
				-Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group



$(BUILD_DIR).placeholder:
	mkdir -p $(BUILD_DIR)
	touch $(BUILD_DIR).placeholder

$(OBJECTS): $(BUILD_DIR)%.o: %.c $(LIBS)
	$(CC) -c $(CFLAGS) -MMD -o $@ $<
	@cp $(BUILD_DIR)$*.d $(BUILD_DIR)$*.P; \
	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' -e '/^$$/ d' -e 's/$$/ :/' < $(BUILD_DIR)$*.d >> $(BUILD_DIR)$*.P; \
	rm -f $(BUILD_DIR)$*.d


clean:
	rm -f $(OBJECTS) $(SOURCES:%.c=$(BUILD_DIR)%.P)

.PHONY: clean

-include $(SOURCES:%.c=$(BUILD_DIR)%.P)

# #Uncomment following line for dry run
# #TOOLCHAIN = @echo #This comment makes sure there is a trailing space

# include mk/toolchain-settings.mk

# CPU_FLAGS = -mthumb -mcpu=cortex-m3 -msoft-float -DSTM32F1
# CFLAGS = -std=gnu99 -Os -Wall -fno-common -ffunction-sections -fdata-sections $(CPU_FLAGS) $(INCLUDE_DIRS:%=-I%)

# LINK_FLAGS = 	$(CPU_FLAGS) \
# 				--static -nostartfiles \
# 				-T$(LINK_SCRIPT) \
# 				-Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group



# $(BUILD_DIR):
# 	mkdir -p $(BUILD_DIR)

# $(OBJECTS): $(BUILD_DIR)%.o: %.c $(LIBS)
# 	$(CC) -c $(CFLAGS) -MMD -o $@ $<
# 	@cp $(BUILD_DIR)$*.d $(BUILD_DIR)$*.P; \
# 	sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' -e '/^$$/ d' -e 's/$$/ :/' < $(BUILD_DIR)$*.d >> $(BUILD_DIR)$*.P; \
# 	rm -f $(BUILD_DIR)$*.d


# clean:
# 	rm -f $(OBJECTS) $(SOURCES:%.c=$(BUILD_DIR)%.P)

# .PHONY: clean

# -include $(SOURCES:%.c=$(BUILD_DIR)%.P)