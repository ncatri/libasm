GLOBAL	_ft_strcmp

SECTION	.text


_ft_strcmp:

		push	rcx		; counter register, full 64bit size (also aligns stack??)
		xor		rcx, rcx		;set counter to zero

.loop:
		mov		al, byte [rdi + rcx]	;s1[i] written to 1st byte of rax
		mov		bl, byte [rsi + rcx]	;s2[i] written to 1st byte of rbx
		cmp		al, 0
		je		.finish
		cmp		bl, 0
		je		.finish
		cmp		al, bl
		jne		.finish
		inc		rcx
		jmp		.loop

.finish:
		sub		rax, rbx				;rax holds the return value
		pop		rcx		
		ret
