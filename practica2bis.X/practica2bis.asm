;*************************************************************************
;   Autores: Jesus Antonio Lopez Bandala y Kitzya Minerva Luna Guadarrama
;   Practica 2 Bis
;   Secuencia: 4NV42
;   Checar la entrada A5, si es 1, se encienden los numeros impares del puerto B
;   Si es 0, se encienden los numeros pares de dicho puerto
;   Realizar la practica con una tira de LEDS
;*************************************************************************
    
include "header.inc"
    movlw   0x20 
    movwf   TRISA
    movlw   0x00
    movwf   TRISB
inicio    btfss   PORTA, 5
	  bra	  pares
	  bra	  impares
	  
pares	movlw	0x55
	movwf	PORTB
	bra	inicio

impares	movlw	0xAA
	movwf	PORTB
	bra	inicio 
end

    