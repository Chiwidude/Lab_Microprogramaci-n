.model small

.data
numero1 DB 02
numero2 DB 04
suma DB 'TOTAL:$'
resta DB 'DIFERENCIA:$'
producto DB 'PRODUCTO:$'
cociente DB 'COCIENTE:$'
residuo DB 'RESIDUO:$'


.stack
.code

PROGRAMA:
MOV AX,@Data
MOV DS, AX
mov BL, numero1
add BL,numero2
add BL,30h
;suma
MOV DX, OFFSET suma
MOV AH,09h
INT 21h
mov DL,BL
mov AH,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
;diferencia
MOV DX, OFFSET resta
MOV AH,09h
INT 21h
mov BL,numero2
sub bL,numero1
add bL,30h
mov DL,BL
mov AH,02h
INT 21h
MOV DL,10
MOV AH, 02h
INT 21h
;multiplicaci?n
MOV DX, OFFSET producto
MOV AH,09h
INT 21h
mov AL,numero2
mul numero1
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
mov AL,numero2
div numero1
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