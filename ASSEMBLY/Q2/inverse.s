.data
space: .asciiz "\n"
.text
main:
    li $v0, 5
    syscall

    move $t2, $v0 #a

    li $v0, 5
    syscall

    move $t3, $v0 #m
    move $t0, $t3

    li $t4, 0x0
    li $t5, 0x1
    li $t1, 0x0
    li $s1, 0x0
    li $s2, 0x0
    li $s3, 0x0
    li $s6, 0x0

    div $t3, $t2
    mflo $s1
    mfhi $t6
    move $t3, $t2
    move $t2, $t6 

    div $t3, $t2
    mflo $s2
    mfhi $t6
    move $t3, $t2
    move $t2, $t6
    addi $v0, $zero, 4  

loop:
    div $t3, $t2
    mflo $s3
    mfhi $t6
    move $t3, $t2
    move $t2, $t6
    li $s6, 0
    li $s7, 0
    bne $s1, 0, loop_mult
    j done
loop_mult:
    bge $s6, 1073741824, modify
    j normal
modify:
    sub $s6, $s6, $t0
    bge $s6, 0, modify
normal:
    add $s6, $s6, $t5
    addi $s7, 1
    bne $s7, $s1, loop_mult
done:
    sub $s0, $t4, $s6
    div $s0, $t0
    mfhi $t1
    move $t4, $t5
    move $t5, $t1
    move $s1, $s2
    move $s2, $s3
    bge $t5, 0, normal_mod
    blt $t5, 0, special_mod
special_mod:
    add $t5, $t5, $t0
    blt $t5, 0, special_mod
normal_mod:
    bne $t6, 0x0, loop

ans: 
    li $s6, 0
    li $s7, 0
    bne $s1, 0, loop_mult1
    j done1
loop_mult1:
    bge $s6, 1073741824, modify1
    j normal1
modify1:
    sub $s6, $s6, $t0
    bge $s6, 0, modify1
normal1:
    add $s6, $s6, $t5
    addi $s7, 1
    bne $s7, $s1, loop_mult1
done1:
    sub $s0, $t4, $s6
    div $s0, $t0
    mfhi $t1
    move $t4, $t5
    move $t5, $t1
    bge $t5, 0, normal_mod1
    blt $t5, 0, special_mod1
special_mod1:
    add $t5, $t5, $t0
    blt $t5, 0, special_mod1
normal_mod1:
    li $v0, 1
    add $a0, $t5, $zero #print
    syscall

    li $v0, 10
    syscall
