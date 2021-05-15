GLOBAL _ft_strcpy 			; char *strcpy(char *dst, const char *src)


section .text

_ft_strcpy:
		xor	rax, rax			; using rax as the counter

.loop:
		mov bl, byte [rsi + rax]	;using bl as buffer, bl = dst[i]
		mov	[rdi + rax], bl			;src[i] = dst [i]
		cmp bl, 0
		je	.end
		inc rax
		jmp .loop

.end:
		mov	rax, rdi
		ret
