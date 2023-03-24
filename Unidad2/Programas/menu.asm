;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: menu.asm 
;       
; Unidad 2 - Tema: CMP y Saltos condicionales
;
; Sintaxis CMP: CMP operando 1, operando 2
;               J (Salto correspondiente)
;
; Instrucciones: Parte 1: Diseña un menu para operaciones aritmeticas:
;                         Suma, Resta, Multiplicacion y division.
;                Parte 2: Solicitar n1 y n2.
;                Parte 3: Muestra el resultado correspondiente.
;
; Fecha: 26 septiembre 2022
;*********************************************************************
.model small
.stack
.data
    msjTitulo  db 178,178,'MEN',233,178,178,'$'
    msjOpS     db '1. Suma $'
    msjOpR     db '2. Resta $'
    msjOpM     db '3. Multiplicaci',162,'n $'
    msjOpD     db '4. Divisi',162,'n $'
    msjOpSalir db '5. Salir $'
    msjOp      db 'Selecciona tu opci',162,'n[ ]$'
    opcion     db 0
    n1         db 0
    n2         db 0
    r          db 0,0,'$' ; Decenas y unidades
    
    msjN1      db 'Dame n1: $'
    msjN2      db 'Dame n2: $'
    msjResul   db 'El resultado es: $'
    compDos    db 0
    
    
.code
inicio: 
        mov ax,@data
        mov ds,ax
        
        mov ah,2 ;Cursor
        mov dh,5 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Imprimir-Titulo
            lea dx,msjTitulo
            int 21h

        mov ah,2 ;Cursor
        mov dh,6 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Suma
            lea dx,msjOpS
            int 21h
        
        mov ah,2 ;Cursor
        mov dh,7 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Resta
            lea dx,msjOpR
            int 21h

        mov ah,2 ;Cursor
        mov dh,8 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Division
            lea dx,msjOpD
            int 21h
        
        mov ah,2 ;Cursor
        mov dh,9 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Multiplicacion
            lea dx,msjOpM
            int 21h
            
        mov ah,2 ;Cursor
        mov dh,10 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Salir
            lea dx,msjOpSalir
            int 21h
        
        mov ah,2 ;Cursor
        mov dh,11 ;ren
        mov dl,30;col
        mov bh,0
        int 10h
        
            mov ah,9 ;Selecciona
            lea dx,msjOp
            int 21h
            
        ;2.Esperar opcion
        
        mov ah,2
        mov dh,11
        mov dl,51
        mov bh,0
        int 10h
            mov ah,1;Esperar caracter
            int 21h              
    ;******              
    ; Recuperar caracter
    mov opcion, al
    
    CMP opcion, '5'
    JE fin
    
    ;3. Solicitar n1 y n2
     mov ah, 2
     mov dh, 18
     mov dl, 35
     mov bh, 0
     int 10H
        mov ah, 9
        lea dx, msjN1
        int 21H
     mov ah, 2
     mov dh, 18
     mov dl, 43
     mov bh, 0
     int 10H
        mov ah, 1     ;Esperar caracter
        int 21H
        mov n1, al    ; Recuperar caracter
        sub n1, 30H   ; Ajuste
     
     
     mov ah, 2
     mov dh, 19
     mov dl, 35
     mov bh, 0
     int 10H
        mov ah, 9
        lea dx, msjN2
        int 21H
     mov ah, 2
     mov dh, 19
     mov dl, 43
     mov bh, 0
     int 10H
        mov ah, 1     ;Esperar caracter
        int 21H
        mov n2, al    ; Recuperar caracter
        sub n2, 30H   ; Ajuste 
        
     
     
        
    
    
    ;4. Identificar opcion
    CMP opcion, '1'
    JE sumar
    CMP opcion, '2'
    JE restar
    CMP opcion, '3'
    JE multiplicar
    CMP opcion, '4'
    JE dividir
    
        JMP fin
    
sumar:
    xor ax, ax  ;Inicializar a CERO
    mov al, n1
    mov bl, n2
    add al, bl
    AAA         ;Ajuste ascii para despues de la suma
    add ax, 3030H
    ; AH = Decenas
    ; Al = Unidades
    
    mov r[0], ah
    mov r[1], al
    
    JMP imprimir    
restar:
    ;NOTA: Considerar cuando N2>n1, indica
    ; que debe IMPRIMIRSE un - y luego el numero negado
    ; 4 - 8 = -4
    xor ax, ax
    mov al, n1
    mov bl, n2
    cmp al, bl
    jl negar
      ;se puede restar e imprimir sin problema
      
      sub al, bl
      aam; ajuste ascii despues de multiplicar 
      ; Ah = decenas, y AL = unidades
      add ax, 3030H
      mov r[0], ah
      mov r[1], al
      
    JMP imprimir
    
negar:
    xor ax,ax
    mov al, n1
    mov bl, n2
    sub al, bl
    neg al     ; negar al para obtener el complemento a dos
    mov compDos, al
    add compDos, 30H ;agregar 30h para imprimir
    
    
    mov ah, 2
    mov dh, 21
    mov dl, 35
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjResul
    int 21H
    
    mov ah, 2
    mov dh, 21
    mov dl, 52
    mov bh, 0
    int 10H
    
    ;imprimir
    mov ah, 2   ;salida caracter
    mov dl, '-'
    int 21H
    
    mov ah, 2   ;cursor
    mov dh, 21
    mov dl, 53
    mov bh, 0
    int 10H
    
    mov ah, 2   ;salida caracter
    mov dl, compDos
    int 21H
    
    JMP fin   
multiplicar:
    JMP fin
dividir:
    JMP fin
    
imprimir:
    mov ah, 2 ;cursor
    mov dh, 21
    mov dl, 35
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjResul
    int 21H
    
    mov ah, 2 ;cursor
    mov dh, 21
    mov dl, 52
    mov bh, 0
    int 10H          
    
    mov ah, 9
    lea dx, r
    int 21H

fin:
    mov ax, 4c00h
    int 21H
END