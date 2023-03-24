; ***********************************************************
; NL: 23       Inzunsa Diaz Cesar Alejandro
; Guardar como: Indice.asm
; Unidad 1 - Registros inices
;
; SI: Registro indice fuente   - 16 bits
; DI: Registro indice destino  - 16 bits
;
; Funcion: Manipulacion de vectores o arreglos
; Fecha: 07 de septiembre de 2022
; Intrucciones: Haciendo uso de SI o DI, transfiere el contenido de v1 hacia v2.
; ***********************************************************
.model        ; Tipo modelo: modelo pequeño
.stack        ; Pila         = SS
.data         ; Datos        = DS
    v1 db 'L','I','A','D','$'  ; Vector
    v2 db 0,0,0,0, '$'
.code         ; Codigo       = CS
    mov ax,@data
    mov ds,ax
    ; 1. Inicializar indices
    mov si,0
    ; 2. Transferir cada elemento
    
    ; Primer elemento
    mov al, v1[si]
    mov v2[si],al
    
    ; Invalido de memoria a memoria, no se puede enviar de forma directa
    ; mov v2[si], v1[si] 
    
    ; Segundo elemento
    inc si
    mov cl, v1[si]
    mov v2[si], cl
    
    ; Tercer elemento 
    inc si
    mov bh, v1[si]
    mov v2[si], bh
    
    ; Cuarto elemento
    inc si
    mov al, v1[si]
    mov v2[si],al
    
    ; Imprimir v2
    mov ah, 9
    lea dx, v2
    int 21h     ; Manda a llamar una interrupcion 21h 
end