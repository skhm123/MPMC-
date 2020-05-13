data segment
n dw 5
r dw 3
ncr dw ?
data ends
code segment
assume cs:code,ds:data
start:

mov ax,data
mov ds,ax
mov ax,n
mov bx,n
sub bx,1
call fact
push ax

mov ax,r
mov bx,r
sub bx,1
call fact
push ax

mov ax,n
mov bx,r
sub ax,bx
mov bx,ax
sub bx,1
call fact
push ax
pop cx
pop bx
pop ax
div bx
div cx
mov ncr,ax
fact proc near
cmp bx,1
jz result
mul bx
sub bx,1
call fact 
result:
ret
endp


int 3
code ends
end start