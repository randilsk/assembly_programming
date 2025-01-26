%include "print.inc"


;______________________________________________________________________________________
section .data
;_______________________________________________________________________________________

data1 db '1',10,0
data2 db '4',10,0


;______________________________________________________________________________________
section .bss
;_______________________________________________________________________________________

result resb 1


;_______________________________________________________________________________________
section .text
;________________________________________________________________________________________
 
global _start
_start:
	mov al,[data1]     ;rax lowest bit 
	sub al,'0'         ;substract al=al - 48
	mov bl,[data2]
	add al,bl   	   ;al=al+bl 
	mov [result], al
	
	printer result,1
	call exit
        
exit: 
	mov rax,1
	mov rbx,0
	int 128
	ret 
	
; add with carrier flag
; adc- add with carrirer flag, adc operand1,opernd2  == operand1+operand2+CF can be done only in 32 bit os ... not supported in 64 bit
; therefore use manual method
