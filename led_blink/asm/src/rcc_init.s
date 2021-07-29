.thumb
.syntax unified
.cpu cortex-m3

.global gpio_port_c_rcc_init

.text

gpio_port_c_rcc_init:
    @ сохраняем регистры в стеке
    push {r0, r1}

    @ получить адрес константы RCC_CFGR и записать в регистр r1
    ldr r1, =RCC_CFGR
    ldr r0, =0x5000000

    @ записать регистр r0 по адресу регистра r1
    str r0, [r1]

    @ загрузить в r0 число 0x10
    mov r0, 0x10
    ldr r1, =RCC_APB2ENR

    str r0, [r1]

    @ возвращаем значения из стека в регистры
    pop {r0, r1}

    @ R14 (LR) = адрес следующей команды в main
    @ возвращаемся в вызвавшую функцию
    bx lr

.end
