include "header.inc"
    CONT    equ 0x0A
    RET_1M  equ 0x0B
    RET_1S  equ 0x0C
    movlw   0x00
    movwf   TRISB
    clrf    CONT
    bra	    INICIO

TABLA	  addwf	  PCL, 1
	  retlw	  0x71 ;F
	  retlw	  0x79 ;E
	  retlw	  0x5E ;d
	  retlw	  0x39 ;C
	  retlw	  0x7C ;b
	  retlw	  0x77 ;A
	  retlw	  0x67 ;9
	  retlw	  0x7F ;8
	  retlw	  0x07 ;7
	  retlw	  0x7D ;6
	  retlw	  0x6D ;5
	  retlw   0x66 ;4
	  retlw	  0x4F ;3
	  retlw   0x5B ;2
	  retlw   0x06 ;1
	  retlw   0x3F ;0
	  
;Retardo de 1 milisegundo
R_1S    movlw   d'1000'
	movwf   RET_1S

R_1M    movlw   d'498' ;1CM
        movwf   RET_1M ;1CM
lazo    nop
	decfsz  RET_1M
	bra	lazo
	decfsz  RET_1S
	bra	R_1M
	return
	
INICIO
	movf	CONT, 0
	call	TABLA
	movwf	PORTB
	call	lazo
	incf	CONT, 1
	incf	CONT, 1
	btfsc	CONT, 5
	clrf	CONT
	goto	INICIO
end