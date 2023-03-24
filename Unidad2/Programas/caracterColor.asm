;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: caracterColor.asm 
;       
; Unidad 2 - Tema: Byte del color
;
; Instrucciones: Imprime las vocales en diferentes colores
;                y diferentes posiciones del monitor. 
;                a = Fondo amarillo y letras rojas
;                e = Fondo azul y letras blancas
;                f = Fondo blanco y letras negras
;
;
; Nota: El nibble superior es el color del fondo
;       El nibble inferior es el color de la letra 
;       Para ver el color: En el CMD: color ?
;
; Fecha: 11 octubre 2022
;*********************************************************************
.model small
.stack
.data
    
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    ;1. a = Fondo amarillo y letras rojas
    mov ah, 2   ;cursor
    mov dh, 5   ;ren
    mov dl, 40  ;col
    mov bh, 0   ;pag
    int 10H
    
    
    mov ah, 9   ;Imprimir caracter con atributo                     
    mov cx, 1   ;Numero de caracteres  
    mov al, 'a' ;Caracter
    mov bl, 64H ;Atributo = color fondo y color letra
    mov bh, 0   ;Pag
    int 10H
    
    ;2. e = Fondo azul y letras blancas
    mov ah, 2
    mov dh, 6
    mov dl, 40
    mov bh, 0
    int 10H
    
    mov ah, 9
    mov cx, 1
    mov al, 'e'
    mov bl, 17H
    mov bh, 0
    int 10H
    
    ;3. f = Fondo blanco y letras negras
    mov ah, 2
    mov dh, 7
    mov dl, 40
    mov bh, 0
    int 10H
    
    mov ah, 9
    mov cx, 1
    mov al, 'f'
    mov bl, 70H
    mov bh, 0
    int 10H

fin:
    mov ax, 4c00h
    int 21H
    