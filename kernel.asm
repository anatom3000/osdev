; 0x0e : tells the cpu to write the content of al in tty mode
mov ah, 0x0e

; interrupt 0x10 : interrupt specific to video service
; printing "Hello" but painfully since strings are too advanced apparently
mov al, 'H'
int 0x10 ; moves the contents of al in the video memory, as specified by the contents of ah
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; we want 2 consecutive 'l' so we're using al twice
mov al, 'o'
int 0x10

; END OF ACTUAL PROGRAM
; the rest is just bytes to make the program bootable

jmp $ ; '$' means current address => infinite loop
; i might remove this to see what happen when the os halts
; UPDATE : removing it doesn't seem to change anything
; TODO: investigate why we need the infinite loop


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