%include "print.inc"
%include "get.inc"

;______________________________________________________________________________________
section .data
;_______________________________________________________________________________________

textlabel1 db "Enter a character: ",10,0
size1 equ $ - textlabel1

textlabel2 db "you entered a digit ",10,0
size2 equ $ - textlabel2

textlabel3 db "not a digit",10,0
size3 equ $ - textlabel3

;______________________________________________________________________________________
section .bss
;_______________________________________________________________________________________


	result resb 1


;_______________________________________________________________________________________
section .text
;________________________________________________________________________________________

global _start
_start:

	printer textlabel1,size1
	getcharacter result
	
	mov rax,[result]      ; ave to pss the value to a register before passing it to a memory location [result]
	cmp rax,'9'
	jle checkmore
	
Not_digit:
	printer textlabel3,size3
	call exit
	
checkmore: 
	cmp rax,'0'
	jl Not_digit
        printer	textlabel2,size2
        call exit
        
exit: 
	mov rax,1
	mov rbx,0
	int 128
	ret
	