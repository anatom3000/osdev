print:
	pusha
	jmp _print_chars

_print_chars: ; bx should contain the string
	mov  al, [bx]

	cmp al, 0
	je _done

	cmp al, 1
	je _print_nl

	mov ah, 0x0e
	int 0x10

	add bx, 1
	jmp _print_chars

_done:
	popa
	ret

_print_nl:
	mov ah, 0x0e
	mov al, 0x0a ; new line char
	int 0x10

	mov al, 0x0d
	int 0x10

	jmp _done

NEWLINE:
	db 1