# Inherit common CM stuff
$(call inherit-product, vendor/replicant/config/common_mini.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

ifeq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/horizontal-1024x600.zip:system/media/bootanimation.zip
endif
