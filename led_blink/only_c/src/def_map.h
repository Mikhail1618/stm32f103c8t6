#ifndef DEF_MAP_H
#define DEF_MAP_H


#define PORT_C   0x40011000
#define RCC      0x40021000

#define GPIOC_CRL    PORT_C + 0x00
#define GPIOC_CRH    PORT_C + 0x04
#define GPIOC_IDR    PORT_C + 0x08
#define GPIOC_ODR    PORT_C + 0x0C
#define GPIOC_BSRR   PORT_C + 0x10
#define GPIOC_BRR    PORT_C + 0x014
#define GPIOC_LCKR   PORT_C + 0x018

#define RCC_CR         RCC + 0x00
#define RCC_CFGR       RCC + 0x04
#define RCC_CIR        RCC + 0x08
#define RCC_APB2RSTR   RCC + 0x0C
#define RCC_APB1RSTR   RCC + 0x10
#define RCC_AHBENR     RCC + 0x14
#define RCC_APB2ENR    RCC + 0x18
#define RCC_APB1ENR    RCC + 0x1C
#define RCC_BDCR       RCC + 0x20
#define RCC_CSR        RCC + 0x24



#endif // DEF_MAP_H
