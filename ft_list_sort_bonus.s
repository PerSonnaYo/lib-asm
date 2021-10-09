        global _ft_list_sort
	    section .text

%macro push_save 0
        push rdi
        push rsi
        push rcx
%endmacro

%macro pop_move 0
        pop rcx
		pop rsi
		pop rdi
%endmacro

_ft_list_sort:
		cmp rdi, 0
		je return
		mov rcx, [rdi]
		cmp rcx, 0
		je return
		cmp rsi, 0
		jz return
		jmp _loop

inc_i:
		mov rcx, [rcx + 8]

_loop:
		mov r11, [rcx + 8]
		cmp r11, 0
		jz return
		mov r12, [rdi]
		jmp _loop2

inc_j:
		mov r12, [r12 + 8]

_loop2:
		mov r11, [r12 + 8]
		cmp r11, 0
		jz inc_i
		push_save
		push r12
		mov rdx, rsi
		mov rdi, r12
		mov r13, [r12 + 8]
		mov rsi, [r13 + 0]
		mov rdi, [r12 + 0]
		xor rax, rax
		call rdx
		pop r12
		pop_move
		cmp eax, 0
		jg swap
		jle inc_j

swap:
		mov r8, [r12 + 0]
		mov r13, [r12 + 8]
		mov r9, [r13 + 0]
		mov [r12 + 0], r9
		mov [r13 + 0], r8
		jmp inc_j

return:
		ret