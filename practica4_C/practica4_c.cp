#line 1 "C:/Users/jesus/Desktop/PracticasDispositivosProgramables/practica4_C/practica4_c.c"
void main() {
 unsigned short display_7seg[8] = {0x76, 0x5c, 0x06, 0x5f, 0x40, 0x30, 0x73, 0x54};
 ADCON0 = 0X00;
 ADCON1 = 0X0F;
 CMCON = 0X07;
 TRISA = 0xFF;
 TRISB = 0x00;
 while(1) {
 PORTB = display_7seg[PORTA];
 }
}
