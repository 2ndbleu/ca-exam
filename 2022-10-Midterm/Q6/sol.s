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


# Q6: i % 7
    .text
    .align  2
    .globl  _start
_start:                         # code entry point
    li      a0, 100
    call    f                   #
    ebreak                      # terminate the program

f:
  # muli    a1, a0, 147
    slli    a1, a0, 3           # a1 =    8* a0
    add     a1, a1, a0          # a1 =    9* a0
    slli    a1, a1, 3           # a1 =   72* a0
    add     a1, a1, a0          # a1 =   73* a0
    slli    a1, a1, 1           # a1 =  146* a0
    add     a1, a1, a0          # a1 =  147* a0
  ##
    srli    a2, a1, 10          # a2 =       a0//7
  # muli    a1, a2, 7
    slli    a1, a2, 1           # a1 =    2*(a0//7)
    add     a1, a1, a2          # a1 =    3*(a0//7)
    slli    a1, a1, 1           # a1 =    6*(a0//7)
    add     a1, a1, a2          # a1 =    7*(a0//7)
  ##
    sub     a0, a0, a1          # a0 = a0-7*(a0//7) ## == a0 % 7
    jalr    x0, 0(ra)           # 13 insts (max 15)


