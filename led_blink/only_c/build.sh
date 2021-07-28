#!/bin/bash

#arm-none-eabi-as -g -o led_init.o led_init.s
#arm-none-eabi-as -g -o rcc_init.o rcc_init.s
#arm-none-eabi-as -g -o led_flash.o led_flash.s
#arm-none-eabi-as -g -o wait.o wait.s

arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o main.o main.c
arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o led_flash.o led_flash.c
arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o led_init.o led_init.c
arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o rcc_init.o rcc_init.c
arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o vec_tab.o vec_tab.c
arm-none-eabi-gcc --specs=nosys.specs -mcpu=cortex-m3 -mthumb -O0 -c -g -o wait.o wait.c

arm-none-eabi-ld -o main.elf -T link_map.ld \
  rcc_init.o led_init.o led_flash.o wait.o main.o

arm-none-eabi-objcopy main.elf main.bin -O binary

st-flash write ./main.bin 0x08000000
