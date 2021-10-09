				section .text
                global _ft_atoi_base

_ft_atoi_base:
                push rbx
                push r12
                mov rbx, 1
                xor rax, rax
                cmp rsi, 0
                jz return1
                cmp rdi, 0
                jz return1
                xor r12, r12

check_base_loop:
                cmp BYTE [rsi + r12], 0
                jz end_base
                mov r8, r12

inc_i:
                inc r8

check_base_loop1:
                cmp BYTE [rsi + r8], 0
                jz base_check
                mov r9b, [rsi + r8]
                cmp BYTE [rsi + r12], r9b
                je return
                jmp inc_i

base_check:
                cmp BYTE [rsi + r12], 32
                jz return
                cmp BYTE [rsi + r12], 43
                jz return
                cmp BYTE [rsi + r12], 45
                jz return
                cmp BYTE [rsi + r12], 9
                jz return
                cmp BYTE [rsi + r12], 10
                jz return
                cmp BYTE [rsi + r12], 13
                jz return
                cmp BYTE [rsi + r12], 11
                jz return
                cmp BYTE [rsi + r12], 12
                jz return
                inc r12
                jmp check_base_loop

end_base:
                cmp r12, 1
                jle return
                xor r13, r13
                jmp is_spaces

inc_space:
                inc r13

is_spaces:
                cmp BYTE [rdi + r13], 32
                jz inc_space
                cmp BYTE [rdi + r13], 9
                jz inc_space
                cmp BYTE [rdi + r13], 10
                jz inc_space
                cmp BYTE [rdi + r13], 13
                jz inc_space
                cmp BYTE [rdi + r13], 11
                jz inc_space
                cmp BYTE [rdi + r13], 12
                jz inc_space
                jmp check_sign

ft_negat:
                inc r13
                neg rbx
                jmp check_sign

ft_pozit:
                inc r13

check_sign:
                cmp BYTE [rdi + r13], 45
                je ft_negat
                cmp BYTE [rdi + r13], 43
                jz ft_pozit
                xor rax, rax
                jmp _atoi

inc_atoi:
                inc r13

_atoi:
                xor r9, r9
                jmp find_char

inc_j:
                inc r9

find_char:
                mov cl, BYTE [rsi + r9]
                cmp cl, 0
                jz return
                cmp [rdi + r13], cl
                jnz inc_j

_atoi_final:
                mul r12
                sub rax, r9
                jmp inc_atoi

return:
                mov rax, rax
                cmp rbx, -1
                jz return1
                neg rax

return1:
                pop r12
                pop rbx
                ret

