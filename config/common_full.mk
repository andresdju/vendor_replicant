# Inherit common CM stuff
$(call inherit-product, vendor/replicant/config/common.mk)

PRODUCT_SIZE := full

ifeq ($(USE_OPENGL_RENDERER),true)
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    MagicSmokeWallpapers
endif

PRODUCT_PACKAGES += \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    PhotoPhase

# Themes
PRODUCT_PACKAGES += \
    HexoLibre
