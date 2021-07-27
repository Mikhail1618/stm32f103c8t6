.thumb
.syntax unified
.cpu cortex-m3

.global led_init

.text

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

.end
