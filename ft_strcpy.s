GLOBAL _ft_strcpy 			; char *strcpy(char *dst, const char *src)


section .text

_ft_strcpy:
		xor	rax, rax			; using rax as the counter

.loop:
		mov cl, byte [rsi + rax]	;using cl as buffer, cl = dst[i] (bl --> bug)
		mov	[rdi + rax], cl			;src[i] = dst [i]
		cmp cl, 0
		je	.end
		inc rax
		jmp .loop

.end:
		mov	rax, rdi
		ret
