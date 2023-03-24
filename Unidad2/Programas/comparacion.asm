;************************************ ************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: comparacion.asm 
;       
; Unidad 2 - Tema: CMP y Saltos condicionales
;
; Sintaxis CMP: CMP operando 1, operando 2
;               J (Salto correspondiente)
;
; Instrucciones: Solicita un digito decimal (0-9). Determina si es un numero positivo,
;                negativo o es el CERO.
;
; Fecha: 26 septiembre 2022
;*************************************************
.model small
.stack
.data
    digito db 0
    msjP   db 10,13,'El n',163,'mero es positivo $'
    msjN   db 10,13,'El n',163,'mero es negativo $'
    msjC   db 10,13,'Es el CERO $'
.code
inicio:
    mov ax, @data
    mov ds, ax
    ;1. Solicitar un digito decimal
    mov ah,1 ; Entrada de caractaer
    int 21H
        mov digito, al
        sub digito, 30H ;Convertir a digito decimal
    ;2. Realizar comparacion
    cmp digito, 0
    JE esCero      ;Si entonces
    JG esPositivo  ;Si no entonces
    ;si no fueron las otras opciones, significa que es negativo
        mov ah,9
        lea dx, msjN
        int 21H
    JMP fin
    
EsCero:
    mov ah, 9
    lea dx, msjC
    int 21H
    JMP fin
    
esPositivo:
    mov ah, 9
    lea dx, msjP
    int 21H
    JMP fin        
fin:
    mov ax, 4c00h
    int 21H  