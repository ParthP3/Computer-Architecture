.data
.text
main:
#input N store in $t0
    li $v0, 5
    syscall
    move $t0, $v0
#Allocating N*32 bits of heap memory and storing heap pointer in s3
    li $v0, 9
    li $t4, 32
    mult $t0, $t4
    mflo $t2
    move $a0, $t2
    syscall
    move $s3, $v0
    move $t3, $s3
#Input array values
    li $t1, 0
loop:
    li $v0, 5
    syscall
    sw $v0, ($t3)
    addi $t3, 32
    addi $t1, 1
    bne $t1, $t0, loop


#Merging
#Merging is done with the subarrays of length 2, then 4, then 8 and so on
#To merge I use the upper 16 bits as the 'new' array and replace the lower 16 bits with the upper after the merge
#At any merge step, say at merging 3,5 and 2,4, one pointer t6 is at 3, another, t7 at 2.
#We must take care that t7 doesn't move beyond the array
    li $t5, 1
merge:
    move $t6, $s3
    sll $t7, $t5, 5
    add $t7, $t6, $t7
    li $t1, 0
    move $t9, $t0
    sll $t3, $t5, 1
    div $t9, $t3
    mflo $t9
    mfhi $a0
    bgtz $a0, add1
    j add0
add1:
    addi $t9, 1
add0:
    beq $t9, 0, done
run: 
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    move $t8, $t6
    li $s6, 0
    lw $s4, ($t6)
    sll $s4, $s4, 16
    srl $s4, $s4, 16
    bge $t7, $t3, c4
    j c5
c4:
    blt $t1, $t9, noswap2
c5:
    li $s7, 0
    lw $s5, ($t7)
    sll $s5, $s5, 16
    srl $s5, $s5, 16
newarr:
condition:
    blt $s5, $s4, swap
    j noswap
lw1:
    bge $s6, $t5, lw21 
    lw $s4, ($t6)
    sll $s4, $s4, 16
    srl $s4, $s4, 16
    bge $t7, $t3, noswap
    j condition
lw11:
    bge $s6, $t5, noswap1
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    bge $t6, $t3, noswap1
    lw $s4, ($t6)
    sll $s4, $s4, 16
    srl $s4, $s4, 16
    j noswap2
lw2:
    bge $s7, $t5, noswap1
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    bge $t7, $t3, noswap1
    lw $s5, ($t7)
    sll $s5, $s5, 16
    srl $s5, $s5, 16
    j condition
lw21:
    bge $s7, $t5, noswap1
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    bge $t7, $t3, noswap1
    lw $s5, ($t7)
    sll $s5, $s5, 16
    srl $s5, $s5, 16
    j swap2
swap:
    #swap : put s5 at the top of (t8)
    sll $s5, $s5, 16
    lw $s1, ($t8)
    add $t3, $s1, $s5
    sw $t3, ($t8)
    addi $t8, 32
    addi $t7, 32
    addi $s7, 1
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    bge $s7, $t5, noswap2
    bge $t7, $t3, noswap2
    j lw2
noswap:
    #noswap : put s4 at the top of (t8)
    addi $t6, 32
    addi $s6, 1
    sll $s4, $s4, 16
    lw $s1, ($t8)
    add $t3, $s1, $s4
    sw $t3, ($t8)
    addi $t8, 32
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    bge $s6, $t5, swap2
    j lw1

swap2:
    sll $s5, $s5, 16
    lw $s1, ($t8)
    add $t3, $s1, $s5
    sw $t3, ($t8)
    addi $t8, 32
    addi $t7, 32
    addi $s7, 1
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    j lw21
noswap2:
    addi $t6, 32
    addi $s6, 1
    sll $s4, $s4, 16
    lw $s1, ($t8)
    add $t3, $s1, $s4
    sw $t3, ($t8)
    addi $t8, 32
    sll $t3, $t0, 5
    add $t3, $s3, $t3
    j lw11
noswap1:
    blt $t6, $t5, c6
    j c1
c6:
    blt $s6, $t5, newarr
c1:
    blt $t7, $t3, c2
    j c3
c2: 
    blt $s7, $t5, newarr
c3:
    move $t6, $t7
    sll $t7, $t5, 5
    add $t7, $t6, $t7
    addi $t1, 1
    blt $t1, $t9, run
#Bring down every element of the array 16 bits
    move $t1, $s3
    sll $t3, $t0, 5
    add $t3, $s3, $t3
shift_down:
    lw $s2, ($t1)
    srl $s2, $s2, 16
    sw $s2, ($t1)
    addi $t1, 32
    blt $t1, $t3, shift_down
    sll $t5 $t5, 1
    blt $t5, $t0, merge

#Printing the array
done:
    li $t1, 0
    move $t3, $s3
print:
    lw $t4, ($t3)
    li $v0, 1
    move, $a0, $t4
    syscall
    li $v0, 11
    li $a0, 10
    syscall
    addi $t3, 32
    addi $t1, 1
    bne $t1, $t0, print

    li $v0, 10
    syscall


