;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: lineas.asm 
;       
; Unidad 2 - Tema: Byte del color
;
; Instrucciones: Imprimir lineas superiores e inferiores con el caracter
;                205 (=)
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
    mensaje db 'Cesar Alejandro Inzunsa Diaz'   
    ;28
.code
inicio:
    mov ax, @data
    mov ds, ax     
    mov es, ax ;añadir uso de segmento extra
    
    ;0. Imprimir cadena con color - Fondo azul y letras blancas
    mov ah, 19
    lea bp, mensaje ;cadena
    mov cx, 28      ;longitud
    mov dh, 14      ;ren
    mov dl, 30      ;col
    mov bh, 0       ;pagina
    mov al, 0       ;modo
    mov bl, 1FH     ;color
    int 10H
    
    
    ;1. Imprimir linea de caracter 205 - Fondo amarillo y letras rojas
    mov ah, 2   ;cursor
    mov dh, 5   ;ren
    mov dl, 0   ;col
    mov bh, 0   ;pag
    int 10H
    
    
    mov ah, 9    ;Imprimir caracter con atributo                     
    mov cx, 80   ;Cantidad de caracteres  
    mov al, 205  ;Caracter
    mov bl, 0E4H ;Atributo = color fondo y color letra
    mov bh, 0    ;Pag
    int 10H
    
    ;2. Imprimir linea de caracter 177 - Fondo azul y letras blancas
    mov ah, 2
    mov dh, 10
    mov dl, 00
    mov bh, 0
    int 10H
    
    mov ah, 9
    mov cx, 80
    mov al, 177
    mov bl, 17H
    mov bh, 0
    int 10H
    
    ;3. Imprimir linea de caracter 219 - Fondo blanco y letras negras
    mov ah, 2
    mov dh, 15
    mov dl, 0
    mov bh, 0
    int 10H
    
    mov ah, 9
    mov cx, 80
    mov al, 208
    mov bl, 70H
    mov bh, 0
    int 10H

fin:
    mov ax, 4c00h
    int 21H
end    