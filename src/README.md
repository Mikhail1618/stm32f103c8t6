# led

### Linux:

#### build and load firmware:
```
./build.sh
```

#### check info:
```
arm-none-eabi-nm main.o
```
```
arm-none-eabi-size -A main.o
```
```
hexdump -C main.bin
```

#### debug:

##### start debug server
```
st-util
```

##### start hardware debugger
```
arm-none-eabi-gdb <main.elf>
```

##### work in gdb
```
    symbol-file ./main.elf
    target extended-remote localhost:4242
    load ./main.elf
```

##### other commands
```
    stepi, break, info reg, info breakpoints, list, continue
```

#### example(gdb):
```
    break main
    break led_flash
    continue
    next
```
