 
 ;(Q1) Write a program in assembly language which immediately terminates once it is executed?
 
 section .text  ;this is a comment section specify a new section and .text is a program's executable code
 
 global _start   ;start is a label and the program execution begin
 
 _start:         ;label _start is containtng the memory address of the program begining.
 
 	mov rax,0x0000000000000001       ;mov is a mnemonic used for copying 
 			;this will copy value 1 to rax register, thisw wil be stored in least bit in rax register
 			;having 1 in eax/rax will tell tht it should exit, if 2 will call fork, if 3 will call for readingn, if 4 will call for writing
 	
 	mov rbx, 0	; 0 means standard input,(keybrd), 1 means std output(screen), 2 means std error
 			
	int 128  ;software interrupt , disturbance for the CPU 0x80 in hexadecimal, 0x is for hexadecimal / else 80h
	
	; as rax is assigned with 1 using rbx is enough, but if rax is used with 2,3,4 then rcx and rdx also should use