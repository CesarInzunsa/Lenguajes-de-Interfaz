;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: pasatiempo.asm 
;
; Unidad 3: Modularizacion
;        
;*********************************************************************
.model small
.stack
.data
    ruta  db 'C:\Achihualiztli',0
    msjS  db 'Se ha creado la carpeta$'
    msjN  db 'Error en la creacion de la carpeta o directorio$'
    
    msjM  db 'Ingresa una de tus fortalezas, debilidades, oportunidades y amenazas$'
    
    rutaArchivo db 'C:Achihualiztli\FODA.txt',0
    msjSi       db 'Se ha CREADO el archivo $'
    manejador   dw 0
    
    msjSi2      db 'Se ha ESCRITO el archivo $'    
    
    f db 10,'Fortaleza:' 
    d db 10,'Debilidades:'
    o db 10,'Oportunidades:'
    a db 10,'Amenazas:'
    
    msjF  db 'Fortalezas'
    datoF db 20, 0, 20, dup('$')
    
    msjD  db 'Debilidades'
    datoD db 20, 0, 20, dup('$')
    
    msjO  db 'Oportunidades'
    datoO db 20, 0, 20, dup('$')
    
    msjA  db 'Amenazas'
    datoA db 20, 0, 20, dup('$')
    
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

impConColor MACRO mensaje, long, ren, col, pag, modo, color
    mov ah, 19
    lea bp, mensaje
    mov cx, long
    mov dh, ren
    mov dl, col
    mov bh, pag
    mov al, modo
    mov bl, color
    int 10H      
ENDM

guardarDato MACRO variable
   mov ah, 10
   lea dx, variable
   int 21H
ENDM

crearArchivo MACRO ruta, tipoArchivo
    mov ah, 3CH
    lea dx, ruta
    mov cx, tipoArchivo
    int 21H    
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
    
;**********************************
.code
inicio:
    mov ax,@data
    mov ds, ax
    mov es, ax
    
    ;1. Crear la carpeta en el directorio C de Emmu8086
    mov ah, 39H
    lea dx, ruta
    int 21H
    JC error   ;NO OLVIDAR QUITAR EL COMENTARIO!!!!!!!!!!!!!!!!!!!
    ; JC = Bandera de acarreo encendida; Si se enciende hay error
    
    cursor 2,2,0
    impSinColor msjS
    
    ;2. Imprimir formulario
    cursor 5,5,0
    impSinColor msjM 
    
    ;Fortalezas
    impConColor msjF,10,7,10,0,0,1FH
    
    ;Debilidades
    impConColor msjD,11,7,50,0,0,6FH
    
    ;Oportunidades
    impConColor msjO,13,15,10,0,0,3FH
    
    ;Amenazas
    impConColor msjA,8,15,50,0,0,4FH
    
    ;3. Pedir informacion
    cursor 8,10
    guardarDato datoF 
    
    cursor 8,50
    guardarDato datoD
    
    cursor 16,10
    guardarDato datoO
    
    cursor 16,50
    guardarDato datoA
    
    ;4. Crear el archivo
    crearArchivo rutaArchivo, 32  ;El 32 es modo usuario    
    mov manejador, ax ;Recuperar ID
    ;JC error 
    cursor 20,2,0
    impSinColor msjSi
    
    ;5. Abrir el archivo
    abrirArchivo rutaArchivo, 2
    mov manejador, ax  ;Recuperar el ID del archivo
    JC error  ;Si hay algun error que mande el mensaje
    
    ;6. Escribir en el archivo
    escribirArchivo manejador, 11, f 
    escribirArchivo manejador, 10, datoF+2 ;disciplina
    
    escribirArchivo manejador, 13, d  
    escribirArchivo manejador, 9, datoD+2  ;paciencia
    
    escribirArchivo manejador, 15, o 
    escribirArchivo manejador, 6, datoO+2  ;Ingles
    
    escribirArchivo manejador, 10, a
    escribirArchivo manejador, 11, datoA+2  ;Experiencia
    
    cursor 21,2,0
    impSinColor msjSi2 
    jmp fin 

error:
    cursor 2,2,0
    impSinColor msjN
    
fin:
    mov ax,4c00h
    int 21H
    endend end