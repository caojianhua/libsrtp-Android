LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifneq ($(TARGET_ARCH),x86)
    LOCAL_NDK_VERSION := 5
    LOCAL_SDK_VERSION := 9
endif

LOCAL_SRC_FILES := \
    srtp/srtp.c \
    srtp/ekt.c \
    crypto/cipher/cipher.c \
    crypto/cipher/null_cipher.c \
    crypto/cipher/aes.c \
    crypto/cipher/aes_icm.c \
    crypto/cipher/aes_cbc.c \
    crypto/hash/null_auth.c \
    crypto/hash/sha1.c \
    crypto/hash/hmac.c \
    crypto/hash/auth.c \
    crypto/math/datatypes.c \
    crypto/math/stat.c \
    crypto/rng/rand_source.c \
    crypto/rng/prng.c \
    crypto/rng/ctr_prng.c \
    crypto/kernel/err.c \
    crypto/kernel/crypto_kernel.c \
    crypto/kernel/alloc.c \
    crypto/kernel/key.c \
    crypto/ae_xfm/xfm.c \
    crypto/replay/rdb.c \
    crypto/replay/rdbx.c

LOCAL_CFLAGS += \
    -DPOSIX -iquote$(LOCAL_PATH)/crypto/include \
	  -Werror \
		-Wno-ignored-qualifiers \
    -Wno-sign-compare \
    -Wno-missing-field-initializers

LOCAL_C_INCLUDES :=  $(LOCAL_PATH)/include  \
                     $(LOCAL_PATH)/crypto/include/

LOCAL_MODULE:= libsrtp_static
LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_LIBRARY)
