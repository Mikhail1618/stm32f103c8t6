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


.thumb
.syntax unified
.cpu cortex-m3
.equ STACKINIT, 0x20005000

.text
  SP:            .word STACKINIT
  RESET:         .word main
  NMI_HANDLER:   .word nmi_fault
  HARD_FAULT:    .word hard_fault
  MEMORY_FAULT:  .word memory_fault
  BUS_FAULT:     .word bus_fault
  USAGE_FAULT:   .word usage_fault + 1


gpio_port_c_rcc_init:
    @ сохраняем регистры в стеке
    push {r0, r1}

    ldr r1, =RCC_CFGR
    ldr r0, =0x5000000

    str r0, [r1]

    mov r0, 0x10

    ldr r1, =RCC_APB2ENR
    str r0, [r1]

    @ возвращаем значения из стека в регистры
    pop {r0, r1}

    @ R14 (LR) = адрес следующей команды в main
    @ возвращаемся в вызвавшую функцию
    bx lr


led_init:
    push {r0, r1}
    push {lr}

    @ вызов функции
    bl gpio_port_c_rcc_init
    pop {lr}

    ldr r1, =GPIOC_CRH
    ldr r0, [r1]

    and r0, r0, 0xFF0FFFFF

    orr r0, r0, 0x200000
    str r0, [r1]

    pop {r0, r1}

    bx lr


led_flash:
    push {r0, r1}

    ldr r1, =GPIOC_ODR
    ldr r0, [r1]

    eor r0, 0x2000

    str r0, [r1]

    pop {r0, r1}

    bx lr


main:
    push {lr}
    bl led_init
    pop {lr}

_main_loop:
    push {lr}
    bl led_flash
    bl wait
    pop {lr}
    b _main_loop

    bx lr

wait:
    push {r0}

    ldr r0, =0xFFFF0

_wait_loop:
    subs r0, r0, 1
    bne _wait_loop

    pop {r0}
    bx lr

nmi_fault:
    bkpt
    bx lr
        
hard_fault:
    bkpt
    bx lr

memory_fault:
    bkpt
    bx lr

bus_fault:
    bkpt
    bx lr

usage_fault:
    bkpt
    bx lr

.end
