;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM
; NL: 05          Nombre: Cristian Gerardo Enciso Luna 
;
; Guardar como: Inzunsa_Enciso.asm 
;
; Unidad 3: Motor stepper motor
;
;*********************************************************************
#start=stepper_motor.exe#

.model small
.stack
.data
    ; bin data for clock-wise
    ; half-step rotation:
    datcw    db 0000_0110b
             db 0000_0100b    
             db 0000_0011b
             db 0000_0010b
    
    ; bin data for counter-clock-wise
    ; half-step rotation:
    datccw   db 0000_0011b
             db 0000_0001b    
             db 0000_0110b
             db 0000_0010b
    
    
    ; bin data for clock-wise
    ; full-step rotation:
    datcw_fs db 0000_0001b
             db 0000_0011b    
             db 0000_0110b
             db 0000_0000b
    
    ; bin data for counter-clock-wise
    ; full-step rotation:
    datccw_fs db 0000_0100b
              db 0000_0110b    
              db 0000_0011b
              db 0000_0000b  
    
    msj    db 'Ingresa la direccion del motor:$'
    m1     db '1. Medio paso manecillas del reloj$'
    m2     db '2. Medio paso en contra de las manecillas del reloj$'
    m3     db '3. Paso completo manecillas del reloj$'
    m4     db '4. Paso completo en contra de las manecillas del reloj$'
    opcion db 0
;************************MACROS****************************
cursor macro ren, col, pag
    mov ah, 2
    mov dh, ren
    mov dl, col
    mov bh, 0
    int 10H
ENDM

impCadSinColor macro cadena
    mov ah, 9
    lea dx, cadena
    int 21H
ENDM
;************************FIN MACROS************************    
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax 
    
    
name "stepper"

steps_before_direction_change = 20h ;32(decimal)

    
; 1. Mostrar msj para pedir direccion
cursor 2,2,0
impCadSinColor msj

; 2. Mostrar menu
cursor 4,2,0
impCadSinColor m1

cursor 5,2,0
impCadSinColor m2

cursor 6,2,0
impCadSinColor m3

cursor 7,2,0
impCadSinColor m4

; 3. Ingresar digito que corresponda a la opcion a realizar
cursor 2,34,0

mov ah, 1
int 21H 

; 4. Comparar el numero y enviar el dato correspondiente al offset 
mov opcion, al
 
CMP opcion, '1'
JE opcion1 

CMP opcion, '2'
JE opcion2 

CMP opcion, '3'
JE opcion3

CMP opcion, '4'
JE opcion4

JMP fin

opcion1:
mov bx, offset datcw ; start from clock-wise half-step. Inicializa el puntero
mov si, 0 ;Inicializa el contador
mov cx, 0 ; step counter  Inicializa el contador con el numero de pasos
JMP next_step     

opcion2:
mov bx, offset datccw
mov si, 0 
mov cx, 0 
JMP next_step

opcion3:
mov bx, offset datcw_fs
mov si, 0 
mov cx, 0 
JMP next_step

opcion4:
mov bx, offset datccw_fs
mov si, 0 
mov cx, 0 
JMP next_step

next_step:
; motor sets top bit when it's ready to accept new command
wait:   in al, 7      ;Obtiene la data del puerto 7 al acumulador
        test al, 10000000b ;Realiza operacion AND entre dos datos
        jz wait   ;Salta al WAIT si el resultado del test es zero

mov al, [bx][si]  ;Almacena el resultado en el acumulador
out 7, al         ;Envia la data del acumulador al puerto 7

inc si            ;Incrementa el contador

cmp si, 4         ;Comparar si el contador es igual a 4
jb next_step      ;Salta si la bandera de acarreo es igual a 1
mov si, 0         ;Inicializa el contador a 0

inc cx            
cmp cx, steps_before_direction_change
jb  next_step

mov cx, 0
add bx, 4 ; next bin data

cmp bx, offset datccw_fs
jbe next_step

mov bx, offset datcw ; return to clock-wise half-step.

jmp next_step, 4 ; next bin data

cmp bx, offset datccw_fs
jbe next_step

mov bx, offset datcw ; return to clock-wise half-step.

jmp next_step

fin:
    mov ax, 4c00h
    int 21H
END