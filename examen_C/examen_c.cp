#line 1 "C:/Users/jesus/Desktop/PracticasDispositivosProgramables/examen_C/examen_c.c"
unsigned short display_7seg[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
unsigned short cont = 0;

void main() {
 ADCON1 = 0X0F;
 CMCON = 0X07;
 OSCCON = 0X72;
 TRISB = 0x00;

 while(1) {
 PORTB = display_7seg[cont++];
 Delay_ms(1000);
 if (cont == 16) cont = 0;
 }
}
