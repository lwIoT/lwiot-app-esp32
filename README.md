# ESP32 project skeleton

cmake .. -DLWIOT_INCLUDE_PATH=/opt/lwiot/esp32 -DAPP_PATH=`pwd`/.. -DCMAKE_TOOLCHAIN_FILE=`pwd`/../cmake/esp32.cmake -DCMAKE_C_COMPILER=xtensa-esp32-elf-gcc -DCMAKE_CXX_COMPILER=xtensa-esp32-elf-g++ -DESP32_IDF_PATH=$IDF_PATH
