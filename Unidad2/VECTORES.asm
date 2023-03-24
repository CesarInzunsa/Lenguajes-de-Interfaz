;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: VECTORES.asm 
;       
; Unidad 2 - Tema: Programación básica

; Instrucciones:
;    -Declara 2 vectores de 4 elementos cada uno
;    -Solicita el contenido de v1 y v2
;    -Declara v2 de 4 elementos inicializadors a CERO
;    -Realiza la suma de ambos vectores
;    -Imprimir a manera de columna los tres vectores 
;
;
; Fecha: 10 octubre 2022
;*********************************************************************
.model small
.stack
.data
    v1      db 0,0,0,0
    v2      db 0,0,0,0
    v3      db 0,0,0,0,0,0,0,0
    titulo  db '<V1>          <V2>          <V3>$'
    renglon db 7 
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    ;Imprimir titulo
    mov ah, 2   ;Cursor
    mov dh, 5   ;Renglon
    mov dl, 25  ;Columna
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, titulo
    int 21H
    
    ;1. Solciitar vectores
    mov cx, 4
    mov si, 0
    
    mov di, 0  ;Para v3
    
    
ciclo:
    ;---------------V1
    mov ah, 2
    mov dh, renglon
    mov dl, 25
    mov bh, 0
    int 10H
    
    mov ah, 1 ;Entrada de caracteres
    int 21H
    
    mov v1[si], al  ;Recuperar dato por teclado en vector v1
    sub v1[si], 30H
    
    ;---------------V2
    mov ah, 2
    mov dh, renglon
    mov dl, 40
    mov bh, 0
    int 10H
     
    mov ah, 1 ;Entrada de caracteres
    int 21H
    
    mov v2[si], al  ;Recuperar dato por teclado en vector v1
    sub v2[si], 30H
    
    ;---------------suma
    xor ax, ax
    mov al, v1[si]
    mov bl, v2[si]
    add al, bl
    AAA       
    
    ;ah = decenas
    ;al = unidades
    add ax, 3030H
    
    mov v3[di], ah ;Decenas
    inc di
    mov v3[di], al ;Unidades
    inc di

    ;ajustar
    inc si
    inc renglon
    
    loop ciclo
    
    ;2. Imprimir
    mov cx, 4
    mov si, 0
    mov renglon, 7
    
imprimir: 
    mov ah, 2
    mov dh, renglon
    mov dl, 54
    mov bh, 0
    int 10H
    
    mov ah, 2
    mov dl, v3[si]  ;Decenas
    int 21H
    inc si
    
    mov ah, 2
    mov dh, renglon
    mov dl, 55
    mov bh, 0
    int 10H
    
    mov ah, 2
    mov dl, v3[si]  ;Unidades
    int 21H
    inc si
    
    inc renglon
    loop imprimir

fin:
    mov ax, 4c00h
    int 21H
end