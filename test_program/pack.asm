    addi $a0, $zero, 5  # item_num
    addi $t0, $zero, 128
    sub $sp, $sp, $t0
    addi $a1, $sp,  0   # item_list
    addi $a2, $zero, 5  # capcacity

    addi $t0, $zero, 2
    sw $t0, 0($a1)
    addi $t0, $zero, 12
    sw $t0, 4($a1)
    addi $t0, $zero, 1
    sw $t0, 8($a1)
    addi $t0, $zero, 10
    sw $t0, 12($a1)
    addi $t0, $zero, 3
    sw $t0, 16($a1)
    addi $t0, $zero, 20
    sw $t0, 20($a1)
    addi $t0, $zero, 2
    sw $t0, 24($a1)
    addi $t0, $zero, 15
    sw $t0, 28($a1)
    addi $t0, $zero, 1
    sw $t0, 32($a1)
    addi $t0, $zero, 8
    sw $t0, 36($a1)
    
    # cache_ptr: $s0
    # weight: $s1
    # val: $s2

    # allocate space for cache_ptr

    addi $t0, $zero, 256
    sub  $sp, $sp, $t0
    addi $s0, $sp, 0

    # set cache_ptr to 0
    # for (i = 0; i < 64; ++i)
    #   cache_ptr[i] = 0

    # i: $t0
    addi $t0, $zero, 0
set_cache_ptr_zero_for:
    # compare of for-loop
    addi $t1, $zero, 64
    slt $t1, $t0, $t1
    beq $t1, $0, end_set_cache_ptr_zero_for

    # loop: set to zero
    sll $t1, $t0, 2
    add $t1, $t1, $s0
    sw $0, 0($t1)

    addi $t0, $t0, 1
    j set_cache_ptr_zero_for
end_set_cache_ptr_zero_for:

    # i: $t0
    # j: $t1
    addi $t0, $zero, 0
for_i:
    # for_i: judge

    slt $t2, $t0, $a0
    beq $t2, $0, end_for_i

    # for_i: loop

    sll $t2, $t0, 3     # i * 8
    add $t2, $t2, $a1
    lw $s1, 0($t2)      # get $s1: weight
    lw $s2, 4($t2)      # get $s2: val

    # store the address of cache_ptr[j] in $t3
    # and cache[j - weight] in $t4

    sll $t3, $a2, 2     # knap_cap * 4
    add $t3, $t3, $s0

    sub $t4, $a2, $s1   # knap_cap - weight
    sll $t4, $t4, 2
    add $t4, $t4, $s0

    # j = knapsack_capacity
    addi $t1, $a2, 0
for_j:
    # for_j: judge

    slt $t2, $t1, $0
    bne $t2, $0, end_for_j

    # loop_j

    # if (j >= weight)
    slt $t2, $t1, $s1
    bne $t2, $0, end_if_j_geq_weight

    lw $t5, 0($t3)      # cache_ptr[j]
    lw $t6, 0($t4)      # cache_ptr[j - weight]
    add $t6, $t6, $s2   # cache_ptr[j - weight] + val

    slt $t7, $t6, $t5
    beq $t7, $0, put_tsix_to_j
    j end_put_tsix_to_j
put_tsix_to_j:
    sw $t6, 0($t3)
end_put_tsix_to_j:

end_if_j_geq_weight:

    # for_j: --j
    addi $t3, $t3, -4
    addi $t4, $t4, -4
    addi $t1, $t1, -1
    j for_j
end_for_j:

    # for_i: ++i
    addi $t0, $t0, 1
    j for_i
end_for_i:

    # return value

    sll $v0, $a2, 2
    add $v0, $v0, $s0
    lw $v0, 0($v0)


    # show led
    # $s0: cnt
    # $t0: tmp
    # $s1: AN
    # $s2: led
    addi $s0, $zero, 0
show:
    srl $t0, $s0, 12
    andi $t0, $t0, 3
    addi $t1, $zero, 0
    beq $t0, $t1, tmp00
    addi $t1, $zero, 1
    beq $t0, $t1, tmp01
    addi $t1, $zero, 2
    beq $t0, $t1, tmp10
    addi $t1, $zero, 3
    beq $t0, $t1, tmp11

tmp00:
    addi $s1, $zero, 0xE00
    andi $s2, $v0, 0xF
    j endAN
