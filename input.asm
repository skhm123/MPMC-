data segment
pt db "Enter your name"
msg db 80,0,80 dup('$')
data ends
code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
mov ah,09h
mov dx,offset pt
int 21h
mov ah,0ah 
mov dx,offset msg
int 21h 
mov dx,offset msg+2
mov ah,09h
int 21h
mov ah,4ch
int 21h
code ends
end start