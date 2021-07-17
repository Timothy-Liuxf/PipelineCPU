
    addi $t1, $zero, 1  # $t1 = 1
    addi $t2, $zero, 2  # $t2 = 2
    j jmp1
    j jmp2
    addi $t3, $zero, 3  # skip
jmp2:
    addi $t4, $zero, 4  # skip
jmp1:
    addi $t5, $zero, 5  # $t5 = 5
    addi $a0, $zero, 40 # $a0 = 40
    jr $a0
    
    addi $a1, $a1, 5    # skip
    addi $a2, $a2, 10   # $a2 = 10
    addi $t6, $a2, 10   # $t6 = 20

    jal next
    
    addi $t7, $t6, 10   # skip

next:
    addi $t6, $t6, 5    # $t6 = 25
    addi $t0, $zero, 84
    sw $t0, 8($zero)
    lw $t1, 8($zero)
    jalr $t1
    
    addi $a0, $zero, 1  # skip
    addi $a1, $zero, 2  # skip
    addi $a2, $ra, 3  # $a2 = 79

    add  $zero, $zero, $zero
    add  $zero, $zero, $zero
    add  $zero, $zero, $zero

end:
    j end
