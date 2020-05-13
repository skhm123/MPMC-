data segment
a db 19h
b db ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov bl,a
and bl,0fh
mov al,a
mov dx,00f0h
and al,dl
mov cl,04h
ror al,cl
mov dl,0ah
mul dl
add al,bl
mov b,al
int 3
code ends
end start

