    addi $t0, $zero, 2
    addi $t1, $zero, 1
    addi $t2, $zero, 4

    add $t3, $t0, $t1   # $t3 = 3
    add $t4, $t2, $t3   # $t4 = 7
    sub $t5, $t4, $t3   # $t5 = 4
    add $t5, $t5, $t5   # $t5 = 8
    sub $t6, $t5, $t4   # $t6 = 1

    sw $t0, 0($zero)
    lw $t7, 0($zero)    # $t7 = 2
    add $a0, $t7, $t0   # $a0 = 4
    sub $a1, $a0, $t7   # $a1 = 2
    sw $t1, 4($zero)
    lw $t2, 4($zero)    # $t2 = 1
    lw $t3, 4($zero)    # $t3 = 1
    add $t4, $t2, $t3   # $t4 = 2
    addi $t5, $t4, 4    # $t5 = 6
    lw $t6, 0($zero)    # $t6 = 2
    add $t0, $t1, $t5   # $t0 = 7

    add $zero, $zero, $zero
    add $zero, $zero, $zero
    add $zero, $zero, $zero

end:
    j end
