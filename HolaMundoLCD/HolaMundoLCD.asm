
_main:

;HolaMundoLCD.c,17 :: 		void main() {
;HolaMundoLCD.c,18 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;HolaMundoLCD.c,19 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;HolaMundoLCD.c,20 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;HolaMundoLCD.c,21 :: 		ADCON1 = 0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;HolaMundoLCD.c,22 :: 		CMCON = 0X07;
	MOVLW       7
	MOVWF       CMCON+0 
;HolaMundoLCD.c,23 :: 		OSCCON = 0X72;
	MOVLW       114
	MOVWF       OSCCON+0 
;HolaMundoLCD.c,24 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;HolaMundoLCD.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HolaMundoLCD.c,26 :: 		Lcd_out(1, 4, "IPN-UPIICSA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_HolaMundoLCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_HolaMundoLCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;HolaMundoLCD.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
