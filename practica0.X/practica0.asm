p=18f4550
#include<p18f4550.inc>

    ORG 0 ;Direccionamos el programa a la memoria flash 0
    
    ;SUMA
    movlw   0x42 ;Creamos la literal 0x42, esta en el registro de trabajo
    movwf   0x0A ;Movemos lo que hay en W (0x42) a 0x0A
    movlw   0x2E ;Creamos la literal 0x2E, esta en W
    movwf   0x0B ;Movemos lo que hay en W (0X2E) a 0x0B
    addwf   0x0A, 0 ;Sumamos 0x0A(0x42) + W(0x2E), se guarda el resultado en W
    movwf   0x10 ;Guardamos el resultado de la suma anterior en 0x10
    
    ;RESTA Dato1 - Dato2
    movf    0x0B, 0 ;Movemos 0x0B(0X2E) a W
    subwf   0x0A, 0 ;Restamos lo que hay en 0X0A(0x42) y lo guardamos en W
    movwf   0x11 ;Movemos el resultado de la resta en 0x11
    
    ;RESTA Dato2 - Dato1
    movf    0x0A, 0 ;Movemos 0x0A(0x42) a W
    subwf   0x0B, 0 ;Restamos lo que hay en 0x0B(0x2E) - 0x0A(0x42) y lo guardamos en W
    movwf   0x12 ;El resultado lo guardamos en 0x12
    
    ;multiplicacion
    rlncf   0x0A, 0 ;Rotamos a la izquierda sin carry de 0x0A(0x42) y lo guardamos en W
    movwf   0x14 ;Movemos el resultado a 0x14
    
    ;division /2
    rrncf   0x0B, 0 ;Rotamos a la derecha sin carry de 0x0B(0x2E) y lo guardamos en W
    movwf   0x15 ;El resultado lo guardamos en 0x15
    
    ;Dato1 && Dato2
    movf    0x0B, 0
    andwf   0x0A, 0
    movwf   0x20
    
    ;Dato1 || Dato2
    movf    0x0B, 0
    iorwf   0x0A, 0
    movwf   0x21
    
    ;Dato1 XOR	Dato2
    movf    0x0B, 0
    xorwf   0x0A, 0
    movwf   0x22
    
    ;Suma del dato1
    ;b7b6b5b4 + b3b2b1b0
    swapf   0x0A, 0
    addwf   0x0A, 0
    andlw   0x0F
    movwf   0x24
    
    end ;This is the end