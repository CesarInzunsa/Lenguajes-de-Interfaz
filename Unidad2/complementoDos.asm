; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: complementoDos.asm
;
; Unidad 2. Tema: Complemento a dos APLICADO 
;
; Instrucciones: Obtiene el complemento a dos                                
;
; Fecha: 21 de septiembre de 2022            
; *************************************************************************************
.model small
.stack
.data   
    numero db -3
    negado db 0,'$'
.code
    inicio:
        mov ax, @data
        mov ds, ax
        
        ;1. Negar el numero
        mov al, numero
        neg al
        mov negado, al
    
    fin:
        mov ax, 4C00H
        int 21H
end