; ***********************************************************
; NL: 23       Inzunsa Diaz Cesar Alejandro
; Guardar como: Pila.asm
; Unidad 1 - Tema Pila - Push - Pop - Movimientos SP y BD
; SP - Stack Pointer - Apuntador al Tope de la Pila
; BD - Base Pointer - Apuntar a la Base de la Pila
;  
; Instrucciones: Enviar a la pilalos caracteres 'AB', 'CD', 'EF', 'GH' 16 bits
;
; 1 caracter = 1 byte
; 2 bytes    = palabra = 2 caracteres
;
; Fecha: 05 de septiembre de 2022
; ***********************************************************

 .model small
 .stack
 .data
    msj db 'Datos insertados en la pila $'
    datos dw 00,00,00,00,'$'
    ; db = Define byte
    ; dw = Define palabra
 .code
    mov ax, @data
    mov ds, ax
    ; 1. INSERTAR EN LA PILA
    mov ax, 'AB'
    mov bx, 'CD'
    mov cx, 'EF'
    mov dx, 'GH'
        push ax ; Se envia el AB = 41H 42H
        push bx ; Se envia el CD = 43H 44H
        push cx ; Se envia el EF =
        push dx ; Se envia el GH =
   ; 2. EXTRAER DE LA PILA
        pop dx  ; 'GH' 
        pop bx  ; 'EF'
        pop cx  ; 'CD'
        pop dx  ; 'AB'
        
   ; 3. ASIGNAR AL VECTOR
   mov datos[0], ax ; HG
   mov datos[2], bx ;
   mov datos[4], cx ;
   mov datos[6], dx ;
   ; 4. IMPRIMIR DATOS
   mov AH, 9
   LEA DX, datos
   INT 21h
     
endd