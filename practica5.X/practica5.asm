include "header.inc"
    ;CONT    equ	0x0A
    ;RET_1M  equ 0x0B
    ;RET_1S  equ	0x0C
    ;movlw   0x00
    ;movwf   TRISB
    ;clrf    CONT ;1CM

;Retardo de 1 milisegundo
    ;R_1S    movlw   d'1000'
	    ;movwf   RET_1S

    ;R_1M    movlw   d'498' ;1CM
            ;movwf   RET_1M ;1CM
    ;lazo    nop
	    ;decfsz  RET_1M
	    ;bra	    lazo
	    ;decfsz  RET_1S
	    ;bra	    RET_1M
	    ;return
	    
;inicio  movf    CONT, 0 ;1CM
	;movwf   PORTB ;1CM
	;call	lazo
	;incf    CONT, 1 ;1CM
	;goto	inicio ;2CM

;end
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