
_main:

;practica2bis_c.c,1 :: 		void main() {
;practica2bis_c.c,2 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;practica2bis_c.c,3 :: 		TRISA = 0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;practica2bis_c.c,4 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;practica2bis_c.c,6 :: 		while(1) {
L_main0:
;practica2bis_c.c,7 :: 		PORTB = PORTA.RA5 ? 0xAA : 0x55;
	BTFSS       PORTA+0, 5 
	GOTO        L_main2
	MOVLW       170
	MOVWF       R0 
	GOTO        L_main3
L_main2:
	MOVLW       85
	MOVWF       R0 
L_main3:
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;practica2bis_c.c,8 :: 		}
	GOTO        L_main0
;practica2bis_c.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
