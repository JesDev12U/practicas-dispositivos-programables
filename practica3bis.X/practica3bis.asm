include "header.inc"
    movlw 0xFF
    movwf TRISA
    movlw 0x00
    movwf TRISB

LLAVE	  equ	0x0a
	  movlw 0x5a
	  movwf LLAVE
	 
inicio    movf    PORTA, W
	  subwf   LLAVE, W
	  btfss   STATUS, Z
	  bra	  NA
	  bra	  acceso

NA	movlw	0x02
	movwf	PORTB
	bra	inicio
acceso	movlw	0x64
	movwf	PORTB
	bra	inicio
end
    