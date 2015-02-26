
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SHARED_LIBRARIES:= \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libui \
	
# cedarx libraries
LOCAL_LDFLAGS += \
	$(LOCAL_PATH)/libjpgenc.a \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarxosal.so \
	device/softwinner/907/prebuilt/lib/cedarx/libfacedetection.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarv_adapter.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarxbase.so \
	device/softwinner/907/prebuilt/lib/cedarx/libCedarX.so \
	device/softwinner/907/prebuilt/lib/cedarx/libion_alloc.so \
	device/softwinner/907/prebuilt/lib/cedarx/libsunxi_alloc.so \
	
LOCAL_C_INCLUDES += 								\
	frameworks/base/core/jni/android/graphics 		\
	frameworks/native/include/media/openmax			\
	hardware/libhardware/include/hardware			\
	frameworks/native/include						\
	device/softwinner/907/hardware/camera/include_camera \
	$(TARGET_HARDWARE_INCLUDE)

LOCAL_SRC_FILES := \
	HALCameraFactory.cpp \
	PreviewWindow.cpp \
	CallbackNotifier.cpp \
	CCameraConfig.cpp \
	BufferListManager.cpp \
	OSAL_Mutex.c \
	OSAL_Queue.c \
	scaler.c


# choose hal for new driver or old
SUPPORT_NEW_DRIVER := N

ifeq ($(SUPPORT_NEW_DRIVER),Y)
LOCAL_CFLAGS += -DSUPPORT_NEW_DRIVER
LOCAL_SRC_FILES += \
	CameraHardware2.cpp \
	V4L2CameraDevice2.cpp
else
LOCAL_SRC_FILES += \
	CameraHardware.cpp \
	V4L2CameraDevice.cpp
endif


LOCAL_CFLAGS += -D__SUN4I__

ifneq ($(filter polaris%,$(TARGET_DEVICE)),)
LOCAL_CFLAGS += -D__SUNXI__
endif


LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
