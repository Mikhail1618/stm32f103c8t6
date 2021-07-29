#!/bin/bash

build="build"
link="linker"
src="src"

mkdir $build $link $src

arm-none-eabi-as -g -o $build/main.o $src/main.s
arm-none-eabi-as -g -o $build/def_map.o $src/def_map.s
arm-none-eabi-as -g -o $build/vec_tab.o $src/vec_tab.s
arm-none-eabi-as -g -o $build/led_init.o $src/led_init.s
arm-none-eabi-as -g -o $build/rcc_init.o $src/rcc_init.s
arm-none-eabi-as -g -o $build/led_flash.o $src/led_flash.s
arm-none-eabi-as -g -o $build/wait.o $src/wait.s

arm-none-eabi-ld -o $build/main.elf -T $link/link_map.ld \
  $build/def_map.o $build/vec_tab.o $build/rcc_init.o $build/led_init.o \
  $build/led_flash.o $build/wait.o $build/main.o

arm-none-eabi-objcopy $build/main.elf $build/main.bin -O binary

st-flash write ./$build/main.bin 0x08000000
