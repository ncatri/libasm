global	_ft_strlen

SECTION	.text

_ft_strlen:
	mov		rax, rdi

iter_char:
	cmp		byte [rax], 0
	jz		finish
	inc		rax
	jmp		iter_char

finish:
	sub		rax, rdi
	ret
