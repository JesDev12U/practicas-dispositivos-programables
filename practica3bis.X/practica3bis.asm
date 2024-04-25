include "header.inc"
    movlw 0xFF
    movwf TRISA
    movlw 0x00
    movwf TRISB
    
inicio    movlw   0x5a
	  ;movwf  llave
	  movwf   0x0A
	  movf    PORTA, W
	  ;SUBWF  llave, W
	  subwf   0x0A, W
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
    