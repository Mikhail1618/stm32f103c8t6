.thumb
.syntax unified
.cpu cortex-m3

.global led_flash

.text

led_flash:
    push {r0, r1}

    ldr r1, =GPIOC_ODR
    ldr r0, [r1]

    eor r0, 0x2000

    str r0, [r1]

    pop {r0, r1}

    bx lr

.end
