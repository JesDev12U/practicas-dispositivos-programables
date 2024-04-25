include "header.inc"
    movlw   0xFF
    movwf   TRISA
    movlw   0x00
    movwf   TRISB
preg_0    btfsc   PORTA, 0
	  bra	  NA
	  bra	  preg_1

preg_1	btfss	PORTA, 1
	bra	NA
	bra	preg_2
preg_2	btfsc	PORTA, 2
	bra	NA
	bra	preg_3
preg_3	btfss	PORTA, 3
	bra	NA
	bra	preg_4
preg_4	btfss	PORTA, 4
	bra	NA
	bra	preg_5
preg_5	btfsc	PORTA, 5
	bra	NA
	bra	preg_6
preg_6	btfss	PORTA, 6
	bra	NA
	bra	acceso

NA	movlw	0x02
	movwf	PORTB
	bra	preg_0
acceso	movlw	0x64
	movwf	PORTB
	bra	preg_0
end
	