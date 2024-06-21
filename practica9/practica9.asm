
_customChar:

;practica9.c,42 :: 		void customChar(char pos_row, char pos_char, char* character, char location) {
;practica9.c,44 :: 		if(location < 8) { // CGRAM has 8 locations (0-7)
	MOVLW       8
	SUBWF       FARG_customChar_location+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_customChar0
;practica9.c,45 :: 		Lcd_Cmd(64 + (location * 8)); // Set CGRAM address
	MOVF        FARG_customChar_location+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	ADDLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,46 :: 		for (i = 0; i < 8; i++) Lcd_Chr_CP(character[i]); // Write 8 bytes for the character
	CLRF        customChar_i_L0+0 
L_customChar1:
	MOVLW       8
	SUBWF       customChar_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_customChar2
	MOVF        customChar_i_L0+0, 0 
	ADDWF       FARG_customChar_character+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       0
	ADDWFC      FARG_customChar_character+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	INCF        customChar_i_L0+0, 1 
	GOTO        L_customChar1
L_customChar2:
;practica9.c,47 :: 		Lcd_Cmd(_LCD_RETURN_HOME); // Return to the home position
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,48 :: 		Lcd_Chr(pos_row, pos_char, location); // Display the custom character
	MOVF        FARG_customChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_customChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        FARG_customChar_location+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,49 :: 		}
L_customChar0:
;practica9.c,50 :: 		}
L_end_customChar:
	RETURN      0
; end of _customChar

_printFrame1:

;practica9.c,52 :: 		void printFrame1(unsigned short pos) {
;practica9.c,53 :: 		customChar(1, pos, frame11, 0);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame11+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame11+0)
	MOVWF       FARG_customChar_character+1 
	CLRF        FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,54 :: 		customChar(1, pos + 1, frame12, 1);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame1_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame12+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame12+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       1
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,55 :: 		customChar(1, pos + 2, frame13, 2);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame13+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame13+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       2
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,56 :: 		customChar(1, pos + 3, frame14, 3);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame14+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame14+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       3
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,57 :: 		customChar(2, pos, frame15, 4);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame15+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame15+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       4
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,58 :: 		customChar(2, pos + 1, frame16, 5);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame1_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame16+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame16+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       5
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,59 :: 		customChar(2, pos + 2, frame17, 6);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame17+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame17+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       6
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,60 :: 		customChar(2, pos + 3, frame18, 7);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame1_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame18+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame18+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       7
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,61 :: 		}
L_end_printFrame1:
	RETURN      0
; end of _printFrame1

_printFrame2:

;practica9.c,63 :: 		void printFrame2(unsigned short pos) {
;practica9.c,64 :: 		customChar(1, pos, frame21, 0);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame21+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame21+0)
	MOVWF       FARG_customChar_character+1 
	CLRF        FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,65 :: 		customChar(1, pos + 1, frame22, 1);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame2_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame22+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame22+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       1
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,66 :: 		customChar(1, pos + 2, frame23, 2);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame23+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame23+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       2
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,67 :: 		customChar(1, pos + 3, frame24, 3);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame24+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame24+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       3
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,68 :: 		customChar(2, pos, frame25, 4);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame25+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame25+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       4
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,69 :: 		customChar(2, pos + 1, frame26, 5);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame2_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame26+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame26+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       5
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,70 :: 		customChar(2, pos + 2, frame27, 6);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame27+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame27+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       6
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,71 :: 		customChar(2, pos + 3, frame28, 7);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame2_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame28+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame28+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       7
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,72 :: 		}
L_end_printFrame2:
	RETURN      0
; end of _printFrame2

_printFrame3:

