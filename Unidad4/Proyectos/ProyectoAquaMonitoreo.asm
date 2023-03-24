;**************************************************************
;Creacion del Login   
; NL: 9  NOMBRE: CHRISTIAN ISABEL LOPEZ CANTABRANA  
; NL: 23 NOMBRE: CESAR ALEJANDRO INZUNSA DIAZ
; NL: 5  NOMBRE: CRISTIAN GERARDO ENCISO LUNA
;************************************************************** 
#START=THERMOMETER.EXE#
include libreria.lib
.model small
.stack 
.data
        message db 'Ingrese la contrase',164,'a: ', 10,13,'$'
        bienvenida db 'Bienvenido usuario:)$'
        passwd db 'CCG'
        count dw 3
        correct db 'Contrase',164,'a correcta: Bienvenido Usuario $'
        notcorrect db 'Contrase',164,'a invalida, repita $'     
        ren db 0                   
        RENCOL      DB 90    
        RASTREO     db  0

        logo db 10,13,'MMMMMMMMMMMMMMMMMWXO0XWMMMMMMMMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMMMMMMMWKxooxKWMMMMMMMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMMMMMMN0dooood0NMMMMMMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMMMMWKkooooooookXWMMMMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMMWXOdoooooooooodOXWMMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMN0xoooooooooooooox0NMMMMMMMMMM'
             db 10,13,'MMMMMMMMWXkooooooooooooooooookXWMMMMMMMM'
             db 10,13,'MMMMMMMW0xooooooooooooooooooooxKWMMMMMMM'
             db 10,13,'MMMMMMN0dooooooooooooooooooooood0WMMMMMM'
             db 10,13,'MMMMMW0dooooooooooooooooodxxkkkkOXWMMMMM'
             db 10,13,'MMMMMXkooooooooooooddxkOkkkxxxxxxk0XWMMM'
             db 10,13,'MMMMMN0kkkkkxxdodkOOOkdocccloddxxxxkO0XW'
             db 10,13,'WMMMMN0OkkxxxxkOOkdc::::cloooooookNWNXXN'
             db 10,13,'NK0KNN0OOOOOkkxoc:;;;;;::;;;:;;;:kNMMMMM'
             db 10,13,'MN0kxxdddoll::;;;;;;;;;;;;;;;;;:xXMMMMMM'
             db 10,13,'MMMMWXKOxl:;;;;;;;;;;;;;;;;;;:lkNMMMMMMM'
             db 10,13,'MMMMMMMMWKkoc:;;;;;;;;;;;;:cokXWMMMMMMMM'
             db 10,13,'MMMMMMMMMMWNKOxdollllllodxOKNWMMMMMMMMMM'
             db 10,13,'MMMMMMMMMMMMMMMWWNNXXNNWWMMMMMMMMMMMMMMM'
             db 10,13,'OXMMWOONMMX0NMMMMMMMMMMWNWMMMMMMMMMMMMMM'
        
        Nombre  db 'Aqua Monitoreo$'
        miTecla db 'Enter para continuar...$'
    
        temperatura db 4, 0, 4 dup('$')
        dato2       db 4, 0, 4 dup('$')
        dato3       db 4, 0, 4 dup('$')  
        dato4       db 2, 0, 2 dup('$') 
        
        espacioBlanco  db 4 dup(' ')
        espacioBlanco2 db 70 dup(' ')                                      
                                           
 
        Titulo db 'Bienvenido a AquaMonitoreo'   
        TituloX db 'Bienvenido'
        TituloInfo db 'Introduce tu reporte sobre el agua' 
        msjOp db 'Introduce una opcion:[ ]'
        msjFlecha db 'Utiliza las flechas para desplazarte'
        msjEnter db 'Da enter en la opcion de tu preferencia' 
        msjp1 db '1- Registrar informaci',224,'n         '
        msjp2 db '2- Leer informaci',224,'n              '
        msjp3 db '3- Registrar datos en tiempo real'   
        msjp4 db '4- Salir                         '
        R1 db  52, 0, 52 dup(0)   
        
        msjRegresar db '   1- Regresar al menu                 '
        msjGuardar  db '   2- Guardar informaci',224,'n en archivo   '
        msjImprimir db '   3- Imprimir informaci',224,'n             '         
        msjSalir    db '   4- Salir                            '
        msjSiArchivo   db 'Se ha CREADO el archivo en C:\emu8086\vdrive\C\AquaMonitoreo' 
        
        msjRepetirRegistro db '   2- Registrar mas informaci',224,'n        '
        
        msjPedirNombreArchivo db 'Nombre del archivo y su extensi',224,'n:'
        nombreArchivo  db 38,0,38 dup('$')
        rutaBase       db 'C:\AquaMonitoreo\$'
        ruta4          db 300 dup(0)                    
        
        rutaDirectorio db 'C:\AquaMonitoreo',0
        rutaArchivo    db 'C:\AquaMonitoreo\datosRegistrados.txt',0
        manejador30    dw 0
        
           
        proyecto    db '<<PROYECTO: AquaMonitoreo>>'    ;27 
       
        
        msjT1       db 'Indica la temperatura:$'
        msjT_i      db 10,10,10,'La temperatura registrada es:'  
        
        msjT2       db 'Indica el nivel de contaminacion:$'
        msjT2_i     db 10,'El nivel de contaminacion es:'   
        
        msjT3       db 'Indica la cantidad de agua no contaminada:$'  
        msjT3_i     db 10,'La cantidad de agua no contaminada es:'   
        
        renglon     db 00
        columna     db 00 
        letraAscii  db 177, 177  
        COL         DB 0 
        
        ;PANTALLA LEER ARCHIVO
        msjErrorAbrirArchivo db 'ERROR, el archivo no existe!, regresando al menu principal'
        leidos               db 200 dup ('$')
        msjLeerArchivo2      db '   2- Leer informaci',224,'n              '
        msjSalir20           db '   3- Salir                            '
        
        msjMenuLecturaArchivo db 'Menu lectura de archivo'
        ren6 db 0
        col6 db 0
        datoImp db 0, '$'
        datosImp db 200 dup('$')
        nuevaLinea db 10
        
        ;PANTALLA REGISTRAR INFORMACION MANUALMENTE
        adecuadoSeven DB 01110111b, 01011110b, 01111001b, 00111001b, 00111110b, 01110111b, 01011110b, 00111111b
        delicadoSeven DB 01011110b, 01111001b, 00111000b, 00110000b, 00111001b, 01110111b, 01011110b, 00111111b
        drasticoSeven DB 01011110b, 01010000b, 01110111b, 01101101b, 01111000b, 00110000b, 00111001b, 00111111b
        
        
        ;PANTALLA REGISTRAR INFORMACION DE FORMA AUTOMATICA CON EL TERMOMETRO
        tempera      db 0
        sonido       db 7,7,'$' 
        mensaje1     db         '                                        '
                     db 10,13,  '                 Adecuado               '
                     db 10,13,  '                                        '
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMWNNWMMMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMWk;,;dXMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMWo.. .lNMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMXc.   ;KMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMWx.    :XMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMWk      cKXXXXXNNWMMMMMM'
                     db 10,13,  'MMMMWWNNNNNNWMWKl.      .'''  ''',:dXMMM'
                     db 10,13,  'MMMWk:,,,,,,lko.                  .xWMMM'
                     db 10,13,  'MMMWo.      ''                    ,0MMMM'
                     db 10,13,  'MMMWo.      ''                     OMMMM'
                     db 10,13,  'MMMWo.      ''                   .dNMMMM'
                     db 10,13,  'MMMWo.      l                     KMMMMM'
                     db 10,13,  'MMMWo.      ''                 , OWMMMMM'
                     db 10,13,  'MMMWo.      '                  'kWMMMMMM'
                     db 10,13,  'MMMMKkddddddONXOxdddddddddddddx0WMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13,  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM$'

        mensaje2     db        '                                        '
                     db 10,13, '                 Delicado               '
                     db 10,13, '                                        '
                     db 10,13, 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMMMMMMX0OO0XWMMMMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMMMMWKo;'';oKWMMMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMMMW0l,:ddc,l0WMMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMMWOc,ck00Oc,cONMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMNk:,lOOkkOOl,:kNMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMNx:,oko'  'lko,;xXMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMXx;,d0k;    ,k0d;;dXMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMWKd,;x00O:    ;O00x;,oKWMMMMMMMM'
                     db 10,13, 'MMMMMMMWKo,:x0000c    cO000k:,l0WMMMMMMM'
                     db 10,13, 'MMMMMMW0l,ck00000o.  .l00000kc,cOWMMMMMM'
                     db 10,13, 'MMMMMNOc,cO000000d.  .d000000Ol,cONMMMMM'
                     db 10,13, 'MMMMNk:,lO0000000Oo::lk0000000Oo,:kNMMMM'
                     db 10,13, 'MMMXx;,oO00000000koccok00000000Od,;xXMMM'
                     db 10,13, 'MMXd;;d000000000O:    :O000000000x;;dKWMM'
                     db 10,13, 'MKo,;x0000000000Od,'',oO0000000000x:,oKW'
                     db 10,13, 'WO: ;ccccccccccccc::::ccccccccccccc; ;kN'
                     db 10,13, 'MN0kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxkOXM'
                     db 10,13, 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'
                     db 10,13, 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM$'
       
       
        mensaje3     db        '                                        '                                             
                     db 10,13, '               Drastico                 '
                     db 10,13, '                                        '
                     db 10,13, 'MMMMMMMMMWKkxxxxxxxxxxxxxxxxkKWMMMMMMMMM'
                     db 10,13, 'MMMMMMMW0ddOKNWMMMMMMMMMMWNKOdd0WMMMMMMM'
                     db 10,13, 'MMMMMMNxlOWMMMMMMMMMMMMMMMMMMWOoxNMMMMMM'
                     db 10,13, 'MMMMMWklONWMMMMMMMMMMMMMMMMMMMNOlkWMMMMM'
                     db 10,13, 'MMMMMNodkdXMMMMMMMMMMMMMMMMMMNxxooNMMMMM'
                     db 10,13, 'MMMMMWdoxl0MMMMMMMMMMMMMMMMMMKlddoNMMMMM'
                     db 10,13, 'MMMMMMOlxlxWNK000NMMMMN000KNWklxlkWMMMMM'
                     db 10,13, 'MMMMMMWkc;od;.. .lNMMWo. ..;do;ckNMMMMMM'
                     db 10,13, 'MNOkKWMWx;xo.   .xWMMWk;    lk:dWMWKkOXM'
                     db 10,13, 'WxcdoxXMOl0Nd;,c0KkddkK0l,;dXKlkMNxoxldW'
                     db 10,13, 'xo0WXxdxo;l0XNWWNl.;,.cNWWNX0l;lxxxXW0od'
                     db 10,13, 'lokkxkOOko:;;lkNNl;od:lXNkl;;:ok0Okxkkoc'
                     db 10,13, 'NKKKKOxxxkOo,:cdKKKXXKKKx::;lOkxxxOKXKKN'
                     db 10,13, 'MMMMMMMWXOxc;lolooddddooloo;cxOXWMMMMMMM'
                     db 10,13, 'MMMMWMWNKkxl:xkollllllllokx:lxk0XWMWWMMM'
                     db 10,13, 'MNOdxkkxxkOk::OXXK00000KXOc:x0OkxxkkdkNM'
                     db 10,13, 'MNxlkXNKkxxxkkdxxkkOOkkxxxkOxxxkKNXkldNM'
                     db 10,13, 'MMWkckOoxKWMMMWNKOOOOOOKNWMMMWXxokkcxWMM'
                     db 10,13, 'MMMXl,:kWMMMMMMMMMMMMMMMMMMMMMMWOc;lXMMM'
                     db 10,13, 'MMMXl,:kWMMMMMMMMMMMMMMMMMMMMMMWOc;lXMMM$'
        
    msjTempOp1 db '  1- Regresar al menu       '
    msjTempOp2 db '  2- Registrar informacion  '
    msjTempOp3 db '  3- Salir                  '    
;VARIABLES PARA LA FECHA Y HORA**************************
    FH DB 10,0,0,'/', 0,0,'/', 32H,30H,32H,32H,' - ',0,0,':',0,0,':',0,0  
;Variables de DotMatrix    
drastico db 01111111b, 01000001b, 01000001b, 01000001b, 00111110b  ; 2000h - 2004h   D
         db 01111111b, 00001001b, 00011001b, 00101001b, 01001110b  ; 2005h - 2009h   R
         db 01111110b, 00001001b, 00001001b, 00001001b, 01111110b  ; 200Ah - 200Eh   A
         db 01001111b, 01001001b, 01001001b, 01001001b, 01111001b  ; 200Fh - 2013h   S
         db 00000001b, 00000001b, 01111111b, 00000001b, 00000001b  ; 2014h - 2018h   T
         db 01000001b, 01000001b, 01111111b, 01000001b, 01000001b  ; 2019h - 201Dh   I
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 01000001b  ; 201Eh - 2022h   C
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 01111111b  ; 2023h - 2027h   O  
    	 
delicado db 01111111b, 01000001b, 01000001b, 01000001b, 00111110b  ; 2000h - 2004h   D
         db 01111111b, 01001001b, 01001001b, 01001001b, 01001001b  ; 2005h - 2009h   E
         db 01111111b, 01000000b, 01000000b, 01000000b, 01000000b  ; 200Ah - 200Eh   L
         db 01000001b, 01000001b, 01111111b, 01000001b, 01000001b  ; 200Fh - 2013h   I
         db 01111111b, 01000001b, 01000001b, 01000001b, 01000001b  ; 2014h - 2018h   C
         db 01111110b, 00001001b, 00001001b, 00001001b, 01111110b  ; 2019h - 201Dh   A
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 00111110b  ; 201Eh - 2022h   D
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 01111111b  ; 2023h - 2027h   O   
    	 
adecuado db 01111110b, 00001001b, 00001001b, 00001001b, 01111110b  ; 2000h - 2004h   A
         db 01111111b, 01000001b, 01000001b, 01000001b, 00111110b  ; 2005h - 2009h   D
         db 01111111b, 01001001b, 01001001b, 01001001b, 01001001b  ; 200Ah - 200Eh   E
         db 01111111b, 01000001b, 01000001b, 01000001b, 01000001b  ; 200Fh - 2013h   C
         db 01111111b, 01000000b, 01000000b, 01000000b, 01111111b  ; 2014h - 2018h   U
         db 01111110b, 00001001b, 00001001b, 00001001b, 01111110b  ; 2019h - 201Dh   A
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 00111110b  ; 201Eh - 2022h   D
    	 db 01111111b, 01000001b, 01000001b, 01000001b, 01111111b  ; 2023h - 2027h   O

.code        
begin: 
        mov ax,@data
        mov ds,ax
        mov es,ax
         
        ;CREA EL DIRECTORIO DEL PROYECTO 
        crearDirectorio rutaDirectorio
        
        ;CREA EL ARCHIVO DEL PROYECTO DONDE SE REGISTRAN LOS DATOS
        crearArchivo rutaArchivo, 32 ;Crear archivo en modo de usuario 

        ;Lineas  
        cursor 1,0,0
        CAR_COLOR 80, 205,0,1FH
        cursor 23,0,0
        CAR_COLOR 80, 205,0,1FH        
        
        ;mensaje,longitud,ren,col,pag,modo,color
        impCadColor logo,800,2,0,0,0,1FH  
        impCadColor nombre,14,6,53,0,0,0FH
        impCadColor miTecla,14,10,50,0,0,0FH
     
        impCadSinColor miTecla
        
    
        mov ah, 1    ;Para pedir una tecla y no tener que esperar al "enter" para que continue
        int 21H

;************LIMPIAR PANTALLA************
CALL limpiarPantalla
;************LIMPIAR PANTALLA************ 


JMP LOGIN
LOGIN:       

MOV AX, @DATA
MOV DS, AX
;Linea 1 Login    
   cursor 2,0,0
   CAR_COLOR 80, 205,0,1FH            
;Linea 2  
   cursor 15,0,0
   CAR_COLOR 80, 205,0,1FH  

      MOV AX, @DATA
      MOV DS, AX       
       
      MOV CX, count    
      cursor 4,29,0  

      MOV AH, 9     
      MOV BL, 01H
      MOV DX, OFFSET bienvenida
      INT 21H  
      
      cursor 7,28,0 
      MOV AH, 9
      MOV BX, OFFSET passwd  
      MOV DX, OFFSET message
      INT 21H     
                
     
again:  
   
      cursor 8,28,0
      MOV AH, 8
      INT 21H 
      
      CMP AL, [BX]
      JNE error
      
      INC BX  
      LOOP again            
      
      cursor 9,21,0
      MOV AH, 9
      MOV DX, OFFSET correct
      INT 21H   
          
JMP Menu 
      
error:                      
      cursor 9,25,0
      MOV DX, OFFSET NOTCORRECT
      MOV AH, 09H           
      INT 21H 
      JMP again 

      ;VENTANA MENU
Menu:       
     call imprimeMenu  
     
     ;MOVERSE ENTRE OPCIONES
MOVER2: 
    MOV RENCOL,10
    MOV REN,5
    MOV COL,4      
    
MOVER2_I:  
    CURSOR REN,COL,0 
    MOV AH, 0
    INT 16H  
    ;FLECHAS
    CMP AH,48H
    JE ARRIBA2
    CMP AH,50H
    JE ABAJO2 
    CMP AH,4DH
    JE DERECHA
    CMP AH,4BH
    JE IZQUIERDA 
;ENTER
    CMP AL,13
    JE ENTER2
    ;JMP MOVER2_I
     
ENTER2:                      
CMP RENCOL,10
JE RegistrarDatos
CMP RENCOL,105
JE LeerDatosG
CMP RENCOL,63
JE autoReg
CMP RENCOL,67
JE fin
JMP MOVER2

     ;COMPARACION OPCIONES DEL MENU     
     ;CMP R1+2, '1'               
     ;JE RegistrarDatos
     ;CMP R1+2, '2'               
     ;JE LeerDatosG
     ;CMP R1+2, '3'
     ;JE autoReg
     
     ;jmp fin        
                                 
ARRIBA2: 
    SUB REN,4
    CMP REN,8
    JBE MOVER2
    CMP REN,17
    JAE MOVER2  
    ;AJUSTE PARA DETERMINAR OPERACIÓN 
    MOV AL,REN
    MOV BL,COL
    SUB AL,BL
    MOV RENCOL,AL 
    ADD RENCOL,100
    ;--------------------------------
    JMP MOVER2_I
ABAJO2:
    ADD REN,4
    CMP REN,8
    JBE MOVER2
    CMP REN,21
    JAE MOVER2 
    ;AJUSTE PARA DETERMINAR OPERACIÓN 
    MOV AL,REN
    MOV BL,COL
    SUB AL,BL
    MOV RENCOL,AL  
    ADD RENCOL,100
    ;--------------------------------
    JMP MOVER2_I
DERECHA:
    ADD COL,38
    CMP COL,8
    JBE MOVER2
    CMP COL,48
    JAE MOVER2
    ;AJUSTE PARA DETERMINAR OPERACIÓN 
    MOV AL,REN
    MOV BL,COL
    SUB AL,BL
    MOV RENCOL,AL
    ADD RENCOL,100
    ;--------------------------------
    JMP MOVER2_I
IZQUIERDA:    
    SUB COL,38
    CMP COL,8
    JBE MOVER2
    CMP COL,47
    JAE MOVER2  
    ;AJUSTE PARA DETERMINAR OPERACIÓN 
    MOV AL,REN
    MOV BL,COL
    SUB AL,BL
    MOV RENCOL,AL
    ADD RENCOL,100
    ;--------------------------------
    JMP MOVER2_I                                 
;******************************************************  

autoReg:
    call limpiarPantalla           
    call menuTermometro
    
menTemp:
    call termometro
    
    cmp temperatura,75
    JAE mensajeL3
    
    cmp temperatura,50
    JAE mensajeL2 
    
    JMP mensajeL1
 
mensajeL1:                               
    call DotMatrixAde
    impCadColor mensaje1,964,1,0,0,0,20h
    call menuTermometro
     
mensajeL2:          
    call DotMatrixDel
    impCadColor mensaje2,964,1,0,0,0,60h 
    call menuTermometro
     
mensajeL3:           
    call DotMatrixDra
    impCadColor mensaje3,964,1,0,0,0,4Fh 
    call menuTermometro
    
;******************************************************  


RegistrarDatos:
    CALL limpiarPantalla
    CALL pantallaRegistrarDatos   

LeerDatosG:
    CALL limpiarPantalla
    CALL leerDatosRegistrados
      
fin:
    MOV AH, 4CH
    INT 21H
                                                                                          
;/////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
;***************************PROCEDIMIENTOS************************************************
limpiarPantalla proc                                             
     MOV REN,0
     MOV CX,25 ;PARA EL LOOP LIMPIAR 
     LIMPIAR:
        PUSH CX
            CURSOR REN,0,0
            CAR_COLOR 80,0,0,0Fh
            INC REN
        POP CX
        LOOP LIMPIAR    
    ret
limpiarPantalla endp

imprimeMenu proc
    CALL limpiarPantalla
    impCadColor Titulo,26, 2, 24, 0, 0, 01FH
    impCadColor msjp1,33, 5, 4, 0, 0, 01FH
    impCadColor msjp2,33, 9, 4, 0, 0, 01FH
    impCadColor msjp3,33, 5, 42, 0, 0, 01FH 
    impCadColor msjp4,33, 9, 42, 0, 0, 01FH     
    
    impCadColor msjFlecha,36,16, 19, 0, 0, 01FH  
    impCadColor msjEnter,39,19, 18, 0, 0, 01FH
    ret
imprimeMenu endp

;Este procedimiento dibuja lineas del caracter 177 de fondo azul con letras blancas
lineasCaracter177 PROC
    
    cursor 0,0,0
    CAR_COLOR 80, 205,0,1FH    
    cursor 1,0,0
    CAR_COLOR 80, 205,0,1FH 
    cursor 2,0,0
    CAR_COLOR 80, 205,0,1FH
    
    cursor 22,0,0
    CAR_COLOR 80, 205,0,1FH 
    cursor 23,0,0
    CAR_COLOR 80, 205,0,1FH  
    cursor 24,0,0
    CAR_COLOR 80, 205,0,1FH

    ret
lineasCaracter177 ENDP

pantallaRegistrarDatos proc
    
    impCadColor TituloX,10, 4, 35, 0, 0, 01FH  
    impCadColor TituloInfo,34, 6, 24, 0, 0, 01FH  
     
    ;mov ax, @data
    ;mov ds, ax
    ;mov es, ax  
    
    
    
;/////////////////////////////////////////////////////////////
;2. Imprimir linea de caracter 177 - Fondo azul y letras blancas
CALL lineasCaracter177        
;///////////////////////////////////////////////////////////// 
     
    ;2. Leer la temperatura   
    
impCadColor msjT1,22, 9, 29, 0, 0, 01FH   
cursor 9,52,0  
cap_cadena temperatura   
    
    ;3. Nivel de contaminacion     (Litros)
    ;pedir nivel de contaminacion       
impCadColor msjT2,33, 10, 25, 0, 0, 01FH  
cursor 10,59,0                             
cap_cadena dato2  
    
    ;4. cantidad de agua no contaminada (Litros)  
impCadColor msjT3,42, 11, 20, 0, 0, 01FH  
cursor 11,63,0    
cap_cadena dato3
    
    ;Salir o Terminar el programa  
    impCadColor msjRegresar, 39, 14, 20, 0, 0, 01FH 
    impCadColor msjGuardar,  39, 15, 20, 0, 0, 01FH
    impCadColor msjImprimir, 39, 16, 20, 0, 0, 01FH                                 
    impCadColor msjSalir,    39, 17, 20, 0, 0, 01FH
    impCadColor msjOp,       24, 19, 27, 0, 0, 01FH 
    
    call seven
    
continuaSeven:
    CURSOR 19,49,0
    cap_cadena dato4  
    CMP dato4+2, '1'
    JE Menu
    CMP dato4+2, '2'
    JE call pantallaGuardarArchivo
    CMP dato4+2, '3'
    JE call imprimirInfo
    CMP dato4+2, '4'
    JE fin
    
    JMP fin
    
    ret
pantallaRegistrarDatos endp

imprimirInfo PROC
;///////////////////////////////////////////////////////////// 

    ;1. Enviar mensaje de titulo
    mov ah, 5   ;NUEVA HOJA
    mov dl, 12
    int 21H   

    mov si, offset proyecto
    mov cx, 27
        
    IMPRIME:
        mov ah, 5
        mov dl, [si]
        int 21H    
        inc si
    LOOP IMPRIME    

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
    
    ;imprimir
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
    
    ;imprimir
    mov si, offset msjT3_i   
    mov cx, 39
    
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
    
    FECHA FH[1],FH[2],FH[4],FH[5] ;FECHA DE HOY  
    HORA FH[14],FH[15],FH[17],FH[18],FH[20],FH[21];HORA ACTUAL   
    CadenaImpresora 22,FH,CicloMsjFecha1                          
                              
    ;Salir o Terminar el programa  
    impCadColor msjRegresar, 39, 14, 20, 0, 0, 01FH 
    impCadColor msjGuardar,  39, 15, 20, 0, 0, 01FH
    impCadColor msjImprimir, 39, 16, 20, 0, 0, 01FH                                 
    impCadColor msjSalir,    39, 17, 20, 0, 0, 01FH
    impCadColor msjOp,       24, 19, 27, 0, 0, 01FH 
    
    CURSOR 19,49,0
    cap_cadena dato4  
    CMP dato4+2, '1'
    JE Menu
    CMP dato4+2, '2'
    JE call pantallaGuardarArchivo
    CMP dato4+2, '3'
    JE call imprimirInfo
    CMP dato4+2, '4'
    JE fin
    
    JMP fin
    
    ret
imprimirInfo ENDP
    
    
pantallaGuardarArchivo PROC
    
    abrirArchivo rutaArchivo, 2
    mov manejador30, ax ;Recuperar ID
    
    ;2. Escribir en el archivo
    ;escribirArchivo id, totalEscribir, datosEscribir proyecto
    
    escribirArchivo manejador30, 27, proyecto
    
    escribirArchivo manejador30, 32, msjT_i
    escribirArchivo manejador30, 3, temperatura+2
    
    escribirArchivo manejador30, 30, msjT2_i
    escribirArchivo manejador30, 3, dato2+2
    
    escribirArchivo manejador30, 39, msjT3_i
    escribirArchivo manejador30, 3, dato3+2 
    
    ;Salto de linea, es una herramienta misteriosa que nos ayudara mas tarde
    ;para la parte de leer archivo, ocupa un salto de linea mas para que
    ;se detenga el bucle
    escribirArchivo manejador30, 3, nuevaLinea
    
    ;Salir o Terminar el programa  
    impCadColor msjRegresar,            39, 14, 20, 0, 0, 01FH 
    impCadColor msjRepetirRegistro,     39, 15, 20, 0, 0, 01FH                                 
    impCadColor msjSalir,               39, 17,20, 0, 0, 01FH
    impCadColor msjImprimir,            39, 16, 20, 0, 0, 01FH 
    impCadColor msjOp,                  24, 19, 27, 0, 0, 01FH
    impCadColor msjSiArchivo,           60, 20, 10, 0, 0, 01FH
    
    CURSOR 19,49,0
    cap_cadena dato4
    
    CMP dato4+2, '1'
    JE Menu
    CMP dato4+2, '2'
    JE call limpiarCuadro
    CMP dato4+2, '3'
    JE call imprimirInfo
    CMP dato4+2, '4'
    JE fin
    JMP fin
     
    ret
pantallaGuardarArchivo ENDP

limpiarCuadro proc                                             
    impCadColor espacioBlanco, 4, 9, 52, 0, 0, 07h
    impCadColor espacioBlanco, 4, 10, 59, 0, 0, 07h
    impCadColor espacioBlanco, 4, 11, 63, 0, 0, 07h
    impCadColor espacioBlanco2, 70, 14, 10, 0, 0, 07h 
    impCadColor espacioBlanco2, 70, 15, 10, 0, 0, 07h
    impCadColor espacioBlanco2, 70, 16, 10, 0, 0, 07h
    impCadColor espacioBlanco2, 70, 17, 10, 0, 0, 07h
    impCadColor espacioBlanco2, 70, 18, 10, 0, 0, 07h
    impCadColor espacioBlanco2, 70, 19, 10, 0, 0, 07h 
    impCadColor espacioBlanco2, 70, 20, 10, 0, 0, 07h
    call pantallaRegistrarDatos
    ret
limpiarCuadro endp

ciclosConcatenar PROC
    ;Ciclos para concatenar el nombre del archivo
    ;con la ruta de la carpeta del proyecto
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
    ret
ciclosConcatenar ENDP

leerDatosRegistrados PROC
    
    impCadColor msjMenuLecturaArchivo,  23, 4, 30, 0, 0, 01FH
    
    impCadColor msjRegresar,            39, 6, 20, 0, 0, 01FH 
    impCadColor msjLeerArchivo2,        39, 7, 20, 0, 0, 01FH                                
    impCadColor msjSalir20,             39, 8, 20, 0, 0, 01FH
    impCadColor msjOp,                  24, 10, 27, 0, 0, 01FH
    
while1:
    CURSOR 10,49,0
    cap_cadena dato4
        
    CMP dato4+2, '1'
    JE Menu
    CMP dato4+2, '2'
    JE imprimeArchivo
    CMP dato4+2, '3'
    JE fin
    
    JMP while1

imprimeArchivo:    
    ;Abrir el archivo
    abrirArchivo rutaArchivo, 2 ;modo lectura
    JC errorLecturaArchivo    
                             
    ;Recuperar ID                         
    mov manejador30, ax      
    
    ;Leer el archivo
    leerArchivo manejador30, 137, leidos
    JC error
    
    ;Imprimir la informacion leida
    
    mov ren6, 13
    mov si, 0
    mov di, 0
    
    dato:
        cmp leidos[si], '$'
        je punto3
        
        mov bl, leidos[si]
        mov datosImp[di], bl
        
        cmp leidos[si], 0AH
        je SaltoF
        
        inc si
        inc di
    jmp dato        
    
    SaltoF:         
        ;inc di
        impCadColor datosImp, di, ren6, 5, 0, 0, 01FH
        inc ren6 
        inc si
        mov di, 0
        jmp dato
     
    punto3:
        impCadColor datosImp, di, 18, 5, 0, 0, 01FH
        jmp while1
    
    ;mov ren6, 13
;    mov col6, 5
;    mov si, 0
;    
;    for6:
;        cmp leidos[si], '$'
;        je while1
;    
;        cmp leidos[si], 0AH
;        je SaltoF
;        
;        mov bl, leidos[si]
;        mov datoImp, bl
;        
;        impCadColor datoImp, 1, ren6, col6, 0, 0, 01FH
;        inc si
;        inc col6
;    jmp for6
;        
;    jmp while1
;    
;    SaltoF:
;        inc ren6 
;        inc si
;        mov col6, 5
;        jmp for6


errorLecturaArchivo:
    impCadColor msjErrorAbrirArchivo, 58, 20, 5, 0, 0, 01FH
    impCadColor espacioBlanco2, 1, 10, 49, 0, 0, 01FH
    jmp while1
    
    ret
leerDatosRegistrados ENDP

seven proc
        
    MOV DX, 2030h ;first Seven Segment Display
	MOV SI, 0
	MOV CX, 8
	
	cmp dato2[2], '7'   ;70
    jae drasticoLoop
    
    cmp dato2[2], '5'    ;50
    jae delicadoLoop
    
    cmp dato2[2], '1'  ;10
    jae adecuadoLoop
    
drasticoLoop:
	MOV AL,drasticoSeven[SI]
	out dx,al
	INC SI
	INC DX
LOOP drasticoLoop
    jmp continuaSeven    
        
delicadoLoop:
	MOV AL,delicadoSeven[SI]
	out dx,al
	INC SI
	INC DX
LOOP delicadoLoop
    jmp continuaSeven

adecuadoLoop:
	MOV AL,adecuadoSeven[SI]
	out dx,al
	INC SI
	INC DX
LOOP adecuadoLoop
    jmp continuaSeven
    
    RET
seven endp   

DotMatrixAde proc
    MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	MOV DX,2000h ; Input columna 1 del display 1
	MOV BX,0     ; Contador de columnas totales
	             ; y renglones en matríz (cada 5)
principal:
	MOV SI,0     ; Contador de columnas en matríz
	MOV CX,5     ; Cada display tiene 5 columnas
siguiente:
	MOV AL, adecuado[BX][SI] ; Matríz de puntos
	OUT DX,AL           ; Output en columna
	INC SI              ; Siguiente columna en matríz
	INC DX              ; Siguiente columna en display 

	CMP SI,5            ; Si columna actual != 5
	LOOPNE siguiente    ;   Repite siguiente
                        ; SOLO cuando columna actual = 5
	ADD BX,5            ;   Añade 5 a columnas totales
	CMP BX,40           ;   Si columnas totales < 40
	JL principal	    ;       Reinicia principal 
    ret
endp   

DotMatrixDel proc
    MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	MOV DX,2000h ; Input columna 1 del display 1
	MOV BX,0     ; Contador de columnas totales
	             ; y renglones en matríz (cada 5)
principal2:
	MOV SI,0     ; Contador de columnas en matríz
	MOV CX,5     ; Cada display tiene 5 columnas
siguiente2:
	MOV AL, delicado[BX][SI] ; Matríz de puntos
	OUT DX,AL           ; Output en columna
	INC SI              ; Siguiente columna en matríz
	INC DX              ; Siguiente columna en display 

	CMP SI,5            ; Si columna actual != 5
	LOOPNE siguiente2    ;   Repite siguiente
                        ; SOLO cuando columna actual = 5
	ADD BX,5            ;   Añade 5 a columnas totales
	CMP BX,40           ;   Si columnas totales < 40
	JL principal2	    ;       Reinicia principal 
    ret
endp

DotMatrixDra proc
    MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	MOV DX,2000h ; Input columna 1 del display 1
	MOV BX,0     ; Contador de columnas totales
	             ; y renglones en matríz (cada 5)
principal3:
	MOV SI,0     ; Contador de columnas en matríz
	MOV CX,5     ; Cada display tiene 5 columnas
siguiente3:
	MOV AL, Drastico[BX][SI] ; Matríz de puntos
	OUT DX,AL           ; Output en columna
	INC SI              ; Siguiente columna en matríz
	INC DX              ; Siguiente columna en display 

	CMP SI,5            ; Si columna actual != 5
	LOOPNE siguiente3    ;   Repite siguiente
                        ; SOLO cuando columna actual = 5
	ADD BX,5            ;   Añade 5 a columnas totales
	CMP BX,40           ;   Si columnas totales < 40
	JL principal3	    ;       Reinicia principal 
    ret
endp


termometro proc
    mov dx,127 ;Asignar a AL, el numero del puerto de control
    ;mov al,1
    ;out dx,al ;1 Para en encerderlo y 0 para apagarlo
        
    in al,125 
    mov ah,9
    lea dx,sonido
    mov temperatura,al
    int 21h
    
    ret 
termometro endp

menuTermometro PROC
    
    impCadColor msjTempOp1, 28, 2, 46, 0, 0, 01FH
    impCadColor msjTempOp2, 28, 3, 46, 0, 0, 01FH
    impCadColor msjTempOp3, 28, 4, 46, 0, 0, 01FH
    impCadColor msjOp,      24, 6, 48, 0, 0, 01FH
    
    continuaDatoMenuTermo:
        CURSOR 6,70,0
        cap_cadena dato4
        
        CMP dato4+2, '1'               
        JE Menu
        CMP dato4+2, '2'               
        JE menTemp
        CMP dato4+2, '3'
        JE fin
         
        jmp fin
    
    ret
menuTermometro ENDP

;***************************PROCEDIMIENTOS***************************
     END