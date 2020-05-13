data segment
a db 'h','e','l','e','h'
b db 05h dup(?)
data ends
code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
mov si,offset a
mov cx,0005h
mov bh,00h
label1:
mov bl,[si]
push bx
inc si
dec cx
jnz label1
mov si,offset b
mov cx,0005h
label2:
pop bx
mov [si],bl
inc si
dec cx
jnz label2
mov si,offset a
mov cx,0005h
mov bh,00h
label3:
mov bl,[si]
push bx
inc si
dec cx
jnz label3
lea si,a
lea di,b
mov cx,0005h
mov dx,0001h
X:

mov al,[si]
mov bl,[di]
inc si
inc di
dec cx
jz Y
cmp al,bl
jz X
mov dx,0000h
Y:
int 03h
code ends
end start