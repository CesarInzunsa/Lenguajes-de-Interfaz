; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: resta.asm
;
; Unidad 2. Tema: Entrada y salida de caracteres AJUSTE DIGITOS DECIMAL (0 - 9) 
;
; Instrucciones: Solicite n1 y n2. Realice la resta de n1 - n2. Considere que por el MOMENTO
;                n1 >= n2
;
; Fecha: 20 de septiembre de 2022            
; *************************************************************************************
.model small
.stack
.data
    n1 db 0
    n2 db 0
    r  db 0, '$'
    mensaje1 db 10,13,'Dame <n1>: $'
    mensaje2 db 10,13,'Dame <n2>: $'
    mensaje3 db 10,13,'El resultado de la RESTA es: $'
.code
    mov ax, @data
    mov ds, ax
    
    ;1. Solicitar n1
    mov ah, 9
    lea dx, mensaje1
    int 21H         
    
    ;Lectura del dato
    mov ah, 1
    int 21H
    mov n1, al
    sub n1, 30H
        
    ;2. Solicitar n2
    mov ah, 9
    lea dx, mensaje1
    int 21H
    
    ;Lectura le dato
    mov ah, 1
    int 21H
    mov n2, al
    sub n2, 30H
    
    ;3. Realizar la resta
    mov al, n1
    mov bl, n2
    sub al, bl
    
    ;Asignar el resultado a r
    mov r, al
    add r, 30H
    
    ;4. Imprimir el resultado
    mov ah, 9
    lea dx, mensaje3
    int 21H
    
    mov ah, 9
    lea dx, r
    int 21H

end