;practica9.c,74 :: 		void printFrame3(unsigned short pos) {
;practica9.c,75 :: 		customChar(1, pos, frame31, 0);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame31+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame31+0)
	MOVWF       FARG_customChar_character+1 
	CLRF        FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,76 :: 		customChar(1, pos + 1, frame32, 1);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame3_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame32+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame32+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       1
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,77 :: 		customChar(1, pos + 2, frame33, 2);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame33+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame33+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       2
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,78 :: 		customChar(1, pos + 3, frame34, 3);
	MOVLW       1
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame34+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame34+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       3
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,79 :: 		customChar(2, pos, frame35, 4);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame35+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame35+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       4
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,80 :: 		customChar(2, pos + 1, frame36, 5);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVF        FARG_printFrame3_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame36+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame36+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       5
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,81 :: 		customChar(2, pos + 2, frame37, 6);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       2
	ADDWF       FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame37+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame37+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       6
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,82 :: 		customChar(2, pos + 3, frame38, 7);
	MOVLW       2
	MOVWF       FARG_customChar_pos_row+0 
	MOVLW       3
	ADDWF       FARG_printFrame3_pos+0, 0 
	MOVWF       FARG_customChar_pos_char+0 
	MOVLW       _frame38+0
	MOVWF       FARG_customChar_character+0 
	MOVLW       hi_addr(_frame38+0)
	MOVWF       FARG_customChar_character+1 
	MOVLW       7
	MOVWF       FARG_customChar_location+0 
	CALL        _customChar+0, 0
;practica9.c,83 :: 		}
L_end_printFrame3:
	RETURN      0
; end of _printFrame3

_clearFrame:

