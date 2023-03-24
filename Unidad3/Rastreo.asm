;*********************************************************************
; NL: 23               Nombre: Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: Rastreo.asm 
;       
; Unidad 3 - Tema: Codigo de rastreo
; Es el numero de tecla en el teclado, es DIFERENTE
; al valor ASCII.                
;
; Se utiliza para determinar TECLA ESPECIALES:
;   shift, ctrl, alt, f1
;    
; Fecha: 19 octubre 2022
;
;--------------------------------------------------------------------
;  MOV AH, 0
;INT 16H
;    AL = Regresa el codigo ASCII
;    AH = Rgeresa el codigo de RASTREO
;                                     
;   Investigar teclas de rastreo
;   Flecha arriba:    48H
;   Flecha abajo:     50H
;   Flecha derecha:   4DH
;   Flecha izquierda: 4BH
;   Escape:           01H
;   Enter:            1CH
;
;---------------------------------------------------------------------
;
;*********************************************************************      
.model small 
.stack
.data
    msj db 'Presiona una tecla $'
.code                            
Inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ;1. Imprimir mensaje y esperar tecla
    mov ah, 9
    lea dx, msj
    int 21H
    
    mov ah, 0
    int 16H