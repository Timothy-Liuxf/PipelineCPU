begin:

    addi $t0, $zero, 2
    addi $t1, $zero, 1
    addi $t2, $zero, 4
    addi $t3, $zero, 3
    addi $t4, $zero, 8
    add $t5, $t0, $t1   # $t5 = 3
    sub $t6, $t2, $t3   # $t6 = 1
    sll $t0, $t0, 2     # $t0 = 8
    addi $t4, $t2, -4   # $t4 = 0
    sw $t1, 4($zero)
    lw $t5, 4($zero)    # $t5 = 1
    add $zero, $zero, $zero
    add $zero, $zero, $zero
    add $zero, $zero, $zero
    beq $zero, $t5, begin
    add $zero, $zero, $zero
    bne $zero, $zero, begin

    add $zero, $zero, $zero
    add $zero, $zero, $zero
    add $zero, $zero, $zero
end:
    j end
