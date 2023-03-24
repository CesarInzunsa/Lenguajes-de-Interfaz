;*********************************************************************
; NL: 23 Cesar Alejandro Inzunsa Diaz  HORA:8AM   
;
; Guardar como: PrinterProyecto.asm 
;       
; Unidad 2 - Tema: Interrupcion para impresora 
;
; Instrucciones: Solicita 3 datos de tu proyecto que se van a requerir enviar a la imprespra
;                                   
; sintaxis: mov ah, 5
;           mov dl, offset_mensaje
;           int 21H
;                mov dl, 12 -->Nueva pagina (Limpiar impresora)
;
; Fecha: 13 octubre 2022
;********************************************************************* 
.model small
.stack
.data
    temperatura db 4, 0, 4 dup('$')
    dato2       db 4, 0, 4 dup('$')
    dato3       db 4, 0, 4 dup('$')
    proyecto    db '<<PROYECTO: AquaMonitoreo>>'    ;27 
    miTecla     db 'Presiona una tecla para finalizar...$'
    
    msjT1       db 'Indica la temperatura: $'
    msjT_i      db 10,10,10,'La temperatura registrada es:'  
    
    msjT2       db 'Indica el nivel de contaminacion: $'
    msjT2_i     db 10,'El nivel de contaminacion es:'   
    
    msjT3       db 'Indica la cantidad de agua no contaminada: $'  
    msjT3_i     db 10,'La cantida de agua no contaminada es:'  
.code
inicio:
    mov ax, @data
    mov ds, ax
    mov es, ax  
    
    ;1. Enviar mensaje de titulo
    mov ah, 5                  ;NUEVA HOJA
    mov dl, 12
    int 21H
    
    mov si, offset proyecto    ;lea dx, proyecto que es el nombre del proyecto   
    
    mov cx, 27                 ;No. de caracteres que leera la impresora
       
IMPRIME:
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP IMPRIME 
    
    ;2. Leer la temperatura
    mov ah, 2
    mov dh, 12
    mov dl, 25
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjT1     ;Indica la temperatura: $
    int 21H
    
    mov ah, 2
    mov dh, 12
    mov dl, 47
    mov bh, 0
    int 10H
    
    mov ah, 10
    lea dx, temperatura     ;guardamos la temperatura registrada
    int 21H
    
    ;imprimimos mensaje de temp registrada y demas...
    mov si, offset msjT_i  
    mov cx, 32
    
imp_mTemp:
    mov ah, 5
    mov dl, [si]
    int 21H
    inc si
    loop imp_mTemp
    
    ;imprimimos la temperatura
    mov si, offset temperatura+2   
    mov cx, 3
    
imp_temp:  
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP imp_temp
    
    ;3. Nivel de contaminacion     (Litros)
    
    ;pedir nivel de contaminacion 
    mov ah, 2
    mov dh, 13
    mov dl, 25
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjT2
    int 21H 
    
    mov ah, 2
    mov dh, 13
    mov dl, 58
    mov bh, 0
    int 10H
    
    mov ah, 10
    lea dx, dato2
    int 21H
    
    ;impresora
    mov si, offset msjT2_i   
    mov cx, 30
    
imp_nivel_contaminacion:
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP imp_nivel_contaminacion   
    
;imprimimos dato del nivel de contaminacion
    mov si, offset dato2+2   
    mov cx, 3
    
imp_dato2:  
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP imp_dato2
    
    ;4. cantidad de agua no contaminada (Litros) 
    mov ah, 2
    mov dh, 14
    mov dl, 25
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, msjT3
    int 21H
    
    mov ah, 2
    mov dh, 14
    mov dl, 67
    mov bh, 0
    int 10H
    
    mov ah, 10
    lea dx, dato3
    int 21H 
    
    ;imprimir
    mov si, offset msjT3_i   
    mov cx, 38
    
imp_cantidad_agua:
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP imp_cantidad_agua

;imprimimos dato de la cantidad de agua no contaminada
    mov si, offset dato3+2   
    mov cx, 3
    
imp_dato3:  
    mov ah, 5
    mov dl, [si]
    int 21H    
    inc si
    LOOP imp_dato3
    
    
    ;5. Terminar el programa
    mov ah, 2
    mov dh, 16
    mov dl, 25
    mov bh, 0
    int 10H
    
    mov ah, 9
    lea dx, miTecla
    int 21H 
    
    mov ah, 1    ;Para pedir una tecla y no tener que esperar al "enter" para que continue
    int 21H       

fin:
    mov ax, 4c00H
    int 21H
end