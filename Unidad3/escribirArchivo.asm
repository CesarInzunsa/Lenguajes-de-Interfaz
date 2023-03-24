;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: escribirArchivo.asm 
;
; Unidad 3: 
;
; Ensamblador puede hacer uso UNICAMENTE de archivos de texto, que es posible
; visualizar a traves de un editor de texto como el bloc de notas.
;
; Sera necesario agregar MANIPULACION DE ARCHIVOS en los PROYECTOS.
;
; Instrucciones: Escribir tus datos academicos en el archivo Datos.txt
;
; PARTE 2 -> Enviar por medio de otras cadenas promedio, habilidades y foto.
;         
;*********************************************************************
.model small
.stack
.data
    promedio    db 10,'100'
    habilidades db 10,'Ser perfecto'
    foto        db 10,'Una foto del cesar :)'

    ruta            db 'C:\INTERFAZ_InzunsaDiaz\Datos.txt',0
    msjSi           db 'Se ha ESCRITO el archivo $'
    msjNo           db 'No se ha podido escribir el archivo $'
    manejador       dw 0                              
    DatosEstudiante db 'No. Control: 19400595, Nombre: Cesar Alejandro Inzunsa Diaz, Carrera ISC'
    ;72
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
    lea dx, cadena
    int 21H
ENDM
crearArchivo MACRO ruta, tipoArchivo
    mov ah, 3CH
    lea dx, ruta
    mov cx, tipoArchivo
    int 21H
    ;nota: lea interrupcion regresa el manejador en Ax    
ENDM
abrirArchivo MACRO ruta, modoApertura
    mov ah,3DH
    lea dx, ruta
    mov al, modoApertura
    int 21H
    ;modos de apertura:
    ;0 = solo lectura 
    ;1 = solo escritura 
    ;2 = lectura y escritura                             
ENDM
escribirArchivo MACRO manejador, totalEscribir, datosEscribir
    mov ah, 40H
    mov bx, manejador
    mov cx, totalEscribir
    lea dx, datosEscribir
    int 21H   
ENDM
    
;***************************FIN MACROS***********************
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax 
                        
    ;1. Abrir el archivo                    
    abrirArchivo ruta, 2
    mov manejador, ax ;Recuperar ID
    JC error    
    ;2. Escribir en el archivo
    ;escribirArchivo MACRO manejador, totalEscribir, datosEscribir
    escribirArchivo manejador, 72, DatosEstudiante 
    escribirArchivo manejador, 4, promedio
    escribirArchivo manejador, 13, habilidades
    escribirArchivo manejador, 22, foto
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