$(call inherit-product, vendor/replicant/config/common_mini.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

ifeq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/vertical-320x480.zip:system/media/bootanimation.zip
endif

$(call inherit-product, vendor/replicant/config/telephony.mk)
