;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: copiarCadenas.asm 
;
; Unidad 3: Tema - Manipulacion de cadenas
;
; Si. Apuntador a la cadena fuente
; di. Apuntador a la cadena destino
;
; Prefijos de repetición, para el uso de instrucciones de cadena (concatenar, subcadena,
; rellenar una cadena, buscar elementos en una cadena) es necesario hacer uso de
; prefijos de repeticion;
; 
; REP. Repite CX veces
; REPE/REPEZ. Repite MIENTRAS sean IGUALES
; REPNE/REPNZ. Repite MIENTRAS sean DIFERENTES
;
; Por lo anterior es necesario trabajar con el registro contador.
; -----------------------CONCATENACION------------------------
; movsb. Mueve el contenido de una cadena fuente hacia una cadena destino, byte por byte
; 
;
;*********************************************************************
.model small
.stack
.data
    fuente  db 'Hola mundo$'
    destino db 20 dup('$')
    msjD db 'La cadena destino es:$'
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax  ;La cadena destino esta en el segmento extra
    
    ;1. Copiar de fuente a destino
    mov cx, 10
    lea si, fuente
    lea di, destino
    rep movsb ;copiar por byte por byte
    
    mov ah, 9
    lea dx, msjD
    int 21H
    
    mov ah, 2
    mov dh, 12
    mov dl, 30
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, destino
    int 21H
    
fin:
    mov ax, 4c00H
    int 21H
    end
    
        
