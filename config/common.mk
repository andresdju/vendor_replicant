PRODUCT_BRAND ?= replicant

-include vendor/replicant-security/security.mk

SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

ifneq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/$(TARGET_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
# Allow ADB root access
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.root_access=3
endif

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
    vendor/replicant/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/replicant/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/replicant/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/replicant/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/replicant/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/replicant/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Prebuilt apps
PRODUCT_COPY_FILES +=  \
    vendor/replicant/prebuilt/common/apps/FDroid.apk:system/app/FDroid.apk \
    vendor/replicant/prebuilt/common/apps/TerminalEmulator.apk:system/app/TerminalEmulator.apk \
    vendor/replicant/prebuilt/common/apps/lib/armeabi/libjackpal-termexec2.so:system/lib/libjackpal-termexec2.so \
    vendor/replicant/prebuilt/common/apps/lib/armeabi/libjackpal-androidterm5.so:system/lib/libjackpal-androidterm5.so

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/replicant/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/replicant/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is CM!
PRODUCT_COPY_FILES += \
    vendor/replicant/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/replicant/prebuilt/common/etc/mkshrc:system/etc/mkshrc

# T-Mobile theme engine
include vendor/replicant/config/themes_common.mk

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    Superuser \
    su

# Optional CM packages
PRODUCT_PACKAGES += \
    VoicePlus \
    VideoEditor \
    VoiceDialer \
    SoundRecorder \
    Basic

# Custom CM packages
PRODUCT_PACKAGES += \
    Trebuchet \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    ReplicantWallpapers \
    Apollo \
    CMFileManager \
    LockClock

PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Extra tools in CM
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    vim \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/common

ifeq ($(USE_OPENGL_RENDERER),true)
PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/opengl
else
BOARD_EGL_CFG := vendor/replicant/prebuilt/softwaregl/configs/egl.cfg

PRODUCT_PROPERTY_OVERRIDES += ro.softwaregl=true

PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/softwaregl
endif

PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 2
PRODUCT_VERSION_MAINTENANCE = 2

REPLICANT_VERSION := "replicant-4.2"

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.version=$(REPLICANT_VERSION) \
  ro.modversion=$(REPLICANT_VERSION)

-include vendor/replicant/sepolicy/sepolicy.mk
-include $(WORKSPACE)/hudson/image-auto-bits.mk
