LIST P=18F4550 			;directive to define processor
#include <P18F4550.INC> 	;processor specific variable definitions
 
;CONFIG1L dir 300000h 		20
CONFIG	PLLDIV=1	 	; 
CONFIG	CPUDIV=OSC1_PLL2 ;CUANDO SE USA 	
CONFIG	USBDIV=2

;CONFIG1H dir 300001h	   08
CONFIG	FOSC=INTOSC_HS	;INTOSCIO_EC			;		;OSCILADOR INTERNO, RA6 COMO PIN, USB USA OSC EC
CONFIG	FCMEN=OFF       ;DESHABILITDO EL MONITOREO DEL RELOJ
CONFIG	IESO=OFF
;CONFIG2L DIR 300002H	   	38
CONFIG	PWRT=ON         ;PWRT HABILITADO
CONFIG  BOR=OFF		 	;BROWN OUT RESET DESHABILITADO
CONFIG  BORV=3			;RESET AL MINIMO VOLTAJE NO UTILZADO EN ESTE CASO
CONFIG	VREGEN=ON	 	;REULADOR DE USB ENCENDIDO
;CONFIG2H DIR 300003H	   	1E
CONFIG	WDT=OFF         ;WACH DOG DESHABILITADO
CONFIG WDTPS=32768      ;TIMER DEL WATCHDOG 
;CONFIG3H DIR 300005H 	   	81
CONFIG	CCP2MX=ON	 	;CCP2 MULTIPLEXADAS CON RC1	
CONFIG	PBADEN=OFF      ;PUERTO B PINES DEL 0 AL 4 ENTRADAS DIGITALES
CONFIG  LPT1OSC=OFF	 	;TIMER1 CONFIURADO PARA OPERAR EN BAJA POTENCIA
CONFIG	MCLRE=ON        ;MASTER CLEAR HABILITADO
;CONFIG4L DIR 300006H	   	81
CONFIG	STVREN=ON	 	;SI EL STACK SE LLENA CAUSE RESET		
CONFIG	LVP=OFF		 	;PROGRAMACI�N EN BAJO VOLTAJE APAGADO
CONFIG	ICPRT=OFF	 	;REGISTRO ICPORT DESHABILITADO
CONFIG	XINST=OFF  		;SET DE EXTENCION DE INSTRUCCIONES Y DIRECCIONAMIENTO INDEXADO DESHABILITADO
;CONFIG5L DIR 300008H 		0F
CONFIG	CP0=OFF		 	;LOS BLOQUES DEL C�DIGO DE PROGRAMA
CONFIG	CP1=OFF         ;NO ESTAN PROTEGIDOS
CONFIG	CP2=OFF		 
CONFIG	CP3=OFF
;CONFIG5H DR 300009H  		80
CONFIG	CPB=ON		 	;SECTOR BOOT ESTA PROTEGIDO
CONFIG	CPD=OFF		 	;EEPROM N PROTEGIDA
;CONFIG6L DIR 30000AH 		0F
CONFIG	 WRT0=OFF	 	;BLOQUES NO PROTEGIDOS CONTRA ESCRITURA
CONFIG	 WRT1=OFF
CONFIG	 WRT2=OFF
CONFIG	 WRT3=OFF

;CONFIG6H DIR 30000BH		A0
CONFIG	 WRTC=OFF	 	;CONFIGURACION DE REGISTROS NO PROTEGIDO
CONFIG	 WRTB=ON	 	;BLOQUE BOOTEBLE NO PROTEGIDO
CONFIG	 WRTD=OFF	 	;EEPROMDE DATOS NO PROTGIDA

;CONFIG7L DIR 30000CH		0F
CONFIG	 EBTR0=OFF	 	;TABLAS DE LETURA NO PROTEGIDAS
CONFIG	 EBTR1=OFF
CONFIG	 EBTR2=OFF
CONFIG	 EBTR3=OFF

;CONFIG7H DIR 30000DH		40
CONFIG	 EBTRB=OFF	 	;TABLAS NO PROTEGIDAS


CBLOCK 0x0			; PARA VARIABLES
ENDC  
org 0x0000					; DIRECCION 0 DE LA MEMORIA
GOTO START
org	0x0020
DB 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F

; CONFIGURACION DE PUERTOS

START
    MOVLW 0x00
    MOVWF TRISA
    MOVLW 0x00
    MOVWF TRISB


;//------------------------------------------------------
; ahora viene la deshabilitaci�n de modulos (pheriperals)
;*******************************************************


MOVLW	0X72
MOVWF	OSCCON			;Configuraci n del registro OSCCON

MOVLW	0X84
MOVWF	T0CON			;Configuraci n del timer 0

clrf ADCON0 			; desactiva el CAD
movlw 0xf 
movwf ADCON1 			; todas digitales

movlw 0x07 
movwf CMCON 			;desactiva el modulo comparador
		
GOTO	INICIO

;----------DELAY SECTION------------
 	
ESPERA							; Delay de 1s
    MOVLW	0x85
    MOVWF	TMR0H
    MOVLW	0xEE
    MOVWF	TMR0L

RELOJ	BTFSS	INTCON,TMR0IF
	GOTO	RELOJ
	BCF	INTCON,TMR0IF
	RETLW	0
 	