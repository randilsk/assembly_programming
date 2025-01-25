section .data  ;section for storing initialized variables

textlabel db"Hello World",10,0    ;textlabel is the variable name containing the pointer to memory address
                                  ;location. db is definebytes, q0 is in line feed/new line character
                                  ;0 is the null character
size1 equ $ - textlabel            ; $ means current address

section .text

global _start

_start:
	mov rax,4      		;4 is sy_write cal
	mov rbx,1      		;1 is std o/p screen
	mov rcx,textlabel       ;we have the string to print
	mov rdx,size1   	;the size of the variable has to pass
	
	
	int 128
	
	mov rax,1
	mov rbx,0
	int 128

