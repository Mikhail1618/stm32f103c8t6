.thumb
.syntax unified
.cpu cortex-m3

.global vectors_table
.global STACKINIT
.global main
.global nmi_fault
.global hard_fault
.global memory_fault
.global bus_fault
.global usage_fault

.text


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
