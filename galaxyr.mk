#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).

# Discard inherited values and use our own instead.
PRODUCT_NAME := galaxyr
PRODUCT_DEVICE := galaxyr
PRODUCT_MODEL := GT-I9103

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxyr/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    HoloSpiralWallpaper \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    libOmxVidEnc \
    sec_touchscreen.kcm \
    dexpreopt \
    com.android.future.usb.accessory \
    galaxyrSettings \
    SamsungServiceMode \
    Torch \
    FM \
    Galaxy4 \
    NoiseField \
    PhaseBeam \
    Camera \
    librs_jni

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

# HAL
PRODUCT_PACKAGES += \
    sensors.n1 \
    lights.n1 \
    gps.tegra \
    camera.tegra \
    gralloc.tegra \
    hwcomposer.tegra \
    audio.primary.n1 \
    audio_policy.n1 \
    audio.a2dp.default

# Set true if you want .odex files
DISABLE_DEXPREOPT := false

# INIT-scripts
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/lpm.rc:root/lpm.rc \
    device/samsung/galaxyr/init.rc:root/init.rc \
    device/samsung/galaxyr/init.n1.rc:root/init.n1.rc \
    device/samsung/galaxyr/init.n1.usb.rc:root/init.n1.usb.rc \
    device/samsung/galaxyr/ueventd.n1.rc:root/ueventd.n1.rc

# Prebuilt modules
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/prebuilt/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/galaxyr/prebuilt/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/galaxyr/prebuilt/Si4709_driver.ko:root/lib/modules/Si4709_driver.ko \
    device/samsung/galaxyr/prebuilt/modules.dep:root/lib/modules/modules.dep \
    device/samsung/galaxyr/prebuilt/cbd:root/sbin/cbd

# Vold and Storage
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/vold.fstab:system/etc/vold.fstab

# Wifi, BT
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/gps.conf:system/etc/gps.conf \
    device/samsung/galaxyr/configs/sirfgps.conf:system/etc/sirfgps.conf

# Media
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/galaxyr/configs/media_codecs.xml:system/etc/media_codecs.xml

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/audio_policy.conf:system/etc/audio_policy.conf

# OMX
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/somxreg.conf:system/etc/somxreg.conf

# Camera
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/nvcamera.conf:system/etc/nvcamera.conf

# Shell and busybox
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/configs/bashrc:system/etc/bash/bashrc \
    device/samsung/galaxyr/configs/mkshrc:system/etc/mkshrc \
    device/samsung/galaxyr/configs/busybox.fstab:system/etc/fstab

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/galaxyr/usr/keylayout/Broadcom_Bluetooth_HID.kl:system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
    device/samsung/galaxyr/usr/keylayout/Logitech_USB_Receiver.kl:system/usr/keylayout/Logitech_USB_Receiver.kl \
    device/samsung/galaxyr/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxyr/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/galaxyr/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/galaxyr/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin:system/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin \
    device/samsung/galaxyr/usr/keychars/Logitech_USB_Receiver.kcm.bin:system/usr/keychars/Logitech_USB_Receiver.kcm.bin \
    device/samsung/galaxyr/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/samsung/galaxyr/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/galaxyr/usr/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    device/samsung/galaxyr/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    device/samsung/galaxyr/usr/keychars/sec_touchscreen.kcm.bin:system/usr/keychars/sec_touchscreen.kcm.bin

# IDC files
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Overlay to set device specific parameters
DEVICE_PACKAGE_OVERLAYS := device/samsung/galaxyr/overlay

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.board.platform=tegra \
    ro.telephony.sends_barcount=1 \
    ro.com.android.dataroaming=false \
    dalvik.vm.heapsize=64m \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 \
    persist.sys.vold.switchexternal=1

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=yyyy-MM-dd \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    hwui.render_dirty_regions=false \
    ro.compcache.default=0 \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=true \
    ro.tether.denied=false \
    ro.flash.resolution=1080

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += hdpi

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# $(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available

$(call inherit-product-if-exists, vendor/samsung/galaxyr/galaxyr-vendor-blobs.mk)
