%macro print 2
	mov rax, 4
	mov rbx, 1
	mov rcx, %1
	mov rdx, %2
	int 0x80
%endmacro


%macro getinput 2
	mov rax, 3
	mov rbx, 0
	mov rcx, %1
	mov rdx, %2
	int 0x80
%endmacro


%macro divide 2
	mov rsi, 3
	mov al,[%1 + 3] ;,
	mov cl,2
	div cl
	add ah,48
	mov [%2],ah

%endmacro


%macro revregnum 2
	mov rsi, 3
	mov rdi, 0
%%loop1:	
	
	mov al, [%1 +rsi]
	mov [%2+rdi],al
	dec rsi
	inc rdi
	cmp rsi, 0
	jge %%loop1
	int 0x80

%endmacro


%macro addition 3

	mov rsi, 4
	mov cl, 0
%%loop:	
	mov al, [%1+rsi]
	sub al, 48
	
	mov bl, [%2+rsi]
	add al, bl
	add al, cl
	mov cl, 0
	cmp al, 58
	jge %%innerloop
	jl %%innerloop2
	
%%innerloop:
	sub al, 10
	mov cl, 1
	jmp %%innerloop2
	
%%innerloop2:
	inc rsi
	mov [%3+rsi], al
	dec rsi
	dec rsi
	cmp rsi, 0
	jge %%loop
	cmp cl, '0'
	jg %%testing
	
%%testing:
	mov al, 48
	add al, cl
	mov [%3], al
		
%endmacro
