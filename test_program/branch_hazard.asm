    j begin
begin:
    addi $t0, $zero, 5      # $t0 = 5
    addi $t1, $zero, 5      # $t1 = 5
    beq $t0, $t0, lab1
    addi $t2, $zero, 10     # skip

lab1:
    addi $t3, $t1, 5        # $t3 = 10
    beq $t3, $t1, lab1
    add $t3, $t0, $t3       # $t3 = 15

    sub $t4, $zero, $t3     # $t4 = -15
    blez $t4, lab2
    addi $a0, $zero, 10     # skip

lab2:
    blez $zero, lab3
    addi $a1, $zero, 20     # skip
    
lab3:
    blez $t3, lab3
    add $t0, $t0, $a1       # $t0 = 5
    bltz $zero, lab3
    add $t0, $t0, $t0       # $t0 = 10
    bltz $t0, lab3
    add $t1, $t0, $t1       # $t1 = 15
    bltz $t4, lab4
    add $t1, $t1, $t1       # skip
lab4:
    bgtz $t1, lab4
    j lab1                  # skip
