void main() {
  ADCON1 = 0x0F;
  TRISA = 0xFF;
  TRISB = 0x00;
  
  while(1) {
    PORTB = PORTA.RA1 ? 0x06 : 0xB0;
  }
}