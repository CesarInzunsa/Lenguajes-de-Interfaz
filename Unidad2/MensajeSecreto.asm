; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: MensajeSecreto.asm
;
; Unidad 2. Tema: Codigo Ascii 
;
; Instrucciones: Selecciona una persona a la que vas a enviar un mensaje
;                secreto a través de código ascii cifrado con su valor 
;                hexadecimal. 
;
; Fecha: 21 de septiembre de 2022            
; ************************************************************************************* 
.model small
.stack
.data
    persona db 10,13,'Cesar Inzunsa $'
    mensaje db 7,7,7,13,13,0AH, 53H,45H,43H,52H,45H,54H,4FH  ,01H,02H,03H,04H,05H,' $'
.code
    mov ax, @data
    mov ds, ax
    ;1. Imprimir el nombre de la persona
    mov ah, 9
    lea dx, persona
    int 21H
    ;2. Imprimir el mensaje secreto
    mov ah, 9
    lea dx, mensaje
    int 21H 

end