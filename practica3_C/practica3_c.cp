#line 1 "C:/Users/jesus/Desktop/PracticasDispositivosProgramables/practica3_C/practica3_c.c"




void main() {
 ADCON1 = 0x0F;
 TRISD = 0xFF;
 TRISB = 0x00;
 while(1)
 PORTB = PORTD ==  0x5A  ?  0x64  :  0x02 ;
}
