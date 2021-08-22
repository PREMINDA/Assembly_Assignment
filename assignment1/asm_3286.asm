%include "macro.inc"

section .data

greetingMsg db "I hope you are doing well", 10
greetingMsgSize equ $ - greetingMsg

regNumMsg db "This is Your Register Number : ", 0
regNumMsgSize equ $ - regNumMsg

revNumMsg db "Reverse Register Number is : ", 0
revNumMsgSize equ $ - revNumMsg

remainValue db 10,"Reminder = ", 0
remainValueSize equ $ - remainValue

operationMsg db 10,"According to remain value, Your Operation is Addition", 0
operationMsgSize equ $ - operationMsg

additionResultMsg db 10,"Addition of var1 + var2 = ", 0
additionResultMsgSize equ $ - additionResultMsg

chEnterMsg db 10,"Enter a Character : ",
chEnterMsgSize equ $ - chEnterMsg

oddNumMsg db "Enterd Number Is Odd", 10
oddNumMsgSize equ $ - oddNumMsg

evenNumMsg db "Enterd Number Is Even", 10
evenNumMsgSize equ $ - evenNumMsg

digitMsg db "Enterd character is a digit ", 10
digitMsgSize equ $ - digitMsg

notDigitMsg db "Enterd character is not a digit ", 10
notDigitMsgSize equ $ - notDigitMsg

var1 dq "3286", 10
var1Size equ $ - var1
	
newLine db "",10
newLineSize equ $ - newLine




section .bss

var2 resb 4 
addResult resb 5
inputVal resb 1
reminder resb 1





section .text
	
global _start

_start:
	print greetingMsg, greetingMsgSize
	print regNumMsg, regNumMsgSize 
	print var1, var1Size
	print revNumMsg, revNumMsgSize 
	revregnum var1, var2
	print var2, 4
	print newLine, newLineSize
	divide var1, reminder
	print remainValue, remainValueSize
	print reminder, 1
	print operationMsg, operationMsgSize
	print additionResultMsg, additionResultMsgSize
	addition var1, var2, addResult
test:	print addResult, 5
	print newLine, newLineSize
	call is_digit
	
	call exit



is_digit:
	print chEnterMsg, chEnterMsgSize 	
	getinput inputVal, 1
	mov al, [inputVal]
	cmp al,'9'
	jle check_more
	jg not_digit
	
check_more:
	cmp al, '0'
	jl not_digit
	print digitMsg, digitMsgSize
	call is_even
	ret

not_digit:
	print notDigitMsg, notDigitMsgSize
	call exit
	ret

				

is_even:
	mov al, [inputVal]
	mov bl, 2
	div bl
	cmp ah, 1
	je odd_msg
	jl even_msg
		
even_msg:
	print evenNumMsg, evenNumMsgSize
	ret
odd_msg:	
	print oddNumMsg, oddNumMsgSize
	ret

exit:
	mov rax, 1
	mov rbx, 0
	int 0x80
	ret






	

