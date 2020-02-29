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

# Inherit from sdm660-common
-include device/xiaomi/sdm660-common/BoardConfigCommon.mk

WAYNE_PATH := device/xiaomi/wayne-common

# Kernel
TARGET_KERNEL_CONFIG := wayne_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(WAYNE_PATH)/configs/manifests/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(WAYNE_PATH)/configs/manifests/vendor_framework_compatibility_matrix.xml

# Recovery
ifeq ($(AB_OTA_UPDATER), true)
TARGET_RECOVERY_FSTAB := $(WAYNE_PATH)/rootdir/etc/fstab_AB.qcom
else
TARGET_RECOVERY_FSTAB := $(WAYNE_PATH)/rootdir/etc/fstab.qcom
endif

# Inherit the proprietary files
-include vendor/xiaomi/wayne-common/BoardConfigVendor.mk
