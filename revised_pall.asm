data segment
pt db "Enter your string"
string db 20,0,20 dup("$")
rev db 20 dup("$")
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ah,09h
mov dx,offset pt
int 21h
mov dx,offset string
mov ah,0ah
int 21h 
mov bh,00h
mov si,offset string+2
mov cx,0
l1:
mov bl,[si]
cmp bl,24h
jz l3
push bx
inc cx
inc si
cmp si,19
jnz l1
l3:
mov bx,0
mov di,offset rev
l2:
pop ax
mov [di],al
inc di
inc bx
cmp bx,cx
jnz l2
mov dx,0
mov si,offset string+2
mov di,offset rev
l4:

mov al,[si]
mov bl,[di]
inc si 
inc di
inc dx
cmp dx,cx
jz l7
cmp al,bl
jz l4
mov dx,0000h
l7:
mov ah,4ch
int 21h 
code ends
end start