;practica9.c,85 :: 		void clearFrame(unsigned short pos) {
;practica9.c,87 :: 		Lcd_Chr(1, pos, ' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,88 :: 		Lcd_Chr(1, pos + 1, ' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_clearFrame_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,89 :: 		Lcd_Chr(1, pos + 2, ' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	ADDWF       FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,90 :: 		Lcd_Chr(1, pos + 3, ' ');
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	ADDWF       FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,91 :: 		Lcd_Chr(2, pos, ' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,92 :: 		Lcd_Chr(2, pos + 1, ' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_clearFrame_pos+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,93 :: 		Lcd_Chr(2, pos + 2, ' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	ADDWF       FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,94 :: 		Lcd_Chr(2, pos + 3, ' ');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	ADDWF       FARG_clearFrame_pos+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       32
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;practica9.c,95 :: 		}
L_end_clearFrame:
	RETURN      0
; end of _clearFrame

_op1:

;practica9.c,99 :: 		void op1() {
;practica9.c,100 :: 		if (currentOption != 1) {
	MOVF        _currentOption+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_op14
;practica9.c,101 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,102 :: 		currentOption = 1;
	MOVLW       1
	MOVWF       _currentOption+0 
;practica9.c,103 :: 		}
L_op14:
;practica9.c,104 :: 		Lcd_out(1, 4, "IPN-UPIICSA");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_practica9+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_practica9+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;practica9.c,105 :: 		}
L_end_op1:
	RETURN      0
; end of _op1

_op2:

;practica9.c,110 :: 		void op2() {
;practica9.c,115 :: 		if (currentOption != 2) {
	MOVF        _currentOption+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_op25
;practica9.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,117 :: 		currentOption = 2;
	MOVLW       2
	MOVWF       _currentOption+0 
;practica9.c,119 :: 		direction = 1;
	MOVLW       1
	MOVWF       op2_direction_L0+0 
;practica9.c,120 :: 		cont = 0;
	CLRF        op2_cont_L0+0 
;practica9.c,121 :: 		}
L_op25:
;practica9.c,123 :: 		Lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,125 :: 		if (direction) {
	MOVF        op2_direction_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_op26
;practica9.c,126 :: 		cont++;
	INCF        op2_cont_L0+0, 1 
;practica9.c,127 :: 		if (cont == 5) {
	MOVF        op2_cont_L0+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_op27
;practica9.c,128 :: 		direction = 0;
	CLRF        op2_direction_L0+0 
;practica9.c,129 :: 		}
L_op27:
;practica9.c,130 :: 		} else {
	GOTO        L_op28
L_op26:
;practica9.c,131 :: 		cont--;
	DECF        op2_cont_L0+0, 1 
;practica9.c,132 :: 		if (cont == 0) {
	MOVF        op2_cont_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_op29
;practica9.c,133 :: 		direction = 1;
	MOVLW       1
	MOVWF       op2_direction_L0+0 
;practica9.c,134 :: 		}
L_op29:
;practica9.c,135 :: 		}
L_op28:
;practica9.c,137 :: 		Lcd_out(1, cont, "Hola maquina");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        op2_cont_L0+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_practica9+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_practica9+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;practica9.c,138 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_op210:
	DECFSZ      R13, 1, 1
	BRA         L_op210
	DECFSZ      R12, 1, 1
	BRA         L_op210
	DECFSZ      R11, 1, 1
	BRA         L_op210
	NOP
	NOP
;practica9.c,139 :: 		}
L_end_op2:
	RETURN      0
; end of _op2

_op3:

;practica9.c,143 :: 		void op3() {
;practica9.c,144 :: 		if (currentOption != 3) {
	MOVF        _currentOption+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_op311
;practica9.c,145 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,146 :: 		currentOption = 3;
	MOVLW       3
	MOVWF       _currentOption+0 
;practica9.c,147 :: 		pos = 1;
	MOVLW       1
	MOVWF       _pos+0 
;practica9.c,148 :: 		prev_pos = 1;
	MOVLW       1
	MOVWF       _prev_pos+0 
;practica9.c,149 :: 		}
L_op311:
;practica9.c,150 :: 		clearFrame(prev_pos); // Clear the previous frame
	MOVF        _prev_pos+0, 0 
	MOVWF       FARG_clearFrame_pos+0 
	CALL        _clearFrame+0, 0
;practica9.c,151 :: 		printFrame1(pos);
	MOVF        _pos+0, 0 
	MOVWF       FARG_printFrame1_pos+0 
	CALL        _printFrame1+0, 0
;practica9.c,152 :: 		printFrame2(pos);
	MOVF        _pos+0, 0 
	MOVWF       FARG_printFrame2_pos+0 
	CALL        _printFrame2+0, 0
;practica9.c,153 :: 		printFrame3(pos);
	MOVF        _pos+0, 0 
	MOVWF       FARG_printFrame3_pos+0 
	CALL        _printFrame3+0, 0
;practica9.c,154 :: 		prev_pos = pos;
	MOVF        _pos+0, 0 
	MOVWF       _prev_pos+0 
;practica9.c,155 :: 		Delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_op312:
	DECFSZ      R13, 1, 1
	BRA         L_op312
	DECFSZ      R12, 1, 1
	BRA         L_op312
	NOP
	NOP
;practica9.c,156 :: 		pos++;
	INCF        _pos+0, 1 
;practica9.c,157 :: 		if (pos > 17) { // Adjusted limit to avoid writing beyond the screen
	MOVF        _pos+0, 0 
	SUBLW       17
	BTFSC       STATUS+0, 0 
	GOTO        L_op313
;practica9.c,158 :: 		pos = 1; // Teleport to the left
	MOVLW       1
	MOVWF       _pos+0 
;practica9.c,159 :: 		}
L_op313:
;practica9.c,160 :: 		}
L_end_op3:
	RETURN      0
; end of _op3

_main:

;practica9.c,162 :: 		void main() {
;practica9.c,163 :: 		TRISA = 0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;practica9.c,164 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;practica9.c,165 :: 		ADCON1 = 0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;practica9.c,166 :: 		CMCON = 0X07;
	MOVLW       7
	MOVWF       CMCON+0 
;practica9.c,167 :: 		OSCCON = 0x72;
	MOVLW       114
	MOVWF       OSCCON+0 
;practica9.c,168 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;practica9.c,169 :: 		Lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;practica9.c,171 :: 		while(1) {
L_main14:
;practica9.c,187 :: 		if (PORTA.RA0 == 0 && PORTA.RA1 == 0) op1();
	BTFSC       PORTA+0, 0 
	GOTO        L_main18
	BTFSC       PORTA+0, 1 
	GOTO        L_main18
L__main29:
	CALL        _op1+0, 0
	GOTO        L_main19
L_main18:
;practica9.c,188 :: 		else if (PORTA.RA0 == 0 && PORTA.RA1 == 1) op2();
	BTFSC       PORTA+0, 0 
	GOTO        L_main22
	BTFSS       PORTA+0, 1 
	GOTO        L_main22
L__main28:
	CALL        _op2+0, 0
	GOTO        L_main23
L_main22:
;practica9.c,189 :: 		else if (PORTA.RA0 == 1 && PORTA.RA1 == 0) op3();
	BTFSS       PORTA+0, 0 
	GOTO        L_main26
	BTFSC       PORTA+0, 1 
	GOTO        L_main26
L__main27:
	CALL        _op3+0, 0
L_main26:
L_main23:
L_main19:
;practica9.c,190 :: 		}
	GOTO        L_main14
;practica9.c,191 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
