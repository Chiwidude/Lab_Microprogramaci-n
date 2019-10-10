.MODEL small


.DATA

cadenan DB 'El simbolo escogido es:$'


.STACK

.CODE
PROGRAMA:
MOV AX,@Data
MOV DS, AX

MOV DX, OFFSET cadenan
MOV AH,09h
INT 21h

MOV DX,0000H
MOV DX, 10h
MOV AH, 02h
INT 21h

	
MOV AH,4ch
INT 21h

END PROGRAMA
