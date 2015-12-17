# Inherit common CM stuff
$(call inherit-product, vendor/replicant/config/common.mk)

# Include CM audio files
include vendor/replicant/config/cm_audio.mk

ifeq ($(USE_OPENGL_RENDERER),true)
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers
endif

PRODUCT_PACKAGES += \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Extra tools in CM
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip
