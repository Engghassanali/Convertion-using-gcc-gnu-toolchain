main:
    li a0, 4
    li a1, 0
    call factorial
result:
    mv a1, a2
    j stop
factorial:
li a2, 1
li a5, 1
Loop:
    ble a0,a5,result
    call addition
backfact:
    mv a2, a4
    addi a0,a0,-1
    j Loop
addition:
    li a3, 0
    li a4, 0
Loop1:
    bge a3, a2, backfact
    add a4, a4, a0
    addi a3, a3, 1
    j Loop1
stop:
    j stop