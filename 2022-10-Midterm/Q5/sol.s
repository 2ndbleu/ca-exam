#==========================================================================
#
#   The PyRISC Project
#
#   -
#
#   Jin-Soo Kim
#   Systems Software and Architecture Laboratory
#   Seoul National University
#   http://csl.snu.ac.kr
#
#==========================================================================


# Q5: (i % 4) == 0
    .text
    .align  2
    .globl  _start
_start:                         # code entry point
    li      a0, 0
    call    f                   #
    ebreak                      # terminate the program

f:
    andi    a1, a0, 3           # 1 inst
    sltiu   a0, a1, 1           # 2 insts (max 2)
    ret


