
_main:

;examen_c.c,4 :: 		void main() {
;examen_c.c,5 :: 		ADCON1 = 0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;examen_c.c,6 :: 		CMCON = 0X07;
	MOVLW       7
	MOVWF       CMCON+0 
;examen_c.c,7 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;examen_c.c,9 :: 		while(1) {
L_main0:
;examen_c.c,10 :: 		PORTB = display_7seg[cont++];
	MOVLW       _display_7seg+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_display_7seg+0)
	MOVWF       FSR0L+1 
	MOVF        _cont+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
	INCF        _cont+0, 1 
;examen_c.c,11 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;examen_c.c,12 :: 		if (cont == 16) cont = 0;
	MOVF        _cont+0, 0 
	XORLW       16
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	CLRF        _cont+0 
L_main3:
;examen_c.c,13 :: 		}
	GOTO        L_main0
;examen_c.c,14 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
