            section .text
            global _ft_strcmp

_ft_strcmp:
            xor rax, rax
            xor rbx, rbx
            xor rcx, rcx

_loop:
            mov al, BYTE [rdi + rcx]
            mov bl, BYTE [rsi + rcx]
            cmp al, 0
            jz return
            cmp bl, 0
            jz return
            cmp al, bl
            jnz return
            inc rcx
            jmp _loop

return:
            movzx rax, al
            movzx rbx, bl
            sub rax, rbx
            ret