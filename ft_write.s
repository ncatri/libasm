GLOBAL _ft_write

;extern __errno_location 	(Linux)
extern ___error				;(MacOs)

SECTION .text

_ft_write:
		mov	rax, 0x2000004
		syscall				; if error at write syscall, CARRY flag is set
		jc	.error			; and errno value is returned
		ret

.error:
		push	rax				;we save value of errno in the stack
		call	___error		;returns in rax location of errno
		mov	rdi, rax			;saving errno location in rdi
		pop rax
		mov [rdi], rax			;writing in errno the value
		mov	rax, -1				;in case of error, ft_write returns (-1)
		ret
		
