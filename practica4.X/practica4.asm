include "header.inc"
    
    movlw   0xFF
    movwf   TRISA
    movlw   0x00
    movwf   TRISD
INICIO    movf    PORTA, 0
	  andlw   0x0E
	  call    TABLA
	  movwf   PORTD
	  bra	  INICIO
TABLA	  addwf	  PCL, 1
	  retlw	  0x76
	  retlw	  0x5C
	  retlw	  0x06
	  retlw	  0x5F
	  retlw	  0x40
	  retlw	  0x30
	  retlw	  0x73
	  retlw	  0x54
end