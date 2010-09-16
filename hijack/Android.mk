LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),shadow)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := hijack.c
LOCAL_MODULE := hijack
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := \
	libbusybox \
	libclearsilverregex \
	libm \
	libcutils \
	libc-ext \
	libc
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_CFLAGS += \
	-DBOARD_HIJACK_UPDATE_BINARY=\"$(BOARD_HIJACK_UPDATE_BINARY)\" \
	-DBOARD_HIJACK_BOOT_UPDATE_ZIP=\"$(BOARD_HIJACK_BOOT_UPDATE_ZIP)\" \
	-DBOARD_HIJACK_RECOVERY_UPDATE_ZIP=\"$(BOARD_HIJACK_RECOVERY_UPDATE_ZIP)\"

ifeq ($(BOARD_HIJACK_LOG_ENABLE),true)
LOCAL_CFLAGS += -DLOG_ENABLE
endif

include $(BUILD_EXECUTABLE)

endif
