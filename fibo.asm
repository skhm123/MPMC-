data segment
n1  db  00h
n2  db  01h
data ends
code segment
assume cs:code,ds:data
start:MOV  ax,data
			MOV  ds,ax
			MOV  ax,0000h
			MOV  cx,0006h
			MOV  al,n1
			;MOV  dl,n1
			DEC  cx
			;MOV  al,n2 
			DEC  cx
			;MOV  dl,n2
			MOV bl,n2
loop1:ADD  al,bl
			MOV  dl,al
			MOV  al,bl
			MOV  bl,dl 
			Dec  cx 
			JNZ loop1
			INT  03h	 
			code ends 
			end  start