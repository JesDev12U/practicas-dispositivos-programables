include "header.inc"


INICIO    
    MOVLW	0X00		
    MOVWF	TBLPTRH			;Valor del puntero Alto
    MOVLW	0X20
    MOVWF	0X20			; Asignar el valor 0x20 a la direcci?n de memoria 0x20

LOOP			
    MOVFF	0X20,TBLPTRL	; Mover lo que tiene 0x20 al puntero Bajo
    TBLRD	*				; Leer
    MOVFF	TABLAT,PORTB	; Mover el registro tablat al puerto B
    CALL	COMPROBAR		; Comprueba si el registro 0x20 no excede un incremento de m?s de 10 unidades
    INCF	0X20			; Aumenta en 1 el registro 0x20
    CALL	ESPERA			; Delay de 1 s
    GOTO	LOOP			; Reinicia el bucle

COMPROBAR

    MOVLW	0X30			
    SUBWF	0X20,0			; Resta 10 unidades + 0x20 del puntero bajo
    MOVWF	0X21			; Guarda el resultado de la resta en 0x21
    MOVLW	0X1F			; Despu?s del posterior incremento este valor se convierte en 0x20
    INFSNZ	0X21			; Decrementa 1 y salta si no es 0
    MOVWF	0X20			; Si es 0 devuelve el valor original al registro 0x20
    RETURN
end