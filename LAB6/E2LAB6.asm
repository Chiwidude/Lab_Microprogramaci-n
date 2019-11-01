.model small
.stack 
.data

    msg1 db 0ah,0dh, 'Ingrese una cadena: ', '$'    
    msg2 db 0ah,0dh, 'Son iguales ', '$'
    msg3 db 0ah,0dh, 'Son diferentes ', '$'
    wrd1 db 50 dup(' '), '$'  
    wrd2 db 50 dup(' '), '$' 
.code 
inicio:
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msg1  ;Imprimimos el msj1
    int 21h
 
    lea si,wrd1 
pedir1:
    mov ah,01h  
    int 21h
    mov [si],al  
    inc si
    cmp al,0dh  ;Se cicla hasta que se digite un Enter
    ja pedir1
    jb pedir1

    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msg1
    int 21h
    lea si,wrd2

pedir2:   
    mov ah,01h
    int 21h
    mov [si],al
    inc si
    cmp al,0dh ;Se cicla hasta que se digite un Enter
    ja pedir2
    jb pedir2
  
    mov cx,50   
    mov AX,DS  
    mov ES,AX 

comparar: 
    lea SI,wrd1  ;SI la cadena que contiene wrd1
    lea DI,wrd2 ;DI la cadena que contiene wrd2
    repe cmpsb  ;compara las dos cadenas
    Jne Diferente ;si no fueron igual
    je Igual ;Si fueron iguales
 
Igual:
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msg2
    int 21h
    JMP FINALIZAR
Diferente:
    mov ax,@data
    mov ds,ax
    mov ah,09
    mov dx,offset msg3
    int 21h
    JMP FINALIZAR

FINALIZAR:
    mov ah, 04ch
    INT 21h    
    end inicio