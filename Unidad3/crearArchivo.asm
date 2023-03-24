;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: crearArchivo.asm 
;
; Unidad 3: 
;
; Ensamblador puede hacer uso UNICAMENTE de archivos de texto, que es posible
; visualizar a traves de un editor de texto como el bloc de notas.
;
; Sera necesario agregar MANIPULACION DE ARCHIVOS en los PROYECTOS.
;
; Instrucciones: crear el archivo Datos.txt
;         
;*********************************************************************
.model small
.stack
.data
    ruta       db 'C:INTERFAZ_InsunzaDiaz\Datos.txt',0
    msjSi      db 'Se ha CREADO el archivo $'
    msjNo      db 'No se ha podido crear el archivo $'
    manejador  dw 0
    ;El manejador es el ID de un archivo que retorna el Sistema operativo
    ;Tiene una longitud de 16 bits por lo tanto debe ser dw = define word
;***************************MACROS***************************            
CURSOR MACRO ren, col, pag
    mov ax, 2
    mov dh, ren
    mov dl, col
    mov bh, 0
    int 10H
ENDM
impSinColor MACRO cadena
    mov ah, 9
    lea cadena
    int 21H
ENDM
crearArchivo MACRO ruta, tipoArchivo
    mov ah, 3CH
    lea dx, ruta
    mov cx, tipoArchivo
    int 21H
    ;nota: lea interrupcion regresa el manejador en Ax
    
ENDM

    
;***************************FIN MACROS***********************
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax 
    
    ;1. Crear el archivo
    crearArchivo ruta, 32
    ; Modo 32 es un archivo de usuario
    
    mov manejador, ax ;Recuperar ID
    JC error 
    cursor 12,35,0
    impSinColor msjSi 
    jmp fin
    
error:
    cursor 12,35,0
    impSinColor msjNo
    
    
fin:
    mov ax, 4c00h
    int 21H
    end