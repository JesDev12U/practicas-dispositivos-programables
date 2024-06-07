INCLUDE "header.inc"
BRA INICIO
TABLA  ADDWF   PCL, 1
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
	
INICIO  MOVLW 0x00
	MOVWF uni
	MOVWF dec
	MOVF uni,W
	CALL TABLA
	MOVWF disp_uni
	MOVF dec,W
	CALL TABLA
	MOVWF disp_dec
	;PULSADO DEL BOTON PARA INCREMENTAR
ini_1	BTFSS pulsador
	BRA ini_1
	CALL ret_20ms
	BTFSS pulsador
	BRA ini_1
	CALL incre
ini_2	BTFSC pulsador
	BRA ini_2
	BRA ini_1
;SUBRUTINA INCREMENTO
incre	MOVF uni,W
	SUBLW 0x12
	BTFSS STATUS,Z
	BRA inc_uni
	MOVF dec,W
	SUBLW 0x12
	BTFSS STATUS,Z
	BRA inc_dec
	BRA ceros
	
inc_uni INCF uni,F
	INCF uni,F
	BRA fin_ver
	
inc_dec MOVLW 0x00
	MOVWF uni
	INCF dec,F
	INCF dec,F
	BRA fin_ver
	;VISUALIZADO
ceros   MOVLW 0x00
	MOVWF uni
	MOVWF dec
	
fin_ver	MOVF uni,W
	CALL TABLA
	MOVWF disp_uni
	MOVF dec,W
	CALL TABLA
	MOVWF disp_dec
	BRA salida
	
salida	RETURN
	
;SUBRUTINA RETARDO DE TIEMPO
ret_20ms MOVLW d'20'
	 MOVWF L
opera1	 MOVLW d'498'
	 MOVWF K
opera2	 NOP
	 DECFSZ K,f
	 BRA opera2
	 DECFSZ L,f
	 GOTO opera1
	 RETURN

END