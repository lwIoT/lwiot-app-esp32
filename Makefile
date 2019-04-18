#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := esp32-test

LWIOT_INSTALL_DIR ?= /opt/lwiot/esp32
IDF_PATH ?= /opt/esp32-idf

EXTRA_CFLAGS = -I$(LWIOT_INSTALL_DIR)/include
EXTRA_CXXFLAGS = $(EXTRA_CFLAGS) -std=gnu++14

include $(IDF_PATH)/make/project.mk

