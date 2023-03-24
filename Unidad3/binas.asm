;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM
; BINAS
; laboratiorio final   
;
; Guardar como: binas.asm 
;
; Unidad 3: Tema - Manipulacion de cadenas
;
;*********************************************************************  
INCLUDE libreria.lib
.model small
.stack
.data  
    mensaje db 'Probando libreria'
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax                    
                          
    cursor 12,30,0                      
    impSinColor mensaje
    
fin:
    mov ax, 4c00h
    int 21h
tecla PROC
    mov ah, 0
    int 16H
tecla ENDP
    end