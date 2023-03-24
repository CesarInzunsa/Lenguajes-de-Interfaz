;*********************************************************************
; NL: 23          Nombre: Cesar Alejandro Inzunsa Diaz        HORA:8AM   
;
; Guardar como: logotipo.asm 
;       
; Unidad 3 - Tema:               
;
;    
; Fecha: 20 octubre 2022
;
;
;********************************************************************* 
.model small
.stack
.data
    ;para el ancho le damos 40
    logo db       'MMMMMMMMMMWWMM0x0WOllOWXx0WMWWMMMMMMMMMM'
         db 10,13,'MMMMMMMMMMOcdKo.:kl''lOl.lKklOWMMMMMMMMM'
         db 10,13,'MMMMMMNxo0k;;dkkOOxk0xdxdxk:,x0dxXMMMMMM'
         db 10,13,'MMMWXKXd!cdxOxOKK0xxkddkk0Oxkkc!oXXXWMMM'
         db 10,13,'MMMNd,:dxkOOkdolcc::c:cclooxOkOkxc,oXMMM'
         db 10,13,'MN0OklcxOkxxl:c::clc:cc::c:ldkO00ocxO0NM'
         db 10,13,'MNd;;dOOOkooddolloO00OdllodddoxOkkd;,dXM'
         db 10,13,'NOkookOOxodddddddONWWN0dddddddodkkOdlk0N'
         db 10,13,'Ko;:dOOkoodooddkOKXXXX0OkxdooodoxkOk;,oK'
         db 10,13,'XOdoxkkxloolloxKXXKKKKXXKkoollooxOkkooON'
         db 10,13,'0l:cxkkxoooooodoolcllllloddooooldOOkc,c0'
         db 10,13,'WKxcd000dooooolc::::c::::cloooookOkdcdKW'
         db 10,13,'Wk:co0WW0occccccccllllcccccccclONN0o;:kN'
         db 10,13,'MWNOcc0WWKdc:c::::::ccccccc:coONNKc:kXWM'
         db 10,13,'MMXocddONMN0oc;;;;;;;;;,;;:okXNXOdocoXMM'
         db 10,13,'MMMWWO;,d0X0kkdoolcccclloxkkKX0d,;OWWMMM'
         db 10,13,'MMMMW0x0O:;oxkx0WKOOkkOkO0kxo;:OOx0WNKKN'
         db 10,13,'MMMMMMMM0co0o,ckxldkxoldkl,oOol0MMMWOoo0'
         db 10,13,'MMMMMMMMMWWWkcONo.oKKl.oXOlkWWWWMMMMXKKN'
         db 10,13,'MMMMMMMMMMMMWWMM0xKMMXk0WMWWMMMMMMMMMMMM'
         ;asi con toda la imagen y colocar el 10,13
         ;contar la cantidad de renglones y columnas
    
    ;********************************MACROS********************************
    impCadColor MACRO mensaje, longitud, ren, col, pag, modo, color
        mov ah, 19
        lea bp, mensaje
        mov cx, longitud
        mov dh, ren
        mov dl, col
        mov bh, pag
        mov al, modo
        mov bl, color
        int 10H 
            
    ENDM
    
    cursor MACRO ren, col, pag
        mov ah, 2          
        mov dh, ren
        mov dl, col
        mov bh, pag
        int 10H
    ENDM
    
    impCadSinColor MACRO mensaje
        mov ah, 9               
        lea dx, mensaje
        int 21H
    ENDM  
    
    tecla MACRO 
        mov ah, 0   ;Codigo de rastreo
        int 16H     ;Espera una tecla sin eco.
    ENDM
    
.code
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    ;impCadColor mensaje, longitud, ren, col, pag, modo, color
    impCadColor logo, 838, 0, 0, 0, 0, 0FH
    
fin:    
    mov ax, 4c00H
    int 21H
end  