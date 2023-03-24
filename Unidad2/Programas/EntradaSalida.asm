; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: EntradaSalida.asm
;
; Unidad 2. Tema: Entrada y salida de caracteres AJUSTE DIGITOS DECIMAL (0 - 9) 
;
; Instrucciones: Realice la lectura de dos digitos decimales y obtenga la SUMA.
;
; Fecha: 20 de septiembre de 2022            
; *************************************************************************************
.model small
.stack
.data
    n1 db 0
    n2 db 0
    r  db 0, '$'
    ;NOTA: Por el momento el resultados MENORES O IGUALES A 9(0 - 9)
    mensaje1 db 10,13, 'Dame n1: $'
    mensaje2 db 10,13, 'Dame n2: $'
    mensaje3 db 10,13, 'El resultado de la suma es: $'
.code
    mov ax, @data
    mov ds, ax
    
    ; 1. Solicitar n1
    mov ah, 9
    lea dx, mensaje1  ;LEA = Load Efective Address
    int 21H
    
    mov ah,1          ;Entrada de caracter
    int 21H           ;Regresa en <AL> el caracter
    mov n1, al        ;Recuperar
    sub n1, 30H       ;Se llama ajuste decimal; siempre restar 30H
    
    ; 2. Solicitar n2
    mov ah, 9
    lea dx, mensaje2
    int 21H
    
    mov ah,1
    int 21H
    mov n2, al
    sub n2, 30H
    
    ; 3. Realiza suma
    mov al, n1
    mov bl, n2
    add al, bl    ;SUMAR AL AL + BL
    mov r, al     ;ASIGNAR RESULTADO
    add r, 30H    ;CONVERTIR A ASCII
    
    ; 4. Imprimir resultado
    mov ah, 9
    lea dx, mensaje3
    int 21H
    
    mov ah, 9
    lea dx, r    ;Imprimir resultado
    int 21H
    
    
    
end