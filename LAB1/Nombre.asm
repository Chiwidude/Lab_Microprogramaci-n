.MODEL small


.DATA

cadenan DB 'Francisco Alonzo$'
cadenac DB '1197517$'


.STACK

.CODE
PROGRAMA:
MOV AX,@Data
MOV DS, AX

MOV DX, OFFSET cadenan
MOV AH,09h
INT 21h

MOV DL,10
MOV AH, 02h
INT 21h

MOV DX, OFFSET cadenac	
MOV AH,09h
INT 21h
	
MOV AH,4ch
INT 21h

END PROGRAMA
