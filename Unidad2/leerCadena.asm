;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: leerCadena.asm 
;       
; Unidad 2 - Tema: Entrada de cadena desde teclado 
;
; Instrucciones: Leer una cadena que represente el nombre de una persona.
;                Visualice nuevamente la cadena para vertificar resultado.  
;
; sintaxis: mov ah, 10 (0AH)    
;           lea dx, cadena
;           int 21H
;
; Fecha: 12 octubre 2022
;*********************************************************************
.model small
.stack
.data
    nombre db 16, 0, 16, dup('$')  ;dup = Directiva que reserva "n"
                                   ;Cantidad de bytes/word
                                   ;(valor a rellenar)
                                   ;NOTA: maximo a leer mas 1 por el enter
    msj db 'Dame tu nombre: $'                                     
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax ;Segmento de datos extra
    
   ;1. Solicitar nombre
   mov ah, 2
   mov dh, 11
   mov dl, 35
   mov bh, 0
   int 10H
   
   mov ah, 9
   lea dx, msj
   int 21H
   
   mov ah, 2
   mov dh, 12
   mov dl, 35
   mov bh, 0
   int 10H
   
   mov ah, 10
   lea dx, nombre
   int 21H
   
   ;2. Imprimir nombre para comprobar
   
   mov ah, 2
   mov dh, 15
   mov dl, 35
   mov bh, 0
   int 10H
   
   mov ah, 9
   lea dx, nombre+2 ;No imprimir bytes de control
   int 21H

fin:
    mov ax, 4c00h
    int 21H
    end