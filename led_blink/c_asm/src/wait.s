.thumb
.syntax unified
.cpu cortex-m3

.global wait

.text

wait:
    push {r0}

    ldr r0, =0xFFFF0

_wait_loop:
    subs r0, r0, 1
    bne _wait_loop

    pop {r0}
    bx lr

.end
