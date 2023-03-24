;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: leerArchivo.asm 
;
; Unidad 3: 
;
;*********************************************************************
.model small
.stack
.data
    ruta            db 'C:\INTERFAZ_InzunsaDiaz\Datos.txt',0
    msjSi           db 'Se ha OBTENIDO informacion del archivo$'
    msjNo           db 'No se ha podido RECUPERAR informacion del archivo$'
    manejador       dw 0                              
    leidos          db 200 dup ('$')
    ;El manejador es el ID de un archivo que retorna el Sistema operativo
    ;Tiene una longitud de 16 bits por lo tanto debe ser dw = define word
;***************************MACROS***************************            
CURSOR MACRO ren, col, pag
    mov ah, 2
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
    lea dx,ruta
    mov al,modoApertura
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

leerArchivo MACRO manejador, cuantosLeer, leidos
    mov ah, 3FH
    mov bx, manejador
    mov cx, cuantosLeer
    lea dx, leidos
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
    JC error          ;Si hay un error, lo manda a "error"
        
    ;2. Leer el archivo
    leerArchivo manejador, 72, leidos
    JC error
    
    ;3. Imprimir mensaje de exito
    cursor 3,20,0
    impSinColor msjSi
    
    ;4. Imprimir la informacion leida
    cursor 10,1,0
    impSinColor leidos
    jmp fin
    
error:
    cursor 12,35,0
    impSinColor msjNo    
    
fin:
    mov ax, 4c00h
    int 21H