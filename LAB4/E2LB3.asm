.model small

.data
titulo DB 'Ingrese un numero:$'
num1 DB ?
num2 DB ?
total DB 'TOTAL:$'
resta DB 'DIFERENCIA:$'
producto DB 'PRODUCTO:$'
cociente DB 'COCIENTE:$'
residuo DB 'RESIDUO:$'
.stack
.code

PROGRAMA:
MOV AX,@Data
MOV DS, AX

xor AX,AX
MOV DX, OFFSET titulo
MOV AH,09h
INT 21h
mov Ah,01h
INT 21h
mov num1,AL
MOV DL,10
MOV AH, 02h
INT 21h
MOV DX, OFFSET titulo
MOV AH,09h
INT 21h
mov Ah,01h
INT 21h
mov Ah,01h
mov num2,AL
sub num1,30h
sub num2,30h
MOV DL,10
MOV AH, 02h
INT 21h
mov BL,num1
add BL,num2
;SUMA
MOV DX, OFFSET total
MOV AH,09h
INT 21h
add BL,30h
mov DL,BL
mov Ah,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
;RESTA
mov DX, OFFSET resta
mov AH,09h
INT 21h
mov BL,num2
sub BL,num1
add BL,30h
mov DL,BL
mov Ah,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
;MULTIPLICACI?N
mov DX, OFFSET producto
mov AH,09h
INT 21h
mov AL,num2
mul num1
add AL,30h
mov DL,AL
mov AH,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
;Divisi?n
MOV DX, OFFSET cociente
MOV AH,09h
INT 21h
xor AX,AX
mov AL,num2
div num1
add AL,30h
mov DL,AL
mov CL,AH
mov AH,02h
INT 21h
add CL,30h
MOV DL,10
MOV AH, 02h
INT 21h
MOV DX, OFFSET residuo
MOV AH,09h
INT 21h
mov DL,CL
mov AH,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
MOV AH,4ch
INT 21h
END PROGRAMA