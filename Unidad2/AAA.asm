;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: AAA.asm 
;       
; Unidad 2 - Tema: AAA
;
; Sintaxis AAA: ADD AL, BL
;               AAA
;
; Fecha: 28 septiembre 2022
;*********************************************************************
.model small
.stack
.data 
    n1 db 8
    n2 db 8
    r  db 0,0,'$'
       ;Decena unidad
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    xor ax, ax  ;Es lo mismo que: mov ax, 0   
    
    mov al, n1
    mov bl, n2
    add al, bl
    AAA         ;Ajuste ascii despues de la suma
    ;Decenas quedan en AH
    ;Unidades quedan en AL
    
    add ax, 3030H ;Es lo mismo que sumar add al, 30H o add al, 30H
    mov r[0], ah
    mov r[1], al
    
    
    ;Imprimir
    MOV ah, 9
    LEA dx, r
    INT 21H 
    
    
fin:
    mov ax, 4c00h
    int 21H
END