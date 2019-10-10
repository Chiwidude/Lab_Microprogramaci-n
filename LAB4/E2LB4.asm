.model small
.data
 Titulo DB 'Ingrese un numero$'
 Mayor_num1 DB 'El numero 1 es mayor que el 2$' 
 Mayor_num2 DB 'El numero 2 es mayor que el 1$'
 Equals DB 'Los numeros son iguales$'
 num1 DB ?
 num2 DB ?
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
JMP COMPARAR

COMPARAR:
MOV Cl,num1
MOV DL,num2
CMP CL,DL
JE IGUALES
JL MAYOR2
JG MAYOR1
  

IGUALES:
MOV DX, offset Equals
MOV AH,09h
INT 21h
JMP Finalizar

MAYOR2:
MOV DX, offset Mayor_num2
MOV AH,09h
INT 21h
JMP Finalizar
MAYOR1:
MOV DX, offset Mayor_num1
MOV AH,09h
INT 21h
JMP Finalizar




END PROGRAMA
