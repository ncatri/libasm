GLOBAL _ft_strcmp

%include 'ft_strlen.s'

SECTION	.text

_ft_strcmp:

.loop:	
		;first, lets do some check if we are at end of string
		cmp		byte [rdi], 0
		je		.endofstrings1
		cmp		byte [rsi], 0
		je		.endofstrings2

		mov		dl, [rdi]
		cmp		dl, byte [rsi]
		jne		.compare
		inc 	rdi
		inc 	rsi
		jmp		.loop

.compare:
		mov		rax, 2
		jmp		.finish

.endofstrings1:
		cmp		byte [rsi], 0
		je		.setequal
		mov		rax, -1			;s2 > s1
		jmp		.finish

.endofstrings2:
		cmp		byte [rdi], 0
		je		.setequal
		mov		rax, 1
		jmp		.finish
		
.setequal:
		mov		rax, 0
		jmp		.finish

.finish:
		ret

