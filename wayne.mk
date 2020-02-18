#
# Copyright (C) 2018 The LineageOS Project
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
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#


WAYNE_PATH := device/xiaomi/wayne-common

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(WAYNE_PATH)/overlay

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Inherit proprietary files
$(call inherit-product, vendor/xiaomi/wayne-common/wayne-common-vendor.mk)

# Inherit properties
$(call inherit-product, $(WAYNE_PATH)/properties.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(WAYNE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(WAYNE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(WAYNE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(WAYNE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(WAYNE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Shims
PRODUCT_PACKAGES += \
    libMiWatermark_shim \
    libcamera_sdm660_shim

# Inherit proprietary files
$(call inherit-product-if-exists, vendor/xiaomi/wayne-common/wayne-common-vendor.mk)
