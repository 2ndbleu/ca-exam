#==========================================================================
#
#   Project #4: Extending a 5-stage Pipelined RISC-V Processor
#
#   November 28, 2022
# 
#   Seongyeop Jeong (seongyeop.jeong@snu.ac.kr)
#   Jaehoon Shim (mattjs@snu.ac.kr)
#   IlKueon Kang (kangilkueon@snu.ac.kr)
#   Wookje Han (gksdnrwp@snu.ac.kr)
#   Jinsol Park (jinsolpark@snu.ac.kr)
#
#   Systems Software & Architecture Laboratory
#   Dept. of Computer Science and Engineering
#   Seoul National University
#
#==========================================================================

# Example 3: Branch prediction using BTB

    .text
    .align  2
    .globl  _start
_start:                         # code entry point
    lui     sp, 0x80020
    addi    a0, x0, 2
    jal     ra, f
    ebreak
f:
    push    ra
    push    s0
    addi    s0, a0, 0
    addi    a5, x0, 1
    bne     a0, a5, L2
L1:
    addi    a0, s0, 0
    pop     s0
    pop     ra
    jalr    x0, 0(ra)
L2:
    addi    a0, a0, -1
    jal     ra, f
    add     s0, s0, a0
    jal     x0, L1
    


