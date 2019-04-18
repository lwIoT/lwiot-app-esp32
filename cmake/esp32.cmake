#
# ESP32 application build file.
#

SET(CMAKE_SYSTEM_NAME Generic)

if(${CMAKE_VERSION} VERSION_GREATER_EQUAL "3.6.0")
    set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
else()
	include(CMakeForceCompiler)

	set(XTENSA_GCC_COMPILER "xtensa-esp32-elf-gcc${CMAKE_EXECUTABLE_SUFFIX}")
	set(XTENSA_GXX_COMPILER "xtensa-esp32-elf-g++${CMAKE_EXECUTABLE_SUFFIX}")
	cmake_force_c_compiler(xtensa-esp32-elf-gcc GNU)
	cmake_force_cxx_compiler(xtensa-esp32-elf-g++ GNU)
endif()

set(HAVE_BIG_ENDIAN False)

if(NOT DEFINED ESP32_TOOLCHAIN_PATH)
    # Set default path.
    set(ESP32_TOOLCHAIN_PATH /opt/xtensa-esp32-elf)
	SET(CMAKE_FIND_ROOT_PATH  /opt/xtensa-esp32-elf)
    message(STATUS "GCC not found, default path will be used: ${ESP32_TOOLCHAIN_PATH}")
else()
    message(STATUS "Toolchain path: ${ESP32_TOOLCHAIN_PATH}")
	SET(CMAKE_FIND_ROOT_PATH ${ESP32_TOOLCHAIN_PATH})
endif()


SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#########################
###  ESP32 SDK setup  ###
#########################

if(NOT DEFINED ESP32_IDF_PATH)
    set(ESP32_IDF_PATH /opt/esp32-idf)
    message(STATUS "Default SDK location will be used: ${ESP32_IDF_PATH}")
else()
    message(STATUS "ESP32 SDK path: ${ESP32_IDF_PATH}")
endif()

set(CMAKE_LIBRARY_PATH ${ESP32_IDF_PATH}/lib)
set(CMAKE_OBJCOPY ${ESP32_TOOLCHAIN_PATH}/bin/xtensa-esp32-elf-objcopy CACHE PATH "")

SET(ESP32_INCLUDE_DIRECTORIES
	${LWIOT_INSTALL_PATH}/include
	${LWIOT_INSTALL_PATH}/config
	
	${ESP32_IDF_PATH}/components/app_trace/include
	${ESP32_IDF_PATH}/components/app_update/include
	${ESP32_IDF_PATH}/components/bootloader_support/include
	${ESP32_IDF_PATH}/components/bt/include
	${ESP32_IDF_PATH}/components/coap/port/include
	${ESP32_IDF_PATH}/components/coap/port/include/coap
	${ESP32_IDF_PATH}/components/coap/libcoap/include
	${ESP32_IDF_PATH}/components/coap/libcoap/include/coap
	${ESP32_IDF_PATH}/components/console
	${ESP32_IDF_PATH}/components/driver/include
	${ESP32_IDF_PATH}/components/esp-tls
	${ESP32_IDF_PATH}/components/esp32/include
	${ESP32_IDF_PATH}/components/esp_adc_cal/include
	${ESP32_IDF_PATH}/components/esp_http_client/include
	${ESP32_IDF_PATH}/components/esp_https_ota/include
	${ESP32_IDF_PATH}/components/ethernet/include
	${ESP32_IDF_PATH}/components/expat/port/include
	${ESP32_IDF_PATH}/components/expat/include/expat
	${ESP32_IDF_PATH}/components/fatfs/src
	${ESP32_IDF_PATH}/components/freertos/include
	${ESP32_IDF_PATH}/components/heap/include
	${ESP32_IDF_PATH}/components/idf_test/include
	${ESP32_IDF_PATH}/components/jsmn/include
	${ESP32_IDF_PATH}/components/json/cJSON
	${ESP32_IDF_PATH}/components/libsodium/libsodium/src/libsodium/include
	${ESP32_IDF_PATH}/components/libsodium/port_include
	${ESP32_IDF_PATH}/components/log/include
	${ESP32_IDF_PATH}/components/lwip/include/lwip
	${ESP32_IDF_PATH}/components/lwip/include/lwip/port
	${ESP32_IDF_PATH}/components/lwip/include/lwip/posix
	${ESP32_IDF_PATH}/components/lwip/apps/ping
	${ESP32_IDF_PATH}/components/mbedtls/port/include
	${ESP32_IDF_PATH}/components/mbedtls/mbedtls/include
	${ESP32_IDF_PATH}/components/mdns/include
	${ESP32_IDF_PATH}/components/micro-ecc/micro-ecc
	${ESP32_IDF_PATH}/components/newlib/platform_include
	${ESP32_IDF_PATH}/components/newlib/include
	${ESP32_IDF_PATH}/components/nghttp/port/include
	${ESP32_IDF_PATH}/components/nghttp/nghttp2/lib/includes
	${ESP32_IDF_PATH}/components/nvs_flash/include
	${ESP32_IDF_PATH}/components/openssl/include
	${ESP32_IDF_PATH}/components/pthread/include
	${ESP32_IDF_PATH}/components/sdmmc/include
	${ESP32_IDF_PATH}/components/smartconfig_ack/include
	${ESP32_IDF_PATH}/components/soc/esp32/include
	${ESP32_IDF_PATH}/components/soc/include
	${ESP32_IDF_PATH}/components/spi_flash/include
	${ESP32_IDF_PATH}/components/spiffs/include
	${ESP32_IDF_PATH}/components/tcpip_adapter/include
	${ESP32_IDF_PATH}/components/ulp/include
	${ESP32_IDF_PATH}/components/vfs/include
	${ESP32_IDF_PATH}/components/wear_levelling/include
	${ESP32_IDF_PATH}/components/wpa_supplicant/include
	${ESP32_IDF_PATH}/components/wpa_supplicant/port/include
	${ESP32_IDF_PATH}/components/xtensa-debug-module/include
	${APP_PATH}/build/include
)

SET(ESP32_CXX_FLAGS 
	"-fno-rtti \
	-ffunction-sections \
	-fdata-sections \
	-fstrict-volatile-bitfields \
	-mlongcalls \
	-nostdlib \
	-fstack-protector \
	-Wall \
	-Werror=all \
	-Wno-error=unused-function \
	-Wno-error=unused-but-set-variable \
	-Wno-error=unused-variable \
	-Wno-error=deprecated-declarations \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-sign-compare \
	-DHAVE_CONFIG_H"
)

SET(ESP32_C_FLAGS 
	"-ffunction-sections \
	-fdata-sections \
	-fstrict-volatile-bitfields \
	-mlongcalls \
	-nostdlib \
	-fstack-protector \
	-Wall \
	-Werror=all \
	-Wno-error=unused-function \
	-Wno-error=unused-but-set-variable \
	-Wno-error=unused-variable \
	-Wno-error=deprecated-declarations \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-sign-compare \
	-Wno-old-style-declaration \
	-DHAVE_CONFIG_H"
)
