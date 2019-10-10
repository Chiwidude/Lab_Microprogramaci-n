.model small
.data
 Titulo DB 'Ingrese un numero:$'
 Producto DB 'El producto de los numeros es: $'
 cociente DB 'El cociente de la division es: $'
 residuo  DB 'El residuo de la division es: $'
 num1 DB ?
 num2 DB ? 
 c DB 0d
 r DB 0d
 diez DB 10d
.stack
.code

PROGRAMA:
MOV AX,@Data
MOV DS,AX
xor AX,AX
JMP Ingreso
Finalizar:
MOV AH, 4ch
INT 21h

Ingreso:
MOV DX,offset Titulo
MOV Ah,09h
INT 21h
mov DL,20h
mov AH,02h
INT 21h
MOV AH,01h
INT 21h
MOV num1,AL
sub num1,30h
XOR AX,AX
mov DL,10
mov AH,02h
INT 21h
MOV DX,offset Titulo
MOV Ah,09h
INT 21h
mov DL,20h
mov AH,02h
INT 21h
MOV Ah,01h
INT 21h
MOV num2,AL
sub num2,30h
mov DL,10
mov AH,02h
INT 21h
mov CL,num1
xor AX,AX
JMP Multiplicacion

Multiplicacion:
add BL,num2
loop Multiplicacion
MOV DX,offset Producto
MOV Ah,09h
INT 21h
mov DL,20h
mov AH,02h
INT 21h
xor AX,AX
mov AL,BL
div diez
xor BX,BX
xor CX,CX
mov BL,AL
mov CL,AH
add BL,30h
mov DL,BL
mov Ah,02h
INT 21h
add CL,30h
mov DL,CL
mov Ah,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR DX,DX
mov BL,num1
mov CL,num2
JMP Division

Division:
CMP BL,CL
JL  PrintD
JE  Menor
JG  Resta

Menor:
Sub BL,CL
JMP PrintD
PrintD:
XOR DX,DX
mov r,BL
add r,30h
MOV DX,offset Cociente
MOV Ah,09h
INT 21h
mov DL,20h
mov AH,02h
INT 21h
Add c,30h
mov DL,c
mov AH,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
MOV DX,offset residuo
MOV Ah,09h
INT 21h
mov DL,20h
mov AH,02h
INT 21h
xor DX,DX
mov DL,r
mov Ah,02h
INT 21h
JMP Finalizar
Resta:
mov AL,c
inc Al
mov c,AL
sub BL,CL
CMP BL,CL
JGE RESTA
JL PrintD
END PROGRAMA