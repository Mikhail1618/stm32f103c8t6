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
arm-none-eabi-objdump -d main.elf
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
    stepi, break, hbreak <main.s>:<numstr>, del breake <num>, info reg, info breakpoints, list, continue, disassemble
```

#### example(gdb):
```
    break main
    hbreak main.c:13
    hbreak main.c:14
    continue
    next
```
