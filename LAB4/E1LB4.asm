.model small
.data

   num DB ?
   dos DB 02d
   Espar DB 'El numero es par$'
   Nopar DB 'El numero no es par$'
   Titulo DB 'Ingrese numero:$'
 .stack
.code

PROGRAMA:
MOV AX,@Data
MOV DS,AX
JMP leernumero
Finalizar:
MOV AH,4ch
INT 21h

leernumero:
mov DX,offset Titulo
mov AH,09h
INT 21h

xor AX,AX

MOV AH,01h
INT 21h
MOV num,AL


XOR AX,AX
sub num,30h
mov AL,num
div dos

MOV DL,AH
XOR AX,AX

 CMP DL,0
 JZ RESIDUO
 JNZ NoResiduo
 
RESIDUO:
mov DL,20h
mov Ah,02h
INT 21h
 mov DX, offset Espar
 mov AH,09h
 INT 21h
 JMP Finalizar 

 NoResiduo:
 mov DL,20h
mov Ah,02h
INT 21h
 mov DX, offset Nopar
 mov AH,09h
 INT 21h
 JMP Finalizar 

END PROGRAMA