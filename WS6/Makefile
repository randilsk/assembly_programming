exe.x:obj.o
	ld -o exe.x obj.o 
obj.o:asmpr.asm
	nasm -f win64 -o obj.o -l list.l asmpr.asm