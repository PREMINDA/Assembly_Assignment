%include "macro.inc"

section .data

var1 dq 32.86
var2 dq 68.23
cmpValue dq 50.00
revValue dq 6823

remainValue db 'Remainder : ',0
remainValueSize equ $ - remainValue

newLine db 10,"",10
newLineSize equ $ - newLine

noticeMsg db 'According to remainder valid operations are (*) and (-)',10,0
noticeMsgSize equ $ - noticeMsg

opEnterMsg db 'Enter an operation : ',0
opEnterMsgSize equ $ - opEnterMsg

invalidMsg db 'Enterd operation is not valid for your index',10,0
invalidMsgSize equ $ - invalidMsg

equalMsg db 'equal to 50.00',10,0
equalMsgSize equ $ - equalMsg

greaterMsg db 'greater than 50.00',10,0
greaterMsgSize equ $ - greaterMsg

lessMsg db 'less than 50.00',10,0
lessMsgSize equ $ - lessMsg

var1Msg db 10,'var1 ',0
var1MsgSize equ $ - var1Msg

var2Msg db 0,' var2 is ',0
var2MsgSize equ $ - var2Msg

section .bss

remainder resb 4
operat resb 1

section .text 

global _start 

_start:
	print remainValue, remainValueSize
	
	divison revValue, remainder
	
	print remainder, 4
	print newLine, newLineSize
	print noticeMsg, noticeMsgSize
	print opEnterMsg, opEnterMsgSize
	
	getinput operat, 1
	mov rbx, [operat]
	
	cmp rbx, 45
	je loop1
	
	cmp rbx, 42
	je loop2
	
	print invalidMsg, invalidMsgSize
	call exit
loop1:
	finit
	fld qword[var1]
	fsub qword[var2]
	fcomp qword[cmpValue]
	fstsw ax
	sahf
	je equal
	ja great
	jb less
loop2:
	finit
	fld qword[var1]
	fmul qword[var2]
	fcomp qword[cmpValue]
	fstsw ax
	sahf
	je equal
	ja great
	jb less
	call exit
equal:
	call operation
	print equalMsg, equalMsgSize
	call exit
	
great:
	call operation
	print greaterMsg, greaterMsgSize
	call exit
	
less:
	call operation
	print lessMsg, lessMsgSize
	call exit

operation:
	print var1Msg, var1MsgSize
	print operat, 1
	print var2Msg, var2MsgSize
	ret
	
exit:
	mov rax,1
	mov rbx,0
	int 0x80
	ret
	
