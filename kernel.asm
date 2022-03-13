; procedure running an infinite loop
loop:
	jmp loop

; write zeros to make the program exactly 512 bytes long
; bc the BIOS looks for the "magic number" 
; at the 511th and 512th bytes of the program
; 510 because we need 2 more bytes to enter the "magic number"
; ($-$$) is the size of the previous code
times 510-($-$$) db 0

; the famous "magic number"
; i dunno it must be conventions
; TODO: find out why we use this number
dw 0xaa55