          ;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: copyCadTeclado.asm 
;
; Unidad 3: Tema - Manipulacion de cadenas
;
; MOVSB Copiar de la cadena FUENTE hacia cadena DESTINO.
; Si. Apuntador a la cadena fuente
; di. Apuntador a la cadena destino
;
; Instrucciones: Solicitar una cadena desde teclado, copiar a una cadena destino.
;                Imprimir para comprobar. Hace uso de MACROS y PROCEDIMIENTOS.
;
;*********************************************************************
.model small
.stack
.data 
    materia   db 38,0,38 dup('$')  ;Leer una materia
    salida    db 300 dup('$')        ;Reserva sin rellenar
                                 ; ? No asignar ningun valor
    msjM      db 'Materia por cursar:$'
    msjSig    db 'Deberias aprobar la materia de LI$'
    matSP     db 'SISTEMAS PROGRAMABLES' ;21         
    msjCoordi db 'Consulta con tu coordinador$'

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

leerCadena MACRO cadena
    mov ah, 10
    lea dx, cadena
    int 21H
ENDM

copiarCadena MACRO fuente, destino, cantidad
    mov cx, cantidad
    lea si, fuente
    lea di, destino
    rep movsb 
ENDM

compararCadena MACRO fuente, destino, cantidad
    mov cx, cantidad
    lea si, fuente
    lea di, destino
    repe CMPSB
ENDM
    
;***************************FIN MACROS***********************
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ;1. Solicitar materia a cursar
    cursor 10,30,0
    impSinColor msjM
    
    cursor 11,30,0
    leerCadena materia
    
    ;2. Recuperar la longitud de la cadena
    xor cx, cx ;mov cx,0                  
    mov cl, materia[1]
    
    ;3. Copiar el nombre de la materia
    copiarCadena materia+2, salida, cx
    
    ;4. Verificar que se ha copiado la cadena
    cursor 20,30,0
    impSinColor salida
    
    ;5. Comparar si la cadena leida es sistemas programables
    compararCadena salida, matSP, 21
    JZ iguales
    ;son diferentes
    cursor 16,30,0
    impSinColor msjCoordi
    jmp fin
    
iguales:              
    cursor 16,30,0
    impSincolor msjSig
    
fin:
    mov ax, 4c00H
    int 21H
;************************PROCEDIMIENTOS****************************
tecla proc
    mov ah, 0
    int 16H        
ret  ;return
tecla endp

;************************FIN PROCEDIMIENTOS************************
    END