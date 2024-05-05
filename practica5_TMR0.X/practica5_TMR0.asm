include "header.inc"
	
CONT	equ	0x0A
RET_1M	equ	0x0B
RET_1S	equ	0x0C

INICIO
	movf	CONT, 0
	movwf	PORTB
	call	ESPERA
	incf	CONT, 1
	goto	INICIO
end