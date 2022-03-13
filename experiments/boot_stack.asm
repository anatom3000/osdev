[org 0x7c00] ; org mode is actually so simple yet so useful

%macro print 1
	mov al, [%1],
	int 0x10
%endmacro

%macro popm 1
	pop bx
	mov [%1], bl
%endmacro

mov ah, 0x0e ; tty mode

; bp is the bottom of the stack (but the highest address in memory)
; sp is the top of the stack (with the lowest address in memory)
; sp address decrements as we add more data to the stack
; we can only read at the top of the stack, (mov)
; add data on top of the stack (push <data>)
; and remove the highest element of the stack (pop)
mov bp, 0x400
mov sp, bp ; stack size is zero since it's empty

push 'A'
push 'B'
push 'C'

popm 0x100
popm 0x101
popm 0x102

print 0x100
print 0x101
print 0x102


; the standard boot sector stuff
jmp $
times 510-($-$$) db 0
dw 0xaa55