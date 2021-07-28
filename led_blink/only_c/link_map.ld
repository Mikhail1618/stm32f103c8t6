MEMORY
{
        FLASH (RX) : ORIGIN = 0x08000000, LENGTH = 0x20000
        RAM   (RW) : ORIGIN = 0x0, LENGTH = 8K
}

SECTIONS
{
        .text :
        {
                CREATE_OBJECT_SYMBOLS
                *(vectors);
                *(.text);
        } > FLASH
}
