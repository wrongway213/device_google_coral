#
# Copyright (C) 2020 The LineageOS Project
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

LOCAL_PATH := device/google/coral

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:system/etc/permissions/android.hardware.telephony.euicc.xml

# Google Device
PRODUCT_PACKAGES += \
    SystemUIGoogle

# Lights
PRODUCT_PACKAGES += \
    hardware.google.light@1.0.vendor \

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-aosip

# Partitions
AB_OTA_PARTITIONS += \
    vendor

# Permissions
PRODUCT_COPY_FILES += \
    device/google/coral/permissions/privapp-permissions-aosp-extended.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-aosp-extended.xml

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

# Vendor packages
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    ese_spi_st \
    hardware.google.light@1.0.vendor \
    libcamera2ndk_vendor \
    libcld80211 \
    libcodec2_hidl@1.0.vendor:32 \
    libcodec2_vndk.vendor \
    libdisplayconfig \
    libdrm.vendor \
    libgptutils \
    libjson \
    libmedia_ecoservice.vendor \
    libnetfilter_conntrack:64 \
    libnfnetlink:64 \
    libnos_client_citadel:64 \
    libnos_datagram_citadel:64 \
    libnos_datagram:64 \
    libnosprotos:64 \
    libnos:64 \
    libnos_transport:64 \
    libqti_vndfwk_detect.vendor \
    libsensorndkbridge \
    libstagefright_bufferpool@2.0.1.vendor \
    libtextclassifier_hash.vendor:64 \
    libtinycompress \
    libtinyxml \
    libwifi-hal-qcom \
    nos_app_avb:64 \
    nos_app_keymaster:64 \
    nos_app_weaver:64 \
    sound_trigger.primary.msmnile \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.qti.hardware.display.allocator@3.0.vendor:64 \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.0.vendor
