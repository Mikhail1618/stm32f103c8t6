.thumb
.syntax unified
.cpu cortex-m3
.equ STACKINIT, 0x20005000

.global vectors_table
.global STACKINIT
.global main
.global nmi_fault
.global hard_fault
.global memory_fault
.global bus_fault
.global usage_fault

vectors_table:
  .word STACKINIT
  .word main + 1
  .word nmi_fault + 1
  .word hard_fault + 1
  .word memory_fault + 1
  .word bus_fault + 1
  .word usage_fault + 1
