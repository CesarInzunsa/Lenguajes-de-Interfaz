;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: rutas.asm 
;
; Unidad 3: macros y procedimientos

; macros: simulan macros pero no reducen codigo 
;
; Procedimientos. Si reducen codigo pero no reciben regresan parametros. 
;
; Instrucciones: Dentro de crear una carpeta con tu el nombre INTERFAZ_InzunsaDiaz
;                Agregar las carpetas U1, U2, U3 y U4
;         
;*********************************************************************
.model small
.stack
.data
    ruta1 db 'C:\INTERFAZ_InzunsaDiaz',0  ;debe de terminar con un 0 por que si no, no funciona
    ruta2 db 'C:\INTERFAZ_InzunsaDiaz\U1',0
    ruta3 db 'C:\INTERFAZ_InzunsaDiaz\U2',0
    ruta4 db 'C:\INTERFAZ_InzunsaDiaz\U3',0 
    ruta5 db 'C:\INTERFAZ_InzunsaDiaz\U4',0  
    msj db 'Se ha creado la carpeta$'
    msjN db 'No se ha podido crear la carpeta$'
    
;**********************************
cursor macro ren, col, pag
    mov ah, 2
    mov dh, ren
    mov dl, col
    mov bh, 0
    int 10H
endm

impSinColor macro msj
    mov ah, 9
    lea dx, msj
    int 21H
    
endM

crearCarpeta macro ruta
    mov ah, 39h
    lea dx, ruta
    int 21H
endM
    
;**********************************
.code
inicio:
    mov ax,@data
    mov ds, ax
    mov es, ax
    
    ;1. Crear la carpeta en C de Emmu8086
    crearCarpeta ruta1
    JC error ; JC = Bandera de acarreo encendida
             ; Si se enciende hay error
    crearCarpeta ruta2
    JC error
    
    cursor 20,30,0
    impSinColor msj         
             
    jmp fin  ; Si no hay error 

error:
    cursor 20,30,0
    impSinColor msjN
    
    
fin:
    mov ax,4c00h
    int 21H
    end  
  JC error ; JC = Bandera de acarreo encendida
             ; Si se enciende hay error
    
    cursor 20,30,0
    impSinColor msj         
             
    jmp fin  ; Si no hay error 

error:
    cursor 20,30,0
    impSinColor msjN
    
    
fin:
    mov ax,4c00h
    int 21H
    end  
in:
    mov ax,4c00h
    int 21H
    end  
in:
    mov ax,4c00h
    int 21H
    end  
