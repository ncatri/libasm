global	_main

SECTION .text

_main:
	lea		rdi, [rel msg]
	mov		rax, rdi
	call	strlen

	mov		rdx, rax
	mov		rsi, rdi
	mov		rdi, 1
	mov		rax, 0x2000004
	syscall

	xor		rdi, rdi 
	mov		rax, 0x2000001
	syscall

strlen:
	push	rbx
	mov		rbx, rax

nextchar:
	cmp		byte [rax], 0
	jz		finished
	inc		rax
	jmp		nextchar

finished:
	sub		rax, rbx
	pop		rbx
	ret
	


SECTION	.data
msg:	db	'Hello, whassup guys?' , 0ah
