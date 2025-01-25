;___________________________________________________________
section .data  ;section for storing initialized variables
;___________________________________________________________

textlabel1 db "rax is 1",10,0    	;textlabel is the variable name containing the pointer to memory address
                                  	;location. db is definebytes, q0 is in line feed/new line character
                                  	;0 is the null character
size1 equ $ - textlabel1        	; $ means current address

textlabel2 db "rax is not 1",10,0
size2 equ $-textlabel2

input equ 2


;___________________________________________________________
section .text
;___________________________________________________________

global _start

_start:
	mov rax,1
	cmp rax,input          ; if another cmp is on top before this one it want be considered last cmp will be considered
	je label1
	jne label2

label1:
	mov rax,4      			;4 is sy_write cal
	mov rbx,1      			;1 is std o/p screen
	mov rcx,textlabel1       	;we have the string to print
	mov rdx,size1   		;the size of the variable has to pass
	int 128
	
	mov rax,1
	mov rbx,0
	int 128

label2:
	mov rax,4      			;4 is sy_write cal
	mov rbx,1      			;1 is std o/p screen
	mov rcx,textlabel2       	;we have the string to print
	mov rdx,size2   		;the size of the variable has to pass
	int 128
	
	mov rax,1
	mov rbx,0
	int 128

	




