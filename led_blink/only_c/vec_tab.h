#ifndef VEC_TAB_H
#define VEC_TAB_H

#define STACKINIT 0x20005000

static unsigned long MainStack[64];

extern void Reset_Handler();
extern void NMI_Handler();
extern void HardFault_Handler();
extern void MemoryFault_Handler();
extern void BusFault_Handler();
extern void UsageFault_Handler();

extern void main();

__attribute__ ((section("vectors")))
void (* const VectorArray[]) (void) = {
    (void *)STACKINIT,
    main,
    Reset_Handler,
    NMI_Handler,
    HardFault_Handler,
    MemoryFault_Handler,
    BusFault_Handler,
    UsageFault_Handler,
    (void (*) (void)) ((unsigned long) MainStack + sizeof(MainStack))
};


#endif
