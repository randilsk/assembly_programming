;_______________________________________________________________________
section .data  			  ;section for storing initialized variables
;________________________________________________________________________

textlabel1 db "Enter Your Name: ",0    ;textlabel is the variable name containing the pointer to memory address
                                  ;location. db is definebytes, q0 is in line feed/new line character
                                  ;0 is the null character
size1 equ $ - textlabel1            ; $ means current address


textlabel2 db 10,"Hi, ",0
size2 equ $ - textlabel2


;_____________________________________________________________
section .bss 			;block starting with symbo. uninitiallized variables are declared here
;____________________________________________________________
name resb 40			;resb mean reserve bytes



;_____________________________________________________________
section .text
;_____________________________________________________________

global _start

_start:

	call entername
	call readname
	call printhi
	call printname
	call exit
	;writing
entername:
	mov rax,4     		;4 is sy_write cal
	mov rbx,1      		;1 is std o/p screen
	mov rcx,textlabel1       ;we have the string to print
	mov rdx,size1   	;the size of the variable has to pass
	int 128 
	
	;reading
	ret

readname:	
	mov rax, 3		;3 is for read call
	mov rbx, 0		;0 is standard in i/p keybrd
	mov rcx, name		;string for reading
	mov rdx, 40
	int 128
	ret
	;writing again hi name
printhi:
	mov rax,4
	mov rbx,1
	mov rcx,textlabel2
	mov rdx,size2
	int 128 
	ret
	
printname:
	mov rax,4
	mov rbx,1
	mov rcx,name
	mov rdx,40
	int 128 
	ret

exit:
	mov rax,1		;this part is for exiting
	mov rbx,0
	int 128
	ret
	
	
	

