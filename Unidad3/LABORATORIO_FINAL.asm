;*********************
;Guardar como: LaboFinal.asm
;Integrantes: Inzunza y Enciso
;Instrucciones:
;
;   1. Hacer uso de MACROS y PROCEDIMIENTOS
;   2. Diseñar en pantalla las siguientes opciones
;	a. Crear directorio
;   b. Crear archivo de texto
;	c. Solicitar un mensaje de máximo 80 caracteres
;   d. Escribir el mensaje en el archivo creado
; 	e. Solicitar el nombre de un archivo al usuario
;	f. Crear un archivo con el nombre   
;
;*********************
include libreria.lib
.model small
.stack
.data
    mD db 'a. Crear directorio                            $'
    mA db 'b. Crear archivo de texto                      $'
    mM db 'c. Solicitar un mensaje de máximo 80 caracteres$'
    mE db 'd. Escribir el mensaje en el archivo creado    $'
    mS db 'e. Solicitar el nombre de un archivo al usuario$'
    mN db 'f. Crear un archivo con el nombre              $' 
    mO db 'Opcion: $' 
    mP db 'Escribe mensaje:$' 
    mAr db 'Nombre para archivo:$'
    R  db 2,0,2 dup('$')
    rC db 80,0,80 dup(0)
    ruta db 'C:\LABORATORIOFINAL',0
    ruta2 db 'C:\LABORATORIOFINAL\archivo.txt',0
    ruta3 db 'C:\LABORATORIOFINAL\',0     
    msjSi db 'Se ha creado la carpeta$'
    msjNo db 'No se ha podido crear la carpeta$'
    msjSi2 db 'Se ha creado el archivo$'
    msjNo2 db 'No se ha podido crear el archivo$'
    msjSi3 db 'Se ha escrito en el archivo$'
    msjNo3 db 'No se ha escrito en el archivo$'
    manejador dw 0
    
    msjSalir       db 'Presione esc para salir, cualquier otra para repetir el programa:  '
    nombreArchivo  db 38,0,38 dup('$')
    rutaBase       db 'C:\LABORATORIOFINAL\$'
    espacioBlanco  db 20 dup(' ')
    espacioBlanco2 db 67 dup(' ')
    ruta4          db 300 dup(0)
.code
inicio:
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    cursor 7,31,0
    impCadColor mD,47,7,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mA,47,8,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mM,47,9,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mE,47,10,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mS,47,11,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mN,47,12,17,0,0,6Fh
    cursor 7,31,0
    impCadColor mO,8,14,17,0,0,6Fh 
    cursor 14,24,0
    LEER_CADENA2 R 
    mov R,al
    cmp R,'a'
    je opcionA
    cmp R,'b'
    je opcionB
    cmp R,'c'
    je opcionC
    cmp R,'d'
    je opcionD
    cmp R,'e'
    je opcionE
    cmp R,'f'
    je opcionF
    jmp fin
     
opcionA:
        crearDirectorio ruta 
        jc error
        cursor 20,30,0
        impSinColor msjSi 
        impCadColor msjSalir, 67, 20, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
        
opcionB: 
        crearDirectorio ruta
        crearArchivo ruta2,32
        mov manejador,ax;
        jc error2 
        cursor 20,30,0
        impSinColor msjSi2
        impCadColor msjSalir, 67, 21, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
               
opcionC: 
        impCadColor mP,16,17,17,0,0,6Fh
        cursor 18,17,0
        LEER_CADENA rC  
        impCadColor msjSalir, 67, 21, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
opcionD:
        crearDirectorio ruta
        crearArchivo ruta2,32
        cursor 18,17,0
        abrirArchivo ruta2,2 
        mov manejador,ax
        jc error3
        escribirArchivo manejador,80,rC+2
        cursor 20,30,0
        impSinColor msjSi3 
        impCadColor msjSalir, 67, 21, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
opcionE:
        impCadColor mAr,20,17,17,0,0,6Fh
        cursor 18,17,0
        LEER_CADENA nombreArchivo 
        impCadColor msjSalir, 67, 21, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
         
opcionF:
        crearDirectorio ruta
        jc error 
        xor si, si
        xor di, di
        bucle1:
            cmp rutaBase[si], '$'
            je finBucle1
            
            mov bl, rutaBase[si]
            mov ruta4[si], bl
            inc si
            jmp bucle1 
        
        finBucle1:
            xor di, di
            
        bucle2:
            cmp nombreArchivo[di], '$'
            je finBucle2
            
            mov bl, nombreArchivo[di]+2
            mov ruta4[si],bl
            inc si    
            inc di
            jmp bucle2
            
        finBucle2:
            dec si
            dec si
            dec si 
            mov ruta4[si],0 
            crearArchivo ruta4, 32
            jc error2
            cursor 20,30,0 
            impSinColor msjSi2   
        impCadColor msjSalir, 67, 21, 2, 0, 0, 6Fh
        call tecla
        call limpiarCuadro
               
error:
        cursor 20,30,0
        impSinColor msjNo 
        jmp fin
error2:
        cursor 20,30,0
        impSinColor msjNo2 
error3:
        cursor 20,30,0
        impSinColor msjNo3   
      
fin:
    mov ax,4c00H
    int 21h
;*********PROCEDIMIENTOS*********
tecla proc
    cursor 21,67,0
    mov ah, 1
    int 21H
    
    cmp al, 1BH
    je fin
    xor ax, ax
    call limpiarCuadro        
ret  ;return

tecla endp

limpiarCuadro proc                                             
    impCadColor espacioBlanco, 20, 18, 17, 0, 0, 07h
    impCadColor espacioBlanco, 20, 17, 17, 0, 0, 07h
    impCadColor espacioBlanco, 20, 14, 17, 0, 0, 07h
    impCadColor espacioBlanco2, 67, 21, 2, 0, 0, 07h
    jmp inicio    
    ret
limpiarCuadro endp
;*********PROCEDIMIENTOS*********
end