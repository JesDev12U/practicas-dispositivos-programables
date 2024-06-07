INCLUDE "header.inc"
GOTO INICIO
       
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
   
INICIO MOVLW 0X00
       MOVWF uni
       MOVF  uni, 0
       CALL  TABLA
       MOVWF disp_uni
       
ini_1  BTFSS	pulsador
       BRA	ini_1
       CALL	ret_20ms
       BTFSS	pulsador
       BRA	ini_1
       CALL	incre
ini_2  BTFSC	pulsador
       BRA	ini_2
       BRA	ini_1
       
;SUBRUTINA INCREMENTO
incre	MOVF	uni, 0
        SUBLW	0x12
	BTFSS	STATUS, Z
	BRA	inc_uni
	BRA	cero
       
inc_uni INCF uni,1
	INCF uni,1
	BRA fin_ver

cero	MOVLW	0x00
	MOVWF	uni

fin_ver	MOVF uni,0
	CALL TABLA
	MOVWF disp_uni
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