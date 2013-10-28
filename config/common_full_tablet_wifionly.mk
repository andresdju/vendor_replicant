# Inherit common CM stuff
$(call inherit-product, vendor/replicant/config/common_full.mk)

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Orion.ogg \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

ifeq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/horizontal-1280x800.zip:system/media/bootanimation.zip
endif
