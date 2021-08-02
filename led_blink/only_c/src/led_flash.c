#include"def_map.h"

void led_flash()
{
    *((unsigned long*)(GPIOC_ODR)) ^= 0x2000;

    return;
}
