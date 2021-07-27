#!/bin/bash

arm-none-eabi-as -g -o def_map.o def_map.s
arm-none-eabi-as -g -o vec_tab.o vec_tab.s
arm-none-eabi-as -g -o led_init.o led_init.s
arm-none-eabi-as -g -o rcc_init.o rcc_init.s
arm-none-eabi-as -g -o led_flash.o led_flash.s
arm-none-eabi-as -g -o wait.o wait.s

arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o main.o main.c

arm-none-eabi-ld -o main.elf -T link_map.ld \
  def_map.o vec_tab.o rcc_init.o led_init.o led_flash.o wait.o main.o

arm-none-eabi-objcopy main.elf main.bin -O binary

st-flash write ./main.bin 0x08000000
