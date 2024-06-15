#define NA 0x02
#define ACCESO 0x64
#define LLAVE 0x5A

void main() {
  ADCON1 = 0x0F;
  TRISD = 0xFF;
  TRISB = 0x00;
  while(1)
    PORTB = PORTD == LLAVE ? ACCESO : NA;
}