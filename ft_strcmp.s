GLOBAL _ft_strcmp

%include 'ft_strlen.s'

SECTION	.text

_ft_strcmp:
		call	_ft_strlen
		mov		rdx, rax
		mov		rsi, rdi
		mov		rdi, 1
		mov		rax, 0x2000004
		syscall
		ret
