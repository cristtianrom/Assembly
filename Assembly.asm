       .model small
.stack 64

.data

    VALOR1 DB 0
    VALOR2 DB 0
    SUMAR  DB 0
    RESTAR DB 0
    MULTIPLICAR DB 0
    DIVIDIR DB 0
 
    SOLICITAR1 DB 13,10,'PRIMER VALOR', 13,10,'$'
    SOLICITAR2 DB 13,10,'SEGUNDO VALOR', 13,10,'$'
    
    MSUMA DB 13,10,'LA SUMA ES: $'
    MRESTA DB 13,10,'LA RESTA ES: $'
    MMULTI DB 13,10,'LA MULTIPLICACION ES: $'
    MDIV DB 13,10,'LA DIVISION ES: $'
    
.code

    MAIN PROC
    
        MOV AX, @DATA
        MOV DS, AX   
        
        MOV AH,09H
        LEA DX,SOLICITAR1
        INT 21H          
        MOV AH, 1
        INT 21H          
        SUB AL, 30H
        MOV VALOR1,AL

        
        MOV AH,09H
        LEA DX,SOLICITAR2
        INT 21H          
        MOV AH, 1
        INT 21H          
        SUB AL, 30H
        MOV VALOR2,AL


        ;operaciones
        
        MOV AL,VALOR1
        ADD AL,VALOR2
        MOV SUMAR,AL
        
        MOV AL,VALOR1
        SUB AL,VALOR2
        MOV RESTAR,AL


        MOV AL,VALOR1
        MUL VALOR2
        MOV MULTIPLICAR,AL

        MOV AL,VALOR1
        DIV VALOR2
        MOV DIVIDIR,AL

        
        MOV AH,09H
        LEA DX,MSUMA
        INT 21H
        MOV DL,SUMAR
        ADD DL,30H
        MOV AH,02H
        INT 21H
                      

        MOV AH,09H
        LEA DX,MRESTA
        INT 21H
        MOV DL,RESTAR
        ADD DL,30H
        MOV AH,02H
        INT 21H


        MOV AH,09H
        LEA DX,MMULTI
        INT 21H
        MOV DL,MULTIPLICAR
        ADD DL,30H
        MOV AH,02H
        INT 21H


        MOV AH,09H
        LEA DX,MDIV
        INT 21H
        MOV DL,DIVIDIR
        ADD DL,30H
        MOV AH,02H
        INT 21H

RET    
        
        .EXIT
        MAIN ENDP
END