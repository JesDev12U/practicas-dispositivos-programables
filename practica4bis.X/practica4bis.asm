include "header.inc"
    movlw   0xFF
    movwf   TRISA
    movlw   0x00
    movwf   TRISD

bra INICIO
    
TABLA	  addwf	  PCL, 1
	  retlw	  0x70
	  retlw	  0x9E
	  retlw	  0xB6
	  retlw	  0x7C
	  retlw	  0xB6
	  retlw	  0xAE
	  retlw	  0x0C
	  retlw	  0x1E
    
INICIO    movf    PORTA, 0
	  andlw   0x0E
	  call    TABLA
	  movwf   PORTD
	  bra	  INICIO
end