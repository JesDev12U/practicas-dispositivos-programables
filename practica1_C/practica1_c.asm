
_main:

;practica1_c.c,1 :: 		void main() {
;practica1_c.c,2 :: 		ADCON1 = 0x0F;  // Desactiva las entradas analógicas, configura todos los pines como digitales
	MOVLW       15
	MOVWF       ADCON1+0 
;practica1_c.c,3 :: 		TRISB = 0xFF;   // Configura todos los pines del puerto A como entradas
	MOVLW       255
	MOVWF       TRISB+0 
;practica1_c.c,4 :: 		TRISD = 0x00;   // Configura todos los pines del puerto B como salidas
	CLRF        TRISD+0 
;practica1_c.c,6 :: 		while(1) {
L_main0:
;practica1_c.c,7 :: 		PORTD = PORTB;  // Copia el estado del puerto A al puerto B
	MOVF        PORTB+0, 0 
	MOVWF       PORTD+0 
;practica1_c.c,8 :: 		}
	GOTO        L_main0
;practica1_c.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
