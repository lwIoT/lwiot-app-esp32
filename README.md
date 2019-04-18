# ESP32 project skeleton

This project skeleton wraps CMake around the default build system provided by the
ESP32 IDF. In order to use this skeleton the following applications / SDK's need to be
installed:

- ESP32 compiler
- ESP32 IDF
- ESP32 lwIoT port

The skeleton expects these packages in the `/opt` directory by default:

- Compiler in `/opt/xtensa-esp32-elf`
- IDF in `/opt/esp32-idf`

The following configuration options are available:

- ESP32_IDF_PATH > Path to ESP32 IDF
- ESP32_TOOLCHAIN_PATH > Path to the ESP32 toolchain

In order to successfully build the application, the following CMake options are required to be set:

- LWIOT_INSTALL_PATH > Path to lwIoT installation
- APP_PATH > Path from build location to application directory
- CMAKE_TOOLCHAIN_FILE > Toolchain file
- CMAKE_BUILD_TYPE > CMake build configuration
- CMAKE_C_COMPILER > Should be set to xtensa-lx106-elf-gcc
- CMAKE_CXX_COMPILER > Should be set to xtensa-lx106-elf-g++

Please note that the build location should be `PROJECT_BUILD_DIR/cmake-${CMAKE_BUILD_TYPE}`.

## Setup

The setup.py script should be run before before compiling. This script copies a lwIoT compatible
configuration file into the working directory.

## Tutorial

```bash
$ python setup.py -s [lwIoT path]
$ make menuconfig
$ cd build
$ mkdir cmake-debug
$ cd cmake-debug
$ cmake -DLWIOT_INSTALL_PATH=/opt/lwiot/esp32 -DAPP_PATH=../.. -DESP32_IDF_PATH=/opt/esp32-idf \
-DESP32_TOOLCHAIN_PATH=/opt/xtensa-esp32-elf -DCMAKE_TOOLCHAIN_FILE=../../cmake/esp32.cmake \
-DCMAKE_C_COMPILER=xtensa-lx106-elf-gcc -DCMAKE_CXX_COMPILER=xtensa-lx106-elf-g++
$ make
$ cd ../..
$ make
```
