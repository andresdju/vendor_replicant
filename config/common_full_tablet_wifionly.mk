# Inherit common CM stuff
$(call inherit-product, vendor/replicant/config/common_full.mk)

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/dictionaries

ifeq ($(TARGET_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/replicant/prebuilt/common/bootanimation/horizontal-1280x800.zip:system/media/bootanimation.zip
endif
