#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_COPY_FILES := \
	device/softwinner/907/kernel:kernel \
        device/softwinner/907/prebuilt/lib/modules/ft5x_ts.ko:root/lib/modules/ft5x_ts.ko \
        device/softwinner/907/prebuilt/bin/reboot-recovery.sh:root/sbin/reboot-recovery.sh \
	device/softwinner/907/rootdir/init.rc:root/init.rc \
	device/softwinner/907/rootdir/initlogo.rle:root/initlogo.rle \
	device/softwinner/907/rootdir/init.recovery.sun4i.rc:root/init.recovery.sun4i.rc \
	device/softwinner/907/rootdir/init.sun4i.rc:root/init.sun4i.rc \
        device/softwinner/907/rootdir/fstab.sun4i:root/fstab.sun4i \
	device/softwinner/907/rootdir/init.sun4i.usb.rc:root/init.sun4i.usb.rc \
	device/softwinner/907/rootdir/ueventd.sun4i.rc:root/ueventd.sun4i.rc

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.opengles.version = 131072 \
	debug.sf.hw=1 \
	drm.service.enabled=true \
	debug.egl.hw=1 \

# low memory
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true \
	dalvik.vm.jit.codecachesize=0 \

# Fix Graphics Issues
PRODUCT_PROPERTY_OVERRIDES += \
	ro.zygote.disable_gl_preload=true \
	ro.bq.gpu_to_cpu_unsupported=true \
  
# Dalvik options
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.debug.alloc=0
	dalvik.vm.checkjni=false
	dalvik.vm.dexopt-data-only=1
	dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y
	dalvik.vm.execution-mode=int:jit
	dalvik.vm.verify-bytecode=false
	dalvik.vm.lockprof.threshold=500

PRODUCT_PROPERTY_OVERRIDES += \
	ro.eventproc.start=0 \
        ro.debuggable=1 \
	ro.com.google.locationfeatures=1 \
	ro.kernel.android.checkjni=0 \
	ro.vold.umsdirtyratio=40 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.additionalmounts=/storage/sdcard1 \
	ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
	ro.config.nocheckin=1 \
	persist.sys.vold.switchexternal=0 \
        persist.service.adb.enable=1 \
        keyguard.no_require_sim=true \
	logcat.live=disable \
	media.stagefright.maxsubfont=72 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 \

DEVICE_PACKAGE_OVERLAYS := device/softwinner/907/overlay

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

#Cedarx prebuild lib's from 4.1
#PRODUCT_COPY_FILES += \
	device/softwinner/907/prebuilt/lib/cedarx/libaw_audio.so:system/lib/libaw_audio.so \
	device/softwinner/907/prebuilt/lib/cedarx/libaw_audioa.so:system/lib/libaw_audioa.so \
	device/softwinner/907/prebuilt/lib/cedarx/libCedarA.so:system/lib/libCedarA.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarv.so:system/lib/libcedarv.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarv_adapter.so:system/lib/libcedarv_adapter.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarv_base.so:system/lib/libcedarv_base.so \
	device/softwinner/907/prebuilt/lib/cedarx/libCedarX.so:system/lib/libCedarX.so \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarxbase.so:system/lib/libcedarxbase.so  \
	device/softwinner/907/prebuilt/lib/cedarx/libcedarxosal.so:system/lib/libcedarxosal.so \
	device/softwinner/907/prebuilt/lib/cedarx/libfacedetection.so:system/lib/libfacedetection.so \
	device/softwinner/907/prebuilt/lib/cedarx/librtmp.so:system/lib/librtmp.so \
	device/softwinner/907/prebuilt/lib/cedarx/libstagefright_soft_cedar_h264dec.so:system/lib/libstagefright_soft_cedar_h264dec.so \
	device/softwinner/907/prebuilt/lib/cedarx/libswdrm.so:system/lib/libswdrm.so \
	device/softwinner/907/prebuilt/lib/cedarx/libve.so:system/lib/libve.so \
	
#Cedarx-Crack
#PRODUCT_COPY_FILES += \
	device/softwinner/907/prebuilt/lib/cedarx/libdemux_rmvb.so:system/lib/libdemux_rmvb.so \
	device/softwinner/907/prebuilt/lib/cedarx/librm.so:system/lib/librm.so \
	device/softwinner/907/prebuilt/lib/cedarx/libswa1.so:system/lib/libswa1.so \
	device/softwinner/907/prebuilt/lib/cedarx/libswa2.so:system/lib/libswa2.so \

#Wlan
PRODUCT_PACKAGES += \
	libnetcmdiface \
	dhcpcd.conf

# Device specific settings
PRODUCT_PACKAGES += \
        dispctl \
	#AllwinnerA10Settings \
        #ethernet \

PRODUCT_PACKAGES += \
	librs_jni \
        rild_sun4i

# Bluetooth
#PRODUCT_PACKAGES += \
	libusb


# Hardware libs
PRODUCT_PACKAGES += \
	audio.primary.exDroid \
	audio.a2dp.default \
	audio.usb.default \
        libhealthd.default \
	display.sun4i \
	gralloc.sun4i \
	power.sun4i \
	hwcomposer.exDroid \
	lights.exDroid \
	libaudioutils \
	chat \
        charger \
	u3gmonitor \
	devlistener
	#camera.exDroid

#PRODUCT_PACKAGES += \
	libthirdpartstream \
	libcedarxsftstream \
	libsrec_jni \
	libjpgenc \
	libI420colorconvert.so \
	AWcodecTest \
	libstagefrighthw \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libaw_h264enc \
	
# CedarX libraries
#PRODUCT_PACKAGES += \
	libCedarA \
	libCedarX \
	libcedarv \
        libcedarxbase \
        libcedarxosal \
        libswdrm \
	libcedarv_adapter \
	libve \
	libfacedetection \
	libaw_audio \
	libaw_audioa \
        libcedarv_base \
	libstagefright_soft_cedar_h264dec \
	librtmp

# CyanogenMOD
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# EXT4 Support
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	cpueater

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full
PRODUCT_AAPT_CONFIG := large xlarge hdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_NAME := full_907
PRODUCT_DEVICE := 907

TARGET_SCREEN_HEIGHT := 768
TARGET_SCREEN_WIDTH := 1024
