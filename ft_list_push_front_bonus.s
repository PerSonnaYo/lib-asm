			section	.text
			global	_ft_list_push_front
			extern	_malloc

_ft_list_push_front:
			push rsp
			cmp rdi, 0
			jz return
			push rdi
			push rsi
			xor rax, rax
			mov rdi, 16
			call _malloc
			pop rsi
			pop rdi
			cmp rax, 0
			jz return
			mov [rax], rsi
			mov r8, [rdi]
			mov [rax + 8], r8
			mov [rdi], rax

return:
			pop rsp
			ret