j main
j h1

main:
    csrrw x11,mtvec,x10
    csrrw x13,mtvec,x12
    li x1, 1
    li x2, 10
    add x3, x2,x1
    xor x4,x2,x1
    sub x5,x3,x2
    j exit
h1:
    li x10,20
    li x12,25
    csrrw x11,mtvec,x10
    csrrw x13,mtvec,x12
    mret
    nop
    nop
exit:
    j exit