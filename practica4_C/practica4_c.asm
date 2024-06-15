
_main:

;practica4_c.c,1 :: 		void main() {
;practica4_c.c,2 :: 		unsigned short display_7seg[8] = {0x76, 0x5c, 0x06, 0x5f, 0x40, 0x30, 0x73, 0x54}; //Hola-IPn
	MOVLW       118
	MOVWF       main_display_7seg_L0+0 
	MOVLW       92
	MOVWF       main_display_7seg_L0+1 
	MOVLW       6
	MOVWF       main_display_7seg_L0+2 
	MOVLW       95
	MOVWF       main_display_7seg_L0+3 
	MOVLW       64
	MOVWF       main_display_7seg_L0+4 
	MOVLW       48
	MOVWF       main_display_7seg_L0+5 
	MOVLW       115
	MOVWF       main_display_7seg_L0+6 
	MOVLW       84
	MOVWF       main_display_7seg_L0+7 
;practica4_c.c,3 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;practica4_c.c,4 :: 		ADCON1 = 0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;practica4_c.c,5 :: 		CMCON = 0X07;
	MOVLW       7
	MOVWF       CMCON+0 
;practica4_c.c,6 :: 		TRISA = 0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;practica4_c.c,7 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;practica4_c.c,8 :: 		while(1) {
L_main0:
;practica4_c.c,9 :: 		PORTB = display_7seg[PORTA];
	MOVLW       main_display_7seg_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_display_7seg_L0+0)
	MOVWF       FSR0L+1 
	MOVF        PORTA+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;practica4_c.c,10 :: 		}
	GOTO        L_main0
;practica4_c.c,11 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
