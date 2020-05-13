data segment
opr db 34h
res db ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov al,opr
mov bl,al
shr al,01h
xor al,bl
mov res,al
int 3
code ends
end start
