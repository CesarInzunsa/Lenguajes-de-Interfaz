;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: loop.asm 
;       
; Unidad 2 - Tema: Programación básica
;
; Sintaxis CMP: MOV CX, numeroVueltas
;               ETIQUETA: LOOP ETIQUETA
;
; Nota: LOOP decrementa a cx en 1, por cada iteracion
; Instrucciones: Transfiere el contenido de v1 hacia v2
;                considerando que son arreglos de 4 elementos cada uno.
; Fecha: 10 octubre 2022
;*********************************************************************
.model small
.stack
.data
    v1    db 'a', 'e', 'i', 'o', 'u','$'
    v2    db 0,0,0,0,'$'
    msjV2 db 'Los elementos de v2 son: $'
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    ;1. Inicializar
    mov cx, 4
    mov si, 0
    ;2. Codificar ciclo for

ciclo:
    mov al, v1[si]
    mov v2[si],al
        inc si
    loop ciclo
    
    ;Imprimir mensaje v2
    mov ah, 2     ;cursor
    mov dh, 12
    mov dl, 35
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjV2
    int 21H
      
    ;imprimir contenido v2  
    mov ah, 2
    mov dh, 14
    mov dl, 30
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, V2
    int 21H

fin:
    mov ax, 4c00h
    int 21H

end