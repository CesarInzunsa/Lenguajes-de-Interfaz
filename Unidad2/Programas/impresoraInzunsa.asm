; the printer demonstration.

; this is simplified/ms-dos complatible version.

; this example may not work on Windows XP, however it may work for Windows 95/98:
; http://support.microsoft.com/default.aspx?scid=kb;en-us;Q258878

; the printer device is created by Andrew Nelis.

; the original example that uses i/o ports that are unique to the emulator is located here:
; c:\emu8086\DEVICES\DEVELOPER\sources\Printer_emulation_demo.asm

;----> Inzunsa Diaz Cesar Alejandro
name "printer"

org 100h    ;-->Ancla el programa en la direccion 100H
            ;Para programas pequeños

jmp start
msg db "Hola, impresora!", 0Ah, 0Dh
    db "***************"
    db 13, 9    ; Retorno de carro y salto de parrafo
    db "<<PROYECTO DE: AquaMonitoreo>>"
    
msg_end db 0
msg2 db "Presiona una letra para nueva hoja$"

start:
    mov ah, 5       ;Interrupcion impresora
    mov dl, 12      ; nueva pagina
    int 21h


    mov si, offset msg                   ;Desplazamiento
                                         ;offset = lea = load efective address
    mov cx, offset msg_end - offset msg  
    ;Obtiene la longitud del mensaje
print:
    mov dl, [si]    ;Obtener caracter
    mov ah, 5       ; MS-DOS print function.
    int 21h
    inc si	        ; next char.
    loop print
   
    mov dx, offset msg2
    mov ah, 9
    int 21h
   
    mov ax, 0       ; wait for any key...
    int 16h

    mov dl, 12      ; form feed code. page out!
    mov ah, 5
    int 21h
    
ret

