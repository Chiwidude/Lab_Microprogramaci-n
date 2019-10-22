.model small
.data
    num1 DB ?
    num2 DB ?
    diez DB 10d
    Titulo DB 'Ingrese un numero de dos digitos:$'
    Resultado DB 'los factores del numero ingresado son:$'
.stack
.code
Program:
    mov AX,@Data
    mov DS,AX
    xor AX,AX
    mov DX, offset Titulo
    mov AH,09h
    Int 21h
    mov DL, 20h
    mov Ah,02h
    Int 21h
    mov Ah,01h
    Int 21h
    mov num1,AL
    sub num1,30h
    Xor AX,AX
    mov AL,diez
    mul num1    
    mov BL,AL
    xor AX,AX
    mov AH,01h
    Int 21h
    mov num2,AL
    sub num2,30h
    add BL,num2
    MOV num2,BL    
    MOV DL,10
    MOV AH, 02h
    INT 21h
    xor AX,AX
    mov AX,0003h
    Int 10h
    xor AX,AX
    mov DX,offset Resultado
    mov ah,09h
    Int 21h
    xor DX,DX
    mov DL,0dh
    mov ah,02h
    Int 21H    
    Mov DL,10
    mov ah,02h
    Int 21h
    mov CL,num2
    
    DIVIDIR:
    XOR AX,AX    
    mov AL,num2    
    div CL
    CMP AH,0h
    JE  Imprimir
    JNE Ciclo
 Ciclo:
    loop DIVIDIR    
    JMP Finalizar
    ;impresion caracteres
    Imprimir:        
    xor AX,AX
    mov AL,CL
    div diez
    xor BX,BX    
    mov BL,AL
    mov BH,AH
    add BL,30h
    mov DL,BL
    mov Ah,02h
    INT 21h
    add BH,30h
    mov DL,BH
    mov Ah,02h
    INT 21h
    MOV DL,0dh
    Int 21h
    MOV DL,10
    MOV AH, 02h
    INT 21h   
    JMP Ciclo
Finalizar:
    mov Ah,4ch
    Int 21h   
    
        
end Program