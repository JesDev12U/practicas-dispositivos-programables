INCLUDE "header.inc"
  
MOVLW	0XFF
MOVWF	TRISA
MOVLW	0X00
MOVWF	TRISB

CONT	EQU 0X0A
RET_1M	EQU 0X0B
RET_1S	EQU 0X0C
CLRF	CONT
GOTO	SELEC1

TABLA_NUMS  ADDWF   PCL, 1
	    RETLW   0X3F ;0
	    RETLW   0X06 ;1
	    RETLW   0X5B ;2
	    RETLW   0X4F ;3
	    RETLW   0X66 ;4
	    RETLW   0X6D ;5
	    RETLW   0X7D ;6
	    RETLW   0X07 ;7
	    RETLW   0X7F ;8
	    RETLW   0X67 ;9
	    RETLW   0X77 ;A
	    RETLW   0X7C ;b
	    RETLW   0X39 ;C
	    RETLW   0X5E ;d
	    RETLW   0X79 ;E
	    RETLW   0X71 ;F
	    
R_1S	MOVLW	D'1000'
	MOVWF	RET_1S
R_1M	MOVLW	D'360'
	MOVWF	RET_1M
LAZO	NOP
	DECFSZ	RET_1M
	GOTO	LAZO
	DECFSZ	RET_1S
	GOTO	R_1M
	RETURN
	
SELEC1	BTFSC	PORTA, 1
	GOTO	SELEC2
	GOTO	SELEC3
SELEC2	BTFSC	PORTA, 0
	GOTO	RESET_0
	GOTO	CONT_OCT_DESC
SELEC3	BTFSC	PORTA, 0
	GOTO	CONT_HEX_PAR
	GOTO	CONT_DEC_ASC

CONT_DEC_ASC    CLRF    CONT
DESP_DEC	MOVF    CONT, 0
		CALL    TABLA_NUMS
		MOVWF   PORTB
		CALL    LAZO
		INCF    CONT, 1
		INCF    CONT, 1
		MOVF    CONT, 0
		SUBLW   0X14
		BTFSS	STATUS, Z
		GOTO	DESP_DEC
		GOTO	SELEC1
		
CONT_HEX_PAR	CLRF	CONT
DESP_HEX	MOVF	CONT, 0
		CALL	TABLA_NUMS
		MOVWF	PORTB
		CALL	LAZO
		INCF	CONT, 1
		INCF	CONT, 1
		INCF	CONT, 1
		INCF	CONT, 1
		MOVF	CONT, 0
		SUBLW	0X20
		BTFSS	STATUS, Z
		GOTO	DESP_HEX
		GOTO	SELEC1
		
CONT_OCT_DESC	MOVLW	0X0E
		MOVWF	CONT
DESPLIEGA_OCT	MOVF	CONT, 0
		CALL	TABLA_NUMS
		MOVWF	PORTB
		CALL	LAZO
		DECF	CONT, 1
		DECF	CONT, 1
		MOVF	CONT, 0
		SUBLW	0XFE
		BTFSS	STATUS, Z
		GOTO	DESPLIEGA_OCT
		GOTO	SELEC1

RESET_0	    MOVLW   0X3F
	    MOVWF   PORTB
	    GOTO    SELEC1
END