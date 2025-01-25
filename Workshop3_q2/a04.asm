;___________________________________________________________
section .data  ;section for storing initialized variables
;___________________________________________________________

	textlabel db "Hello",10,0    	;textlabel is the variable name containing the pointer to memory address
                                  	;location. db is definebytes, q0 is in line feed/new line character
                                  	;0 is the null character
	size1 equ $ - textlabel        	; $ means current address


;___________________________________________________________
section .text
;___________________________________________________________

global _start

_start:
	
	call subroutine1
	mov rax,1
	mov rbx,0
	int 128

subroutine1:	
	mov rax,4      			;4 is sy_write cal
	mov rbx,1      			;1 is std o/p screen
	mov rcx,textlabel	      	;we have the string to print
	mov rdx,size1   		;the size of the variable has to pass
	int 128

	ret   ; when subrouting1 is called above it execute subroutine1 and then it returns to back to thecode


	
	; in a subtrotine a jump is occured(control flow alter to another instruction) but in a necessrilly comes bac (returns) to the same instruction
	;subroutine shoud be called for that use "call" 
	; at the end of subroutine "ret" (return) must be there to come bck to original instruction
	;lable storse address of an instruction
	


