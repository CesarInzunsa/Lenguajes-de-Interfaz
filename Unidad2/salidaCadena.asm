; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: salidaCadena.asm
;
; Unidad 2. Tema: Interrupciones basicas 
;
; Instrucciones: Envia las siguientes cadenas como salida al monitor. Espera una tecla
;                para visualizar la siguiente cadena.
;
; Fecha: 19 de septiembre de 2022  27R3VDEFYFX4N0VC3FRTQZX            
; *************************************************************************************
.model small
.stack
.data
    nombre    db 7,10,13,'CESAR ALEJANDRO INZUNSA DIAZ $'
    noControl db 7,10,13,'19400595 $'
    semestre  db 7,10,13,'07 $'
    promedio  db 7,10,13,'100.00 $'
    ; 10 = Nueva linea
    ; 13 = Retorno de carro (como las maquinas de escribir, vuelta a la columna 0)
 
.code
    mov ax, @data
    mov ds, ax
    ; 1. Imprimir cadena
    mov ah, 9           ; Numero de servicio
    lea dx, nombre      ; Lea. Load Efective Address
    int 21H          
    ; 2. Esperar tecla para siguiente cadena
    mov ah, 7           ; Espera letra sin visualizar
    int 21H
    ; 3. Continuar
    mov ah, 9           ; Imprimir
    lea dx, noControl
    int 21H
    mov ah,7
    int 21H
    ;----> Imprimir el resto de las cadenas
    ;----> La salida final al portafolio
    mov ah, 9
    lea dx, semestre
    int 21H
    mov ah, 7
    int 21H
    
    mov ah, 9
    lea dx, promedio
    int 21H
    mov ah, 7
    int 21H
    
end                                          