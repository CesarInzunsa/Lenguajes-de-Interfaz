; ***********************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: Banderas.asm
;
; Tema: Banderasaritmeticas CF, PF, AF, ZF, SF
;
; Instrucciones: Codificiar los ejemplos vistos en clase y comprueba resultados.
;
; Fecha: 08 de septiembre de 2022              
; ***********************************************************                   

.model small
.stack
.data
.code
    mov ax, @data
    mov ds, ax
    
    ; --- EJEMPLO, CF = Bandera de acarreo --- 8 sept
    ; Se enciende cuando existe un acarreo de orden mas alto (mas a la izquierda).
    mov ax, 0FB12H
    mov bx, 1010H
    add ax, bx
    
    ; --- PF = Bandera de paridad ---
    ; Se enciende cuando la suma de la cantidad de unos que tiene es un numero par.
    mov al, 10
    mov bl, 10
    add al, bl
    
    ; --- AF = Bandera auxiliar --- 
    ; Se activa cuando existe una acarreo entre nibbles (4 bits).
    mov al, 12
    mov bl, 8
    add al, bl
    
    ; --- ZF = Bandera de cero --- 
    ; Se enciende cuando el resultado de una operacion arroja un cero.
    mov al, -1
    mov bl, 1
    add al, bl
    
    ; --- SF = Bandera de signo ---
    ; Se enciende cuando el resultado es un numero con signo
    mov al, 8
    neg al
    
end