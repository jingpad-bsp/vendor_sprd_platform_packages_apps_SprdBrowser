#
# Copyright (C) 2014 The Android Open Source Project
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

# Install the prebuilt chromium browser apk.
LOCAL_PATH := $(call my-dir)

my_archs := arm arm64
my_src_arch := $(call get-prebuilt-src-arch, $(my_archs))

include $(CLEAR_VARS)

LOCAL_MODULE := SprdBrowser
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

LOCAL_OVERRIDES_PACKAGES := Browser Browser2

LOCAL_PRODUCT_MODULE := true

LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/ChromePublic.apk

# LOCAL_REQUIRED_MODULES := BookmarkProvider PartnerBookmarksProvider

LOCAL_MODULE_TARGET_ARCH := $(my_src_arch)

LOCAL_MULTILIB := first

LOCAL_LIBS_SRC_PATH_arm64 = prebuilt/arm64/lib/arm64-v8a
LOCAL_LIBS_SRC_PATH_arm = prebuilt/arm/lib/armeabi-v7a

LOCAL_PREBUILT_JNI_LIBS_arm64 := \
    $(LOCAL_LIBS_SRC_PATH_arm64)/crazy.libchrome.so \
    $(LOCAL_LIBS_SRC_PATH_arm64)/libchrome_crashpad_handler.so \
    $(LOCAL_LIBS_SRC_PATH_arm64)/libchromium_android_linker.so

LOCAL_PREBUILT_JNI_LIBS_arm  := \
    $(LOCAL_LIBS_SRC_PATH_arm)/libchrome.so \
    $(LOCAL_LIBS_SRC_PATH_arm)/libchrome_crashpad_handler.so \
    $(LOCAL_LIBS_SRC_PATH_arm)/libchromium_android_linker.so

LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)

