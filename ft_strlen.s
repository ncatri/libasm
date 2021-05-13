global	_ft_strlen

SECTION	.text

_ft_strlen:
	mov		rax, rdi

iter_char:
	cmp		byte [rax], 0
	je		.finish
	inc		rax
	jmp		iter_char

.finish:
	sub		rax, rdi
	ret
