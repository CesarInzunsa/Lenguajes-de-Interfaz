;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: cursor.asm 
;       
; Unidad 2 - Tema: Cursor
;
; Sintaxis: mov ah, 2
;           mov dh, renglon
;           mov dl, columna
;           mov bh, numero de pagina - Por defecto es la 0
;
; Instrucciones: Coloca tu nombre en el centro de la pantalla.
;
; Fecha: 26 septiembre 2022
;*********************************************************************
.model small
.stack
.data
    nombre db 'Ing. Cesar Alejandro Inzunsa Diaz', 161, 'AS$' 
.code                                                       
inicio:
    mov ax, @data
    mov ds, ax
    ; 1. Colocar el cursor
    mov ah, 2
    mov dh, 12
    mov dl, 20
    mov bh, 0
    int 10H 
    ; 2. Imprimir el mensaje
    mov ah, 9
    lea dx, nombre
    int 21H
   
fin:
    mov ax, 4c00h
    int 21H
    
END