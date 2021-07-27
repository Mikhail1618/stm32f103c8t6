.thumb
.syntax unified
.cpu cortex-m3

.equ PORT_C,  0x40011000
.equ RCC,     0x40021000

.equ GPIOC_CRL,   PORT_C + 0x00
.equ GPIOC_CRH,   PORT_C + 0x04
.equ GPIOC_IDR,   PORT_C + 0x08
.equ GPIOC_ODR,   PORT_C + 0x0C
.equ GPIOC_BSRR,  PORT_C + 0x10
.equ GPIOC_BRR,   PORT_C + 0x014
.equ GPIOC_LCKR,  PORT_C + 0x018

.equ RCC_CR,        RCC + 0x00
.equ RCC_CFGR,      RCC + 0x04
.equ RCC_CIR,       RCC + 0x08
.equ RCC_APB2RSTR,  RCC + 0x0C
.equ RCC_APB1RSTR,  RCC + 0x10
.equ RCC_AHBENR,    RCC + 0x14
.equ RCC_APB2ENR,   RCC + 0x18
.equ RCC_APB1ENR,   RCC + 0x1C
.equ RCC_BDCR,      RCC + 0x20
.equ RCC_CSR,       RCC + 0x24


.global PORT_C
.global RCC

.global GPIOC_CRL
.global GPIOC_CRH
.global GPIOC_IDR
.global GPIOC_ODR
.global GPIOC_BSRR
.global GPIOC_BRR
.global GPIOC_LCKR

.global RCC_CR
.global RCC_CFGR
.global RCC_CIR
.global RCC_APB2RSTR
.global RCC_APB1RSTR
.global RCC_AHBENR
.global RCC_APB2ENR
.global RCC_APB1ENR
.global RCC_BDCR
.global RCC_CSR

.end
