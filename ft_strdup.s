GLOBAL	_ft_strdup ; char *strdup(const char *str)

extern _ft_strcpy
extern _ft_strlen
extern _malloc
extern ___error

section .text

_ft_strdup:
		cmp		rdi, 0
		je		.error

		call _ft_strlen	;	stores len(str) in rax
		push rdi		;saving str
		inc	rax			; adding space for \0
		mov	rdi, rax	; 
		call _malloc		; rax now points to new str
		cmp	rax, 0		; check for malloc error
		je	.error		;
		mov	rdi, rax	; malloced str is put in rdi for ft_strcpy
		pop	rsi			; we got back str from stack
		call _ft_strcpy
		ret				; 

.error:
		push	rax			; saving value of errno on stack
		call	___error	;
		mov		rdi, rax
		pop		rax
		mov		[rdi], rax
		xor		rax, rax   	; if error, strdup returns NULL
		ret
