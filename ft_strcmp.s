GLOBAL _ft_strcmp

%include 'ft_strlen.s'

SECTION	.text

_ft_strcmp:
		push	rsi
		
		call	_ft_strlen
		mov		rdx, rax		;putting result of ft_strlen in rdx
		mov		rsi, rdi		;copying first arg of ft_strcmp
		mov		rdi, 1
		mov		rax, 0x2000004
		syscall

		pop		rdi
		call	_ft_strlen
		mov		rdx, rax		;putting result of ft_strlen in rdx
		mov		rsi, rdi		;copying first arg of ft_strcmp
		mov		rdi, 1
		mov		rax, 0x2000004
		syscall

		ret
