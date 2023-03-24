; *************************************************************************************
; NL: 23    |    Inzunsa Diaz Cesar Alejandro    |    Hora: 8-9
; Guardar como: etiquetas.asm
;
; Unidad 2. Tema: Etiquetas y saltos CONDICIONALES 
;
; Instrucciones: JMP es un salto INCONDICIONAL. Las etiquetas oermiten modificar el flujo de un
;                programa: Ayuda a SIMULAR CICLOS y en general cualquier estructura de control.                                
;
; Declaracion de etiquetas = Deben respetarse la reglas para definir una variable.
; Ejemplo: nombreEtiqueta:
;
; Sintaxis JMP: Salto INCONDICIONAL -no pregunta y salta
;               JMP nombreEtiqueta
;
; Fecha: 21 de septiembre de 2022            
; *************************************************************************************
.model small
.stack
.data
    nombre    db 10,13,'xxxxxxxx $'
    celular   db 10,13,'xxxxxxxx $'
    domicilio db 10,13,'xxxxxxxx $'
    
.code
    inicio: mov ax, @data
            mov ds, ax
    
    impNombre:
        mov ah, 9
        lea dx, nombre
        int 21H
        
    impCelular:
        mov ah, 9
        lea dx, celular
        int 21H
        
    impDomicilio:
        mov ah, 9
        lea dx, domicilio
        int 21H
        JMP salir
        
    salir:
        mov ax, 4c00h ;Finalizar programa y liberar memoria
        int 21H
end