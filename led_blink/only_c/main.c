#include"vec_tab.h"

extern void led_init();
extern void led_flash();
extern void wait();

void main()
{
    led_init();

    while(1)
    {
        led_flash();
        wait();
    }

    return;
}

void Reset_Handler()
{
    return;
}

void NMI_Handler()
{
    return;
}

void HardFault_Handler()
{
    return;
}

void MemoryFault_Handler()
{
    return;
}

void BusFault_Handler()
{
    return;
}

void UsageFault_Handler()
{
    return;
}
