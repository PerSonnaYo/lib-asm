            section .text
            global _ft_strcpy

_ft_strcpy:
            xor rax, rax
            xor rdx, rdx
            cmp rsi, 0
            jz return
            jmp _loop

inc_i:
            inc rax

_loop:
            mov dl, BYTE [rsi + rax]
            mov BYTE [rdi + rax], dl
            cmp dl, 0
            jnz inc_i

return:
            mov rax, rdi
            ret