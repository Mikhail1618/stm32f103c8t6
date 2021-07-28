#include"def_map.h"

void gpio_port_c_rcc_init()
{
    //*((unsigned long*)(0x40021000 + 0x04)) = 0x5000000;
    *((unsigned long*)(RCC_CFGR)) = 0x5000000;

    //*((unsigned long*)(0x40021000 + 0x18)) = 0x10;
    *((unsigned long*)(RCC_APB2ENR)) = 0x10;

    return;
}
