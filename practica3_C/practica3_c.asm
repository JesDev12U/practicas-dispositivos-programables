
_main:

;practica3_c.c,5 :: 		void main() {
;practica3_c.c,6 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;practica3_c.c,7 :: 		TRISD = 0xFF;
	MOVLW       255
	MOVWF       TRISD+0 
;practica3_c.c,8 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;practica3_c.c,9 :: 		while(1)
L_main0:
;practica3_c.c,10 :: 		PORTB = PORTD == LLAVE ? ACCESO : NA;
	MOVF        PORTD+0, 0 
	XORLW       90
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	MOVLW       100
	MOVWF       R1 
	GOTO        L_main3
L_main2:
	MOVLW       2
	MOVWF       R1 
L_main3:
	MOVF        R1, 0 
	MOVWF       PORTB+0 
	GOTO        L_main0
;practica3_c.c,11 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
