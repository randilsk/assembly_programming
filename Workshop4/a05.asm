%include"repeat.inc"  ;including macro file


;___________________________________________________________________________
section .data  ;section for storing initialized variables
;___________________________________________________________________________

	textlabel db "hello",10,0    	;textlabel is the variable name containing the pointer to memory address
                                  	;location. db is definebytes, q0 is in line feed/new line character
                                  	;0 is the null character
	size1 equ $ - textlabel        	; $ means current address

	textlabel2 db "nice",10,0    	;textlabel is the variable name containing the pointer to memory address
                                  	;location. db is definebytes, q0 is in line feed/new line character
                                  	;0 is the null character
	size2 equ $ - textlabel        	; $ means current address


;__________________________________________________________________________
section .text
;__________________________________________________________________________

global _start

_start:
	
	textprinter textlabel,size1,5				;a macro is called by its name
	textprinter textlabel2,size2,10
	mov rax,1
	mov rbx,0
	int 128
	
	ret   ; when subrouting1 is called above it execute subroutine1 and then it returns to back to thecode


; using macro we can use arguments like in high level programming language functions


	
	


