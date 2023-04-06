        section .text
        global matrix_mult

matrix_mult:
        push rdi                       ; pointer to mat1
        push rsi                       ; row count of mat1
        push rdx                       ; column count of mat1
        push rcx                       ; pointer to mat2
        push r8                        ; row count of mat2
        push r9                        ; column count of mat2
        push r10                       ; pointer to mat3
        push r11
        push r12
        push r13
        push rbx
        push r14

; ; 0-indexing on all matrices
; ; mat1[i][j] = rdi+(rdx*i+j)*8
; ; assume rdx = r8
; ; GOAL - Perform matrix multiplication of mat1, mat2 and save result in mat3

; ; TODO - Fill your code here performing the matrix multiplication in the following order
; ; for i in range(r1) { for j in range(c2) { for k in range(c1) { mat3[i][j] += mat1[i][k]*mat2[k][j] } } }
        mov r11, 0
        mov r12, 0
        mov r13, 0
        mov rbx, 0
li:
        mov r12, 0
lj:
        mov r13, 0

lk:
        mov rax, r11
        mov rbx, rdx
        push rdx
        mul rbx
        mov rbx, rax
        add rbx, r13
        shl rbx, 3
        add rbx, rdi
        mov r14, [rbx]

        mov rax, r13
        mul r9
        add rax, r12
        shl rax, 3
        add rax, rcx
        mov rax, [rax]
        mul r14
        mov rbx, rax

        mov rax, r11
        mul r9
        add rax, r12
        shl rax, 3
        add rax, r10

        mov r14, [rax]
        add r14, rbx
        mov [rax], r14
        pop rdx
        add r13, 1
        cmp r13, rdx
        je dlk
        jmp lk
dlk:
        inc r12
        cmp r12, r9
        je dlj
        jmp lj

dlj:
        inc r11
        cmp r11, rsi
        je done
        jmp li

; ; End of code to be filled
done:
        pop r14
        pop rbx
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret


