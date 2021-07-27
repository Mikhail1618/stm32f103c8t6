MEMORY
{
        FLASH (RX) : ORIGIN = 0x08000000, LENGTH = 0x20000
        RAM   (RW) : ORIGIN = 0x0, LENGTH = 8K
}

SECTIONS
{
        .text :
        {
                *(.text);        
        } > FLASH

        .rodata :
        {
                *(.rodata);
                flash_sd = . ;
        } > FLASH

        .bss :
        {
                s_bss = . ;
                *(.bss);
        } > RAM

        .data : AT (flash_sd)
        {
                s_data = . ; 
                *(.data);
        } > RAM

        d_size = SIZEOF(.data);
        b_size = SIZEOF(.bss);
}