tmp01:
    addi $s1, $zero, 0xD00
    srl $s2, $v0, 4
    and $s2, $s2, 0xF
    j endAN
tmp10:
    addi $s1, $zero, 0xB00
    srl $s2, $v0, 8
    and $s2, $s2, 0xF
    j endAN
tmp11:
    addi $s1, $zero, 0x700
    srl $s2, $v0, 12
    and $s2, $s2, 0xF
    j endAN

endAN:
    addi $t1, $zero, 0
    beq $s2, $t1, led0

    addi $t1, $t1, 1
    beq $s2, $t1, led1
    addi $t1, $t1, 1
    beq $s2, $t1, led2
    addi $t1, $t1, 1
    beq $s2, $t1, led3
    addi $t1, $t1, 1
    beq $s2, $t1, led4
    addi $t1, $t1, 1
    beq $s2, $t1, led5
    addi $t1, $t1, 1
    beq $s2, $t1, led6
    addi $t1, $t1, 1
    beq $s2, $t1, led7
    addi $t1, $t1, 1
    beq $s2, $t1, led8
    addi $t1, $t1, 1
    beq $s2, $t1, led9
    addi $t1, $t1, 1
    beq $s2, $t1, ledA
    addi $t1, $t1, 1
    beq $s2, $t1, ledB
    addi $t1, $t1, 1
    beq $s2, $t1, ledC
    addi $t1, $t1, 1
    beq $s2, $t1, ledD
    addi $t1, $t1, 1
    beq $s2, $t1, ledE
    addi $t1, $t1, 1
    beq $s2, $t1, ledF

led0:
    addi $t4, $zero, 0x00C0
    or $s2, $s1, $t4
    j endled
led1:
    addi $t4, $zero, 0x00F9
    or $s2, $s1, $t4
    j endled
led2:
    addi $t4, $zero, 0x00A4
    or $s2, $s1, $t4
    j endled
led3:
    addi $t4, $zero, 0x00B0
    or $s2, $s1, $t4
    j endled
led4:
    addi $t4, $zero, 0x0099
    or $s2, $s1, $t4
    j endled
led5:
    addi $t4, $zero, 0x0092
    or $s2, $s1, $t4
    j endled
led6:
    addi $t4, $zero, 0x0082
    or $s2, $s1, $t4
    j endled
led7:
    addi $t4, $zero, 0x00F8
    or $s2, $s1, $t4
    j endled
led8:
    addi $t4, $zero, 0x0080
    or $s2, $s1, $t4
    j endled
led9:
    addi $t4, $zero, 0x0090
    or $s2, $s1, $t4
    j endled
ledA:
    addi $t4, $zero, 0x0088
    or $s2, $s1, $t4
    j endled
ledB:
    addi $t4, $zero, 0x0083
    or $s2, $s1, $t4
    j endled
ledC:
    addi $t4, $zero, 0x00C6
    or $s2, $s1, $t4
    j endled
ledD:
    addi $t4, $zero, 0x00A1
    or $s2, $s1, $t4
    j endled
ledE:
    addi $t4, $zero, 0x0086
    or $s2, $s1, $t4
    j endled
ledF:
    addi $t4, $zero, 0x008E
    or $s2, $s1, $t4
    j endled

endled:
    lui $t2, 0x4000
    addi $t2, $t2, 0x0010
    sw $s2, 0($t2)
    addi $s0, $s0, 1

    j show

    # int cnt = 0b0000'0000'0001'1000'0000'0000'0000'0000;
    # while (true)
    # {
    #     int tmp = (cnt >> 18) & 0b11;
    #     int AN;
    #     int v0;
    #     int led;
    #     int out;

    #     if (tmp == 0b00)
    #     {
    #         AN = 0b1110'0000'0000;
    #         led = v0 & 0xF;
    #     }
    #     else if (tmp == 0b01)
    #     {
    #         AN = 0b1101'0000'0000;
    #         led = (v0 >> 4) & 0xF;
    #     }
    #     else if (tmp == 0b10)
    #     {
    #         AN = 0b1011'0000'0000;
    #         led = (v0 >> 8) & 0xF;
    #     }
    #     else
    #     {
    #         AN = 0b0111'0000'0000;
    #         led = (v0 >> 12) & 0xF;
    #     }
        
    #     switch (led)
    #     {
    #     case 0x0: out = AN & 10000000;
    #     }

    #     ++cnt;
    # }
