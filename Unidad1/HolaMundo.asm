;************************************ ************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Fecha: 31 agosto 2022
;
; Unidad 1 - Hola mundo   
;*************************************************  
.model small  ; Modelo pequeño, define el tamaño de los segmentos
.stack
.data
    mensaje db "Hola Mundo! $"
        ; db significa define byte
        ; $ significa centinela = indica fin de la cadena
.code
    MOV AX, @DATA  ;Instrucciones de inicialzacion
    MOV DS, AX
    ;Instrucciones para imprimir
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

end