;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: procedimientos.asm 
;
; Unidad 3: Tema - Procedimientos y diferencia con macros
;
; Los procedimientos sirven y reducen la cantidad de lineas en el codigo objeto
; a diferencia de las macros.
; Los procedimientos no reciben ni regresan parametros
;
; Sintaxis: nombreProcedimiento PROC
;               <Cuerpo del procedimiento>
;           nombreProcedimiento ENDP
;
; Las macros van despues del segmento de datos y los procedimientos despues
; de las interrupciones de salida. 
;
;*********************************************************************
.model small
.stack
.data 
    vector    db '+*P023-/' ;8
    vector2   db 0,0,0,0    ;4
    msjVector db 'Vector$'
    msjTecla  db 'Presiona una tecla para cambio de pagina$'
    renglon   db 5
;************************MACROS****************************
imp_cad_sincolor macro cadena
    mov ah, 9
    lea dx, cadena
    int 21H
ENDM
leer_caracter macro
    mov ah, 1
    int 21H ;Regresaen al el caracter
ENDM
cursor macro ren, col, pag
    mov ah, 2
    mov dh, ren
    mov dl, col
    mov bh, 0
    int 10H
ENDM

visualiza_caracter macro caracter
    mov ah, 2
    mov dl, caracter
    int 21H    
ENDM

ciclo_imp_vertical macro cadena, columna, long
    ;En caso de utilizar etiquetas en las macros
    ;deben declararse para que no marque error
local ciclo
    mov si, 0
    mov cx, long           
ciclo:
    cursor renglon, columna, 0
    visualiza_caracter cadena[si]
    
    inc renglon
    inc si
    loop ciclo          
ENDM

;************************FIN MACROS************************
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ciclo_imp_vertical vector, 40, 8 ;Primer vector
    
    ;Solicitar elementos para vector2
    mov si, 0
    mov cx, 4
    mov renglon, 5
    
ciclo2:        
    cursor renglon, 10, 0
    leer_caracter
    mov vector2[si], al  ;Recuperar
    inc si
    inc renglon
    loop ciclo2    
    
    ;3. Imprimir el segundo vector en la columna 70
    mov renglon, 5
    ciclo_imp_vertical vector2, 70, 4
    
   
   ;4. Imprimir mensaje esperando tecla
   cursor 21,30,0 
   imp_cad_sincolor msjTecla
   ;5. Llamar el procedimiento
   call tecla
    
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