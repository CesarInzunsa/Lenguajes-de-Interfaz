;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA: 8AM   
;
; Guardar como: Mul.asm 
;       
; Unidad 2 - Tema: Instrucciones aritméticas 
;
; Instrucciones: Diseña un programa en ensamblador que realice y visualice la multiplicación.
;
; Fecha: 04 septiembre 2022
;*********************************************************************
.model small
.stack
.data
    multiplicador1  db 0, '$'
    multiplicador2  db 0, '$'
    resul           db 0,0,'$'
    
    msjn1 db 'Dame n1: $'
    msjn2 db 'Dame n2: $'
    linea db '____$'
    
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    ;1. Pedir por teclado n1
    
        ;1.1 Posicionar el cursor
        mov ah, 2   ;Cursor
        mov dh, 1   ;Renglon
        mov dl, 1   ;Columna
        mov bh, 0
        int 10H
        
        ;1.2 Imprimir el mensaje n1
        mov ah, 9
        lea dx, msjn1
        int 21H
        
        ;1.3 Acomodar el cursor
        mov ah, 2   ;Cursor
        mov dh, 1   ;Renglon
        mov dl, 10   ;Columna
        mov bh, 0
        int 10H
        
        ;1.4 Esperar entrada por teclado
        mov ah, 1
        int 21H
        
        ;1.5 Ajuste
        sub al, 30H
        mov multiplicador1, al 
                 
    ;2. Pedir teclado n2
        
        ;2.1 Posicionar el cursor
        mov ah, 2
        mov dh, 2
        mov dl, 1
        mov bh, 0
        int 10H
        
        ;2.2 Imprimir el mensaje n2
        mov ah, 9
        lea dx, msjn2
        int 21H
        
        ;2.3 Acomodar el cursor
        mov ah, 2
        mov dh, 2
        mov dl, 10
        mov bh, 0
        int 10H
        
        ;2.4 Esperar entrada por teclado
        mov ah, 1
        int 21H
        
        ;2.5 Ajuste
        sub al, 30H
        mov multiplicador2, al
        
    ;3. Realizar la multiplicacion
    
        ;3.1 Inicializar a cero
        xor ax, ax
        
        ;3.2 Realizar la multiplicacion
        mov al, multiplicador1
        mov bl, multiplicador2
        mul bl
        
        ;AL = AL * BL
        
        ;3.3 Guardar el resultado
        mov resul, al
        
    ;4. Imprimir por pantalla
    
        ;4.1 Posicionar cursor
        mov ah, 2
        mov dh, 5
        mov dl, 17
        mov bh, 0
        int 10H
        
        ;4.2 Imprimir n1
        add multiplicador1, 30H
        mov ah, 9
        lea dx, multiplicador1
        int 21H
        
        ;4.3 Posicionar cursor
        mov ah, 2
        mov dh, 6
        mov dl, 17
        mov bh, 0
        int 10H
        
        ;4.4 Imprimir n2
        add multiplicador2, 30H
        mov ah, 9
        lea dx, multiplicador2
        int 21H
        
        ;4.5 Posicionar cursor
        mov ah, 2
        mov dh, 7
        mov dl, 16
        mov bh, 0
        int 10H
        
        ;4.6 Imprimir linea
        mov ah, 9
        lea dx, linea
        int 21H
        
        ;4.7 Posicionar cursor
        mov ah, 2
        mov dh, 6
        mov dl, 14
        mov bh, 0
        int 10H
        
        ;4.8 Imprimir signo "por"
        mov ah, 2
        mov dx, 78H
        int 21H
        
        
        ;4.# Posicionar cursor
        mov ah, 2
        mov dh, 8
        mov dl, 17
        mov bh, 0
        int 10H
        
        ;4.# Imprimir el resultado
        mov al, resul
        AAM
        
        mov bx, ax
        mov dl, bh
        add dl, 30H
        int 21H
        
        mov ah, 02H
        mov dl, bl
        add dl, 30H
        int 21H 

fin:
    mov ax, 4c00h
    int 21H  
end