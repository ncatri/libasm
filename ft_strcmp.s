GLOBAL	_ft_strcmp

SECTION	.text


_ft_strcmp:

;		push	rcx		; counter register, full 64bit size (also aligns stack??)
		xor		rcx, rcx		;set counter to zero

.loop:
		mov		r8b, byte [rdi + rcx]	;s1[i] written to 1 byte size r8b
		mov		r9b, byte [rsi + rcx]	;s2[i] written to 1 byte size r9b
		cmp		r8b, 0
		je		.finish
		cmp		r9b, 0
		je		.finish
		cmp		r8b, r9b
		jne		.finish
		inc		rcx
		jmp		.loop

.finish:
		movzx	rax, r8b		; we do the sub comparison with the bytes 
		movzx	rcx, r9b		; in bigger registers to avoid to deal with
		sub		rax, rcx		; overflow.
		ret
