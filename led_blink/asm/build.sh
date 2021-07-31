#!/bin/bash

build="build"
link="linker"
src="src"

mkdir $build $link $src


for module in main def_map vec_tab led_init led_flash rcc_init wait
do
  arm-none-eabi-as -g -o $build/$module.o $src/$module.s
done


arm-none-eabi-ld -o $build/main.elf -T $link/link_map.ld \
  $build/def_map.o $build/vec_tab.o $build/rcc_init.o $build/led_init.o \
  $build/led_flash.o $build/wait.o $build/main.o

arm-none-eabi-objcopy $build/main.elf $build/main.bin -O binary


st-flash write ./$build/main.bin 0x08000000
