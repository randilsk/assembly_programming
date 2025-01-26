%macro getcharacter 1 mov rax,3 mov rbx,0 mov rcx,%1 mov rdx,1 int 128 %endmacro
