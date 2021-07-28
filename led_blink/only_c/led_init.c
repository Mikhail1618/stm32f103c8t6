#include"def_map.h"

extern void gpio_port_c_rcc_init();

void led_init()
{
    gpio_port_c_rcc_init();

    *((unsigned long*)(GPIOC_CRH)) &= 0xFF0FFFFF;
    *((unsigned long*)(GPIOC_CRH)) |= 0x200000;

    return;
}
