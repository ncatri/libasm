global		_main

section	.text

_main:		
		lea		rdi, [rel msg]
		mov		rax, rdi

nextchar:
		cmp		byte [rax], 0
		jz		finished
		inc		rax
		jmp		nextchar

finished:
		sub		rax, rdi
		mov		rdx, rax
		mov		rsi, msg
		mov		rdi, 1
		mov		rax, 0x2000004
		syscall

		mov		rdi, 0
		mov		rax, 0x2000001
		syscall

section	.data
msg: db	'Hello, world!', 0ah
