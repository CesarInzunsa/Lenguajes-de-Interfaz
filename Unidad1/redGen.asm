; ***********************************************************
; NL: 23       Inzunsa Diaz Cesar Alejandro
; Guardar como: redGen.asm
; Unidad 1 - Tema Registros de Proposito General
; AX, AH, AL, BX, BH, BL, CX, CH, CL, DX, DH, DL
;
; Fecha: 1 de septiembre de 2022
; ***********************************************************
.model small
.stack
.data
.code
MOV AX, @DATA
MOV DS, AX
    ; **Registro aumulador 31 de ago --> EJERCICIOS
   
    MOV AX, 80
    MOV AH, 125
    MOV AL, 75
    MOV AH, 'M'
    
    ; REGISTRO BASE 01/09/22
    MOV BH, 036H
    MOV AL, BH
    MOV BL, '$'
    MOV AX, BX
    
    ;REGISTRO CONTADOR
    MOV CL,14
    MOV CH, 014H
    INC CX
    
    ; REGISTRO DE DATOS
    MOV DL, 046H
    MOV DH, 0F2H
    INC DX   
    
     
end                                                 