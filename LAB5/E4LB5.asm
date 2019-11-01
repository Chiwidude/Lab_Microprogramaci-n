.model small
.data
   num1 DB ?
    num2 DB ?
    numtemp DB ?
    diez DB 10d
    dos DB 2d
    Titulo DB 'Ingrese un numero de dos digitos:$'
    count db 0
    binNum DB 9 dup(' '),'$'
.stack
.code
program:
JMP Ingreso
Finalizar:
mov DX,offset binNum
mov AH,09h
int 21h
mov AH, 4ch
Int 21h
Ingreso:
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
    
    mov SI,6
    XOR AX,AX
    mov AL,num2
    div dos
    mov numtemp,AL
    call Agregar
    CMP numtemp,0      
    JG Work ;si es mas de 1
    JMP Finalizar ; si es uno
Work:        
    XOR CX,CX    
    mov CL,1        
CONVERTIR:    
    XOR AX,AX
    mov AL,numtemp
    div dos
    mov numtemp,AL
    call Agregar
    CMP numtemp,0
    JG Increment    
Ciclo:
    loop CONVERTIR    
    JMP Finalizar       
Agregar PROC    
    xor DX,DX        
    mov DL,AH
    add DL,30h
    mov binNum[SI],DL
    dec SI
    RET
Agregar endp   

Increment:
    Inc CL
    JMP Ciclo

  
end program