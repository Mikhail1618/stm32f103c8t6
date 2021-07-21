MEMORY
{
        FLASH (RX) : ORIGIN = 0x08000000, LENGTH = 0x20000
}

SECTIONS
{
        .text :
        {
                *(.text);        
        } > FLASH               
}
