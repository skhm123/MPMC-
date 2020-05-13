data segment
msg db 10,13,'The current time is:'
hour db 2 dup(0),':'
min db 2 dup(0),':'
sec db 2 dup(0),':'
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ah,2ch
int 21h
lea si,hour
mov [si],ch

mov ah,09h
lea dx,msg
int 21h

mov ah,02h
lea dx,hour
int 21h

int 3

code ends
end start