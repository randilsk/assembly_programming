;stack is a temporary storage area. (FILO  structure) only top of the stack is visible. like a pile of papers
;for 64 bit assembly storage unit size is 64 bit.(8 bytes)

;rsp contains the memry address of the top of the stack. 

%include "printdigit.inc"

;______________________________________________________________________________________________________

section .data
;______________________________________________________________________________________________________


value dq 56 	;db for define byte, dw for define word (2bytes), dd for define double word(4bytes), dq for quadbyte(8byte)




;______________________________________________________________________________________________________

section .bss
;______________________________________________________________________________________________________

digit resw 1 
var1 resq 1





;______________________________________________________________________________________________________

section .text
;______________________________________________________________________________________________________

global _start
_start:

	push 1  	; qword is use to specify the si ze as we hve assign dq for above 
	push 2		; we can push from a register or from memory
	push 3
	mov rax,[rsp]   ; does not remove the top of the stack. know as peeking stack pointer points to the top of the stack  
	call printraxdigit
	
	pop rdi 	; can be popped in to a register or memry
	mov rax,[rsp] 
	call printraxdigit
	
	pop qword[var1]
	mov rax,[rsp] 
	call printraxdigit
	
	
	mov rax, rdi
	mul qword[var1]          ; rax=rax*bx for div, div bx  ---- rax=rax/bx
	call printraxdigit
	call exit

printraxdigit:
	add rax,'0'
	mov byte[digit],al
	getchar digit
exit:
	mov rax,1
	mov rbx,0
	int 128
	ret