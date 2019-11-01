.model small
.stack 
.data 
    msg db 10,13,7, 'Ingrese una cadena: ','$'
    normal db 10,13," Original: ",'$' 
    INPUT db 150 dup(' '), '$'     
    MAYUS db 10,13,"MAYUS: $" 
.code 

PROGRAM:
    mov ax,@data 
    mov ds,ax 

    mov ah, 09h
    lea dx, msg
    int 21h
    
    MOV AH, 3fH
    MOV BX, 00
    MOV CX, 150
    MOV DX, offset[INPUT]
    int 21h

    mov ah, 09h
    mov dx, offset[INPUT]
    int 21h

    lea dx,normal 
    mov ah,9 
    int 21h 

    
    lea dx,MAYUS 
    mov ah,9 
    int 21h 

    call Convertir 

    mov ah,4ch 
    int 21h 

Convertir proc 
    mov si,0 
Continuar: 
    mov al,INPUT[si] 
    cmp al,'$' 
    jz FINAL 
    cmp al,'z' 
    jg Siguiente 
    cmp al,'a' 
    jl Siguiente 
    sub al,20H 
Siguiente:
    mov dl,al 
    mov ah,2 
    int 21h 
    inc si 
    jmp Continuar 
FINAL: ret 
Convertir endp 
end PROGRAM