.text
main:
    li $v0, 1
    add $a0, $t5, $zero #print
    syscall

li $v0, 10
syscall
