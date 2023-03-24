;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA: 8AM   
;
; Guardar como: Div.asm 
;       
; Unidad 2 - Tema: Instrucciones aritméticas 
;
; Instrucciones: Diseña un programa en ensamblador que realice y visualice la división.
;
; Fecha: 03 septiembre 2022
;*********************************************************************
.model small
.stack
.data  
    dividendo db 0, '$'
    divisor   db 0, '$'
    residuo   db 0, '$'
    cociente  db 0, '$'
    
    msjDividendo  db 'Dame el dividendo: $'
    msjDivisor    db 'Dame el divisor: $'
    msjResiduo    db 'El residuo es: $' 
    msjCociente   db 'El cociente es: $'
    
    linea         db '___________$'
    txtDivisor    db 'Divisor$'
    txtResiduo    db 'Residuo$'
    txtDividendo  db 'Dividendo$'
    txtCociente   db 'Cociente$'
    
.code
inicio:
    mov ax, @data
    mov ds, ax
    
    ;1. Pedir por teclado el dividendo
        
        ;1.1 Posicionar el cursor
        mov ah, 2   ;Cursor
        mov dh, 1   ;Renglon
        mov dl, 1   ;Columna
        mov bh, 0
        int 10H
    
        ;1.2 Imprimir el mensaje
        mov ah, 9
        lea dx, msjDividendo
        int 21H
        
        ;1.3 Acomodar cursor
        mov ah, 2   ;Cursor
        mov dh, 1   ;Renglon
        mov dl, 20  ;Columna
        mov bh, 0
        int 10H
            
        ;1.4 Esperar entrada por teclado
        mov ah, 1 
        int 21H
        
        ;1.5 Ajuste
        sub al, 30H
        mov dividendo, al          
    
    ;2. Pedir por teclado el divisor
    
        ;2.1 Posicionar el cursor
        mov ah, 2   ;Cursor
        mov dh, 2   ;Renglon
        mov dl, 1   ;Columna
        mov bh, 0
        int 10H
        
        ;2.2 Imprimir el mensaje
        mov ah, 9
        lea dx, msjDivisor
        int 21H
        
        ;2.3 Acomodar cursor
        mov ah, 2   ;Cursor
        mov dh, 2   ;Renglon
        mov dl, 20  ;Columna
        mov bh, 0
        int 10H
            
        ;1.4 Esperar entrada por teclado
        mov ah, 1 
        int 21H
        
        ;1.5 Ajuste
        sub al, 30H
        mov divisor, al
        
    ;3. Realizar la division 
    
        ;3.1 Inicializar a cero
        xor ax, ax
        
        ;3.2 Realizar la division
        mov al, dividendo
        mov bl, divisor
        div bl
        aaa
        add ax, 3030H
        
        ;AH = Residuo
        ;AL = Cociente
        
        ;3.3 Guardar residuo y cociente        
        mov residuo, ah
        mov cociente, al
                 
    ;4. Imprimir por pantalla
    
        ;Dibujar lineas
        mov ah, 2   ;Cursor
        mov dh, 6   ;Renglon
        mov dl, 21  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 02H
        mov dx, 7CH
        int 21H 
        
        mov ah, 2   ;Cursor
        mov dh, 5   ;Renglon
        mov dl, 21  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, linea
        int 21H
    
        ;4.1 Imprimir el divisor
        mov ah, 2   ;Cursor
        mov dh, 6   ;Renglon
        mov dl, 17  ;Columna
        mov bh, 0
        int 10H
        
        add divisor, 30H
        mov ah, 9
        lea dx, divisor
        int 21H
        
        ;4.2 Imprimir el dividendo
        mov ah, 2   ;Cursor
        mov dh, 6   ;Renglon
        mov dl, 25  ;Columna
        mov bh, 0
        int 10H
        
        add dividendo, 30H
        mov ah, 9
        lea dx, dividendo
        int 21H
        
        ;4.3 Imprimir el cociente
        mov ah, 2   ;Cursor
        mov dh, 4   ;Renglon
        mov dl, 25  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, cociente
        int 21H
        
        ;4.4 Imprimir el residuo
        mov ah, 2   ;Cursor
        mov dh, 8   ;Renglon
        mov dl, 25  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, residuo
        int 21H
        
        
        ;4.5 Imprimir texto
        mov ah, 2   ;Cursor
        mov dh, 7   ;Renglon
        mov dl, 12  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, txtDivisor
        int 21H
        
        
        mov ah, 2   ;Cursor
        mov dh, 6   ;Renglon
        mov dl, 33  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, txtDividendo
        int 21H
        
        
        mov ah, 2   ;Cursor
        mov dh, 10   ;Renglon
        mov dl, 23  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, txtResiduo
        int 21H
        
        
        mov ah, 2   ;Cursor
        mov dh, 3   ;Renglon
        mov dl, 29  ;Columna
        mov bh, 0
        int 10H
        
        mov ah, 9
        lea dx, txtCociente
        int 21H          
    
fin:
    mov ax, 4c00h
    int 21H  
end