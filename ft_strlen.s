			section .text
			global _ft_strlen

_ft_strlen:
            xor rax, rax
            jmp _loop

inc_i:
            inc rax
_loop:
            cmp BYTE [rax + rdi], 0
            jnz inc_i
            ret
            