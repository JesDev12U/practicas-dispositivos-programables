void main() {
  ADCON1 = 0x0F;  // Desactiva las entradas analógicas, configura todos los pines como digitales
  TRISB = 0xFF;   // Configura todos los pines del puerto A como entradas
  TRISD = 0x00;   // Configura todos los pines del puerto B como salidas

  while(1) {
    PORTD = PORTB;  // Copia el estado del puerto A al puerto B
  }
}