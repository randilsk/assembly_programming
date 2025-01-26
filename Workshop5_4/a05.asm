%include "print.inc"


;______________________________________________________________________________________
section .data
;_______________________________________________________________________________________

data1 db '300',10,0  ;ascii code of each digit will be stored in the memory address as a binary. 
		       ;decimal in ascii format. x[2] arrat has x[0] and x[1]. data is also stored as an array
		       ;here [data+0] ='3' ,[data+1]='2', [data1+2]='5'.....[data1+4] ='3' ( this + part is called offset)
data2 db '200',10,0


;______________________________________________________________________________________
section .bss
;_______________________________________________________________________________________

result resb 5


;_______________________________________________________________________________________
section .text
;________________________________________________________________________________________
 
global _start
_start:
	mov rsi,4		;offset is initiallized to 4
	mov cl, 0
loop: 
	mov al,[data1+rsi]     ;rax lowest bit 
	sub al,'0'         ;substract al=al - 48
	mov bl,[data2+rsi]
	add al,bl   	   ;al=al+bl 
	add al,cl
	mov cl,0
	cmp al,58
	jge innerloop1
	
	
	
innerloop2:
	mov [result+rsi], al
	dec rsi
	cmp rsi,0
	jge loop
	
	printer result,5
	call exit
	
innerloop1:
	sub al,10
	mov cl,1
	jmp innerloop2
        
exit: 
	mov rax,1
	mov rbx,0
	int 128
	ret 
	
; add with carrier flag
; adc- add with carrirer flag, adc operand1,opernd2  == operand1+operand2+CF can be done only in 32 bit os ... not supported in 64 bit
; therefore use manual method
