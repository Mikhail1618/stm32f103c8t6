arm-none-eabi-as -g -o main.o main.s
arm-none-eabi-ld -o main.elf -T link_map.ld main.o
arm-none-eabi-objcopy main.elf main.bin -O binary
st-flash write ./main.bin 0x08000000
