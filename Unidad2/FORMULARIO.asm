;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: FORMULARIO.asm 
;       
; Unidad 2 - Tema: Entrada de cadena desde teclado 
;
; Instrucciones: Leer una cadena que represente el nombre de una persona.
;                Visualice nuevamente la cadena para verificar resultado.
;                Solicita noCtrol, nombre, carrera y promedio de un estudiante
;                -Haz uso de marcos de colores
;                -Entrada de cadenas
;                -Visualiza la informacion en la parte inferior de la pantalla.
;                   
;
; sintaxis: mov ah, 10 (0AH)    
;           lea dx, cadena
;           int 21H
;
; Fecha: 12 octubre 2022
;*********************************************************************
.model small
.stack
.data
    noCtrol  db 9,  0, 9  dup ('$')
    nombre   db 32, 0, 32 dup ('$')
    carrera  db 41, 0, 41 dup ('$')
    promedio db 4,  0, 4  dup ('$')
    msjNC db 'No. Control:         '
    msjN  db 'Nombre:              '
    msjC  db 'Carrera:             '
    msjP  db 'Promedio:            '
    msjG  db 'Guardar datos (S/N)? '
    msjT  db 'SISTEMA INTEGRAL DE INFORMACI',224,'N-SII'  
    
    opcion db 2, 0, 2 dup('$')
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ;1.

pantalla:
    ;1. Imprimir pantalla de formulario
    
    mov ah, 2
    mov dh, 0
    mov dl, 0
    mov bh, 0
    int 10H 
    
    mov ah, 9
    mov cx, 80
    mov al, 205
    mov bl, 74H  ;Fondo blanco letras rojas
    mov bh, 0
    int 10H
    
    ;2. Barra de titulo 
    mov ah, 2
    mov dh, 6
    mov dl, 0
    mov bh, 0
    int 10H 
    
    mov ah, 9
    mov cx, 80
    mov al, 205
    mov bl, 74H
    mov bh, 0
    int 10H
    
    ;3. Barra inferior 
    mov ah, 2
    mov dh, 24
    mov dl, 0
    mov bh, 0
    int 10H 
    
    mov ah, 9
    mov cx, 80
    mov al, 205
    mov bl, 74H
    mov bh, 0
    int 10H
    
    ;4. Imprimir el titulo
    mov ah, 19    ;Cadena de color
    lea bp, msjT  ;Mensaje
    mov cx, 35    ;Longitud
    mov dh, 3     ;Ren
    mov dl, 20    ;Col
    mov bh, 0     ;Pag
    mov al, 0     ;Modo cero
    mov bl, 74H   ;color
    int 10H
    
    ;5. Imprimir formulario 
    
    ;No. Control
    mov ah, 19    ;Cadena de color
    lea bp, msjNC ;Mensaje
    mov cx, 21    ;Longitud
    mov dh, 8     ;Ren
    mov dl, 20    ;Col
    mov bh, 0     ;Pag
    mov al, 0     ;Modo cero
    mov bl, 74H   ;color
    int 10H
        
        ;Guardar No. Control 
        mov ah, 2
        mov dh, 8
        mov dl, 32
        mov bh, 0
        int 10H
        
        mov ah, 10
        lea dx, noCtrol
        int 21H
        
    ;Nombre
    mov ah, 19    
    lea bp, msjN 
    mov cx, 21    
    mov dh, 9     
    mov dl, 20    
    mov bh, 0     
    mov al, 0     
    mov bl, 74H   
    int 10H
        
        ;Guardar nombre
        mov ah, 2
        mov dh, 9
        mov dl, 27
        mov bh, 0
        int 10H
        
        mov ah, 10
        lea dx, nombre
        int 21H
    
    ;Carrera
    mov ah, 19    
    lea bp, msjC 
    mov cx, 21    
    mov dh, 10     
    mov dl, 20    
    mov bh, 0     
    mov al, 0     
    mov bl, 74H   
    int 10H 
    
        ;Guardar carrera
        mov ah, 2
        mov dh, 10
        mov dl, 28
        mov bh, 0
        int 10H
        
        mov ah, 10
        lea dx, carrera
        int 21H 
    
    ;Promedio        
    mov ah, 19    
    lea bp, msjP 
    mov cx, 21    
    mov dh, 11     
    mov dl, 20    
    mov bh, 0     
    mov al, 0     
    mov bl, 74H   
    int 10H
        ;Guardar promedio
        mov ah, 2
        mov dh, 11
        mov dl, 29
        mov bh, 0
        int 10H
        
        mov ah, 10
        lea dx, promedio
        int 21H
    
    ; Guardar informacion?
    mov ah, 19    
    lea bp, msjG 
    mov cx, 21    
    mov dh, 15     
    mov dl, 20    
    mov bh, 0     
    mov al, 0     
    mov bl, 74H   
    int 10H
        
    ;6.Esperar opcion    
    mov ah, 2
    mov dh, 15
    mov dl, 40
    mov bh, 0
    int 10h
    
    mov ah, 1
    int 21h 
                            
    ;7. Recuperar caracter
    mov opcion, al
    
    ;8. Identificar opcion 
    CMP opcion, 'S'
    JE visualizar
    CMP opcion, 'N'
    JE fin
    CMP opcion, 's'
    JE visualizar
    CMP opcion, 'n'
    JE fin
        
visualizar:      
    ;9. Linea para visualizacion 
    mov ah, 19        ;Cadena de color
    lea bp, noCtrol+2 ;Mensaje
    mov cx, 8         ;Longitud
    mov dh, 17        ;Renglon
    mov dl, 20        ;Columna
    mov bh, 0         ;Pagina
    mov al, 0         ;Modo cero
    mov bl, 07H       ;color
    int 10H
    
    mov ah, 2
    mov dh, 18
    mov dl, 20
    mov bh, 0
    int 10H
   
    mov ah, 9
    lea dx, nombre+2 
    int 21H
    
    mov ah, 2
    mov dh, 19
    mov dl, 20
    mov bh, 0
    int 10H
   
    mov ah, 9
    lea dx, carrera+2 
    int 21H
    
    mov ah, 2
    mov dh, 20
    mov dl, 20
    mov bh, 0
    int 10H
   
    mov ah, 9
    lea dx, promedio+2 
    int 21H
     
    jmp inicio              
    
fin:
    mov ax,4c00h
    int 21H
end