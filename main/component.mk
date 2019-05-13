#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)

LWIOT_INSTALL_DIR ?= /opt/lwiot/esp32
CMAKE_DIR = $(COMPONENT_PATH)/../build/cmake-$(BUILD_TYPE)

COMPONENT_ADD_LDFLAGS += -L$(CMAKE_DIR) -L$(LWIOT_INSTALL_DIR)/lib -Wl,--whole-archive -lapp -Wl,--no-whole-archive -llwiot -llwiot-platform
