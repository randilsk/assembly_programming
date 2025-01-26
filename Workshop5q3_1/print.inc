;macros are declared outside the sections. defined using % - directory ;keyword
macro, name of macro %macro textprinter 3 mov rsi,0 ;s ource index register
%%loop: mov rax,4 ;4 is sy_write cal mov rbx,1 ;1 is std o/p screen mov rcx,%1
;we have the string to print. %1 means place for first argument %1 means place
for first argument mov rdx,%2 ;the size of the variable has to pass %2 means
place for first argument int 128 inc rsi ;inc - increment dec for decrement cmp
rsi,%3 ;compare rsi with 10 %3 means place for first argument jl %%loop ;jump if
less than ;%% marks make this label local only to this macro %endmacro
