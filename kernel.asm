[org 0x7c00]

mov bx, STARTUP_MESSAGE_0
call print

mov bx, NEWLINE
call print

mov bx, STARTUP_MESSAGE_1
call print

mov bx, STARTUP_MESSAGE_2
call print

mov bx, NEWLINE
call print

mov bx, STARTUP_MESSAGE_3
call print


jmp $

%include "lib/stdio.asm"

STARTUP_MESSAGE_0:
	db "Welcome to my super cool OS !", 1

STARTUP_MESSAGE_1:
	db "Login: anatom", 1

STARTUP_MESSAGE_2:
	db "Password: **********", 1

STARTUP_MESSAGE_3:
	db "$ ", 0

times 510-($-$$) db 0
dw 0xaa55