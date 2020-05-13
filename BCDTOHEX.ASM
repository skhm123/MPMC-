data segment
bcd db 06h,05h,05h,03h,05h
hex dw ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cl,05h
mov bp,000Ah
mov ax,2710h
push ax
mov di,0000h
mov si,offset bcd
X:
mov bl,[si]
mul bx
add di,ax
pop ax
div bp
push ax
inc si
dec cl
jnz X
mov hex,di
int 3
code ends
end start
