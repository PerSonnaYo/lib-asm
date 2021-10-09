		section	.text
		global	_ft_list_remove_if

%macro push_save 0
		push rdi
		push rsi
		push rdx
		push rcx
%endmacro

%macro pop_move 0
		pop rcx
		pop rdx
		pop rsi
		pop rdi
%endmacro

_ft_list_remove_if:
		push rbp
		push rbx
		push r11
		cmp rdi, 0
		jz return
		cmp rsi, 0
		jz return
		cmp rdx, 0
		jz return
		cmp rcx, 0
		jz return
		mov r12, [rdi]
		xor rbx, rbx
		jmp _loop

inc_j:
		mov rbx, r12
		mov r12, rbp

_loop:
		cmp r12, 0
		jz return
		mov rbp, [r12 + 8]

_loop2:
		push_save
		mov rdi, r12
		mov rdi, [rdi + 0]
		call rdx
		pop_move
		cmp rax, 0
		jz swap
		jmp inc_j

swap:
		cmp rbx, 0
		jnz yes
		jz no

yes:
		mov r11, QWORD [r12 + 8]
		mov QWORD [rbx + 8], r11
		jmp delete

no:
		mov r11, [r12 + 8]
		mov [rdi], r11

delete:
		push_save
		mov rdi, r12
		mov rdi, [rdi + 0]
		call rcx
		pop_move
		mov r12, 0
		jmp inc_j

return:
		pop r11
		pop rbx
		pop rbp
		ret