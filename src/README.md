# led

### Linux:

```
arm-none-eabi-nm main.o
```
```
arm-none-eabi-size -A main.o
```
hexdump -C main.bin
```

#### debug:

```
st-util
```
```
arm-none-eabi-gdb <main.elf>
```
```
    symbol-file ./main.elf
    target extended-remote localhost:4242
    load ./main.elf
```
    stepi, break, info reg, info breakpoints, list, continue

#### example:
```
    break main
    break led_flash
    continue
    next
```
