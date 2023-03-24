;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: termometro.asm 
;
; Unidad 3:  Manejao de dispositivos
; IN.  ENtrada de puerto   -> Leer dato desde puerto
; OUT. Salida hacia puerto -> Enviar dato hacia puerto
;   Puerto de datos    -125
;   Puerto de control  -127
;
;*********************************************************************
#start=thermometer.exe#
.model small
.stack
.data
;****************************************
impSinColor MACRO msj
    mov ah, 9
    lea dx, msj
    int 21H
ENDM
;****************************************
    temperatura db 0
    msj         db 7,7,7,'Cerrando bodega$'
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov dx, 127 ;Asignar a dx, el numero de puerto de control 
    mov al, 1  
    out dx, al  ;1. para encender el termometro
                ;2. para apagar el termometro
ciclo:    
    in al, 125           ;leer el puerto 125 y lo guardamos en al
    mov temperatura, al  ;recuperar grados           
    cmp temperatura, 30  ;Comparar la temperatura con 60
    jae salir            ;Si es igual a 60 vamos a salir
    jmp ciclo            ;Caso contrario volvemos al bucle
    
salir:
    mov al, 2   ;Apagar termometro
    out dx, al  ;Asignar valor a dx
    
    ;Imprimir mensaje
    impSinColor msj
fin:    
    mov ax, 4c00h
    int 21H
    end