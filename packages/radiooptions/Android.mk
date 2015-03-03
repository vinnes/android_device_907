LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := radiooptions

LOCAL_MODULE_TAGS := optional 

LOCAL_SRC_FILES := radio_monitor.c UEventFramework.c 

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \

include $(BUILD_EXECUTABLE)

