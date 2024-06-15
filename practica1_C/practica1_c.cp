#line 1 "C:/Users/jesus/Desktop/PracticasDispositivosProgramables/practica1_C/practica1_c.c"
void main() {
 ADCON1 = 0x0F;
 TRISB = 0xFF;
 TRISD = 0x00;

 while(1) {
 PORTD = PORTB;
 }
}
