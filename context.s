;;; CONTEXT - A CONSOLE GAME FOR MS-DOS MACHINES WITH CGA GRAPHICS
;;; Assemble using fasm like so: fasm context.s context.com

;;; HEADER
	;; The usual fasm header for .com files
	org 100h
	use16

;;; CONSTANTS
;;; CGA colors, in human-readable form
BLK_WHT = 70h
WHT_BLK = 07h

;;; MACROS
macro macdrawchar char*,color* {
	mov byte[di],char
	inc di
	mov byte[di],color
}

;;; port of the classic termbox function :)
macro setcell x*, y*, char*, color* {
	mov di,(y*80+x)*2
	macdrawchar char, color
}

;;; draw the null-terminated string in es:bx
macro drawstring x*, y*, color* {
	mov di,(y*80+x)*2
	mov ah, [es:bx]
@@:
	mov byte[di],ah
	inc di
	mov byte[di],color
	inc di
	inc bx
	mov ah, [es:bx]
	test ah, ah
	jne @b
}

;;; MAIN
	;; Set the video mode to 3 - 16 color text
	xor ah, ah
	mov al, 3
	int 10h
	;; Set DS to the video memory
	mov ax, 0B800h
	mov ds, ax
	;; Draw an A
	xor di, di
	setcell 2, 2, 'a', 20h
	mov bx, msg
	drawstring 0, 0, BLK_WHT
	;; Wait and exit.
	call waitkey
	mov ah, 4Ch
	int 21h

;;; SUBROUTINES
waitkey:
	xor ah, ah
	int 16h
	ret

;;; DATA
msg: db "Your string goes here",0
