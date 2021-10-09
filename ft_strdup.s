			section	.text
			extern	_malloc
            extern _ft_strlen
            extern _ft_strcpy
			global	_ft_strdup

_ft_strdup:
			xor rax, rax
			cmp rdi, 0
			jz return
			call _ft_strlen
			push rdi
			mov rdi, rax
			call _malloc
			cmp rax, 0 
			jz return
			pop rdi
			mov rsi, rdi
			mov rdi, rax
			call _ft_strcpy
			ret

return:
			mov rax, 0
			ret