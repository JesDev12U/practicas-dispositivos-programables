#include <xc.h>

// Configuración de los fuses
#pragma config FOSC = INTOSCIO_EC // Oscillator Selection bits (Internal oscillator, port function on RA6 and EC used by USB (INTOSCIO_EC))
#pragma config WDT = OFF          // Watchdog Timer Enable bit (WDT disabled)
#pragma config MCLRE = ON         // RE3/MCLR pin function select bit (RE3/MCLR pin function is MCLR)
#pragma config PBADEN = OFF       // PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
#pragma config LVP = OFF          // Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
#pragma config XINST = OFF        // Extended Instruction Set (Enabled)

#define _XTAL_FREQ 8000000        // Definir la frecuencia del oscilador a 8 MHz

void configurarOscilador() {
    OSCCONbits.IRCF = 0b111; // Configurar la frecuencia del oscilador interno a 8 MHz
    OSCCONbits.SCS = 0b10;   // Seleccionar el oscilador interno como la fuente del sistema
}

void main() {
    configurarOscilador();   // Llamar a la función para configurar el oscilador interno

    // Configuración de puertos
    TRISB = 0;
    unsigned char display_7seg[16] = {
        0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
    };
    unsigned char cont = 0;

    while(1) {
        PORTB = display_7seg[cont++];
        __delay_ms(1000); // Retardo de 1000 ms
        if(cont == 16) cont = 0;
    }
}
