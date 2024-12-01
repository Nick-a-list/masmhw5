; ------------------------------------------------------------
; Program Description: Homework 5
; Author: Nicholas Barkero
; Creation Date: November 30, 2024
; Language: IA-32 x86
; Assembler: Microsoft Macro Assembler (MASM)
; Collaboration: Assembly Language For x86 Processors by Kip Irvine
; ----------------------------------------------------------
INCLUDE Irvine32.inc
.data
print_message PROTO

add_numbers PROTO

message db "Hello, Assembly!", 0
result DWORD ?

.code
main proc

call print_message      ;print_message

push 5
push 3
call add_numbers        ;add_numbers
call crlf
call writeint

exit
main endp

print_message proc      

mov edx, OFFSET message ;moves established message to edx
call writeString        ;calls built in function to write string
ret

print_message endp
;---------------------------------------------------------
add_numbers proc

push ebp                ;pushes ebp to stack
mov ebp,esp             ;set ebp to esp so ebp can be base of stack frame
mov eax,[ebp + 12]      ;second parameter(+12 to be adjusted for stack)
add eax,[ebp + 8]       ;first parameter(+8 to be adjusted for stack)
mov result, eax         ;moves the return value to result 
pop ebp
ret 8                   ;cleans up stack (8 is equal to number of stack space)

add_numbers endp

end main