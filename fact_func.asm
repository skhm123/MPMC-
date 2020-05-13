data segment
n dw 5
r dw 1
ncr dw ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
;for n!
mov ax,n
mov bx,n
sub bx,1
call fact
push ax

;for r!
mov ax,r
mov bx,r
sub bx,1
call fact
push ax

;for (n-r)!
mov ax,n
mov bx,r
sub ax,bx
mov bx,ax
sub bx,1
call fact
push ax

;popping from stack
pop cx
pop bx
pop ax
div bx
div cx
mov ncr,ax
jmp end1


fact:
cmp bx,1
jz result
mul bx
sub bx,1
call fact

result:
ret

end1:
int 3
code ends
end start