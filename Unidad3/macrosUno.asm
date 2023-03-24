;*********************************************************************
; NL: 23               Nombre: Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: macrosUno.asm 
;       
; Unidad 3 - Tema: Macros
;
;La macro es una simulacion de un metodo o funciona en un lenguaje de alto nivel.
;Las macros unicamente pueden recibir parametros de entrada y nunca de salida.                 
;
;Sintaxis: 
;    nombreMacro MACRO parametro1, parametro2, parametron
;        <cuerpo de la macro>
;    ENDM 
;
; Fecha: 19 octubre 2022
;
;Las macros se declaran despues del segmento de datos
;*********************************************************************

.model small
.stack
.data 
    titulo db 'Lenguajes de interfaz'    ;21
    semestre db 'agosto-diciembre 2022'  ;21
    estudiante db 'Inzunsa Diaz Cesar Alejandro'        ;28
    msj db 'Presiona una tecla para salir. $'
    ;************macros
    impCadColor MACRO mensaje, longitud, ren, col, pag, modo, color
        mov ah, 19
        lea bp, mensaje
        mov cx, longitud
        mov dh, ren
        mov dl, col
        mov bh, pag
        mov al, modo
        mov bl, color
        int 10H 
            
    ENDM
    
    cursor MACRO ren, col, pag
        mov ah, 2          
        mov dh, ren
        mov dl, col
        mov bh, pag
        int 10H
    ENDM
    
    impCadSinColor MACRO mensaje
        mov ah, 9               
        lea dx, mensaje
        int 21H
    ENDM  
    
    tecla MACRO 
        mov ah, 0   ;Codigo de rastreo
        int 16H     ;Espera una tecla sin eco.
    ENDM
    
    ;************
.code
inicio:
    mov ax, @data
    mov ds, ax 
    mov es, ax  ;COLOR
    
    ;1. Imprimir mensajes
    ;impCadColor MACRO mensaje, longitud, ren, col, pag, modo, color
    impCadColor titulo, 21, 5, 25, 0, 0, 17H 
    impCadColor semestre, 21, 6, 25, 0, 0, 27H
    impCadColor estudiante, 28, 7, 25, 0, 0, 37H
    
    ;2. Cursor
    cursor 10, 25, 0
    
    ;3. Imprimir sin color
    impCadSinColor msj
    
    tecla
        
END