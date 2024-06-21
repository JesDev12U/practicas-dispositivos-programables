// Lcd pinout settings
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;

char frame11[] = {0, 0, 0b00111, 0b1111, 0b11111, 0, 0b10000, 31};
char frame12[] = {0, 0, 0b1110, 31, 31, 31, 31};
char frame13[] = {0, 1, 1, 0b111, 31, 31, 31, 31};
char frame14[] = {0b101, 31, 0b11101, 0b11101, 31, 0b11011, 0b10011, 1};
char frame15[] = {0b10011, 0b11, 0b110, 0b1100, 0b10000, 0b10000, 0, 0};
char frame16[] = {31, 0b10111, 0b110, 0b1100, 0b10000, 0b10000, 0, 0};
char frame17[] = {31, 31, 1, 1, 1, 1, 0, 0};
char frame18[] = {0b10000, 0b11000, 0b11100, 0b1000, 0b1000, 0, 0b10000, 0};
char frame21[] = {0, 0, 0, 0b111, 0b1111, 0b1110, 0b11100, 0b11000};
char frame22[] = {0, 0, 0, 0b1111, 31, 31, 31, 31};
char frame23[] = {0, 0, 1, 0b11, 31, 31, 31, 31};
char frame24[] = {0b10100, 0b11110, 0b11010, 0b11010, 31, 31, 0b10011, 0b10000};
char frame25[] = {0b10011, 0b10011, 0b10, 0b10, 0b100, 0, 0, 0};
char frame26[] = {31, 0b111, 0b111, 0b1110, 0b110, 1, 0, 0};
char frame27[] = {31, 0b11, 0b11, 1, 1, 1, 0, 0};
char frame28[] = {0b10000, 0b11000, 0b1100, 0b10, 0b10, 0b10001, 0, 0};
char frame31[] = {0, 0, 0, 0b11, 0b11, 0b111, 0b1100, 0b1100};
char frame32[] = {0, 0, 0, 0b1111, 31, 31, 31, 31};
char frame33[] = {0, 0, 1, 0b11, 31, 31, 31, 31};
char frame34[] = {0b101, 0b111, 31, 0b11001, 31, 0b10110, 0b110, 0b110};
char frame35[] = {0b1100, 0b11000, 0b10000, 1, 1, 1, 0, 0};
char frame36[] = {31, 31, 0b11110, 0b10110, 0b111, 0, 0, 0};
char frame37[] = {31, 31, 0b11, 0b11, 0b10, 0b10100, 0b100, 0b10};
char frame38[] = {0b11100, 0b11100, 0b100, 0b100, 0b100, 0b1000, 0b1000, 0};

void customChar(char pos_row, char pos_char, char* character, char location) {
    char i;
    if(location < 8) { // CGRAM has 8 locations (0-7)
        Lcd_Cmd(64 + (location * 8)); // Set CGRAM address
        for (i = 0; i < 8; i++) Lcd_Chr_CP(character[i]); // Write 8 bytes for the character
        Lcd_Cmd(_LCD_RETURN_HOME); // Return to the home position
        Lcd_Chr(pos_row, pos_char, location); // Display the custom character
    }
}

void printFrame1(unsigned short pos) {
  customChar(1, pos, frame11, 0);
  customChar(1, pos + 1, frame12, 1);
  customChar(1, pos + 2, frame13, 2);
  customChar(1, pos + 3, frame14, 3);
  customChar(2, pos, frame15, 4);
  customChar(2, pos + 1, frame16, 5);
  customChar(2, pos + 2, frame17, 6);
  customChar(2, pos + 3, frame18, 7);
}

void printFrame2(unsigned short pos) {
  customChar(1, pos, frame21, 0);
  customChar(1, pos + 1, frame22, 1);
  customChar(1, pos + 2, frame23, 2);
  customChar(1, pos + 3, frame24, 3);
  customChar(2, pos, frame25, 4);
  customChar(2, pos + 1, frame26, 5);
  customChar(2, pos + 2, frame27, 6);
  customChar(2, pos + 3, frame28, 7);
}

void printFrame3(unsigned short pos) {
  customChar(1, pos, frame31, 0);
  customChar(1, pos + 1, frame32, 1);
  customChar(1, pos + 2, frame33, 2);
  customChar(1, pos + 3, frame34, 3);
  customChar(2, pos, frame35, 4);
  customChar(2, pos + 1, frame36, 5);
  customChar(2, pos + 2, frame37, 6);
  customChar(2, pos + 3, frame38, 7);
}

void clearFrame(unsigned short pos) {
  // Clear the previous frame by writing spaces
  Lcd_Chr(1, pos, ' ');
  Lcd_Chr(1, pos + 1, ' ');
  Lcd_Chr(1, pos + 2, ' ');
  Lcd_Chr(1, pos + 3, ' ');
  Lcd_Chr(2, pos, ' ');
  Lcd_Chr(2, pos + 1, ' ');
  Lcd_Chr(2, pos + 2, ' ');
  Lcd_Chr(2, pos + 3, ' ');
}

unsigned short currentOption = 0;

void op1() {
  if (currentOption != 1) {
    Lcd_Cmd(_LCD_CLEAR);
    currentOption = 1;
  }
  Lcd_out(1, 4, "IPN-UPIICSA");
}

unsigned short cont = 0;
unsigned short reversa = 0;

void op2() {
  static unsigned short pos = 1;
  static unsigned short direction = 1; // 1: right, 0: left
  static unsigned short cont = 0;

  if (currentOption != 2) {
    Lcd_Cmd(_LCD_CLEAR);
    currentOption = 2;
    pos = 1;
    direction = 1;
    cont = 0;
  }

  Lcd_cmd(_LCD_CLEAR);

  if (direction) {
    cont++;
    if (cont == 5) {
      direction = 0;
    }
  } else {
    cont--;
    if (cont == 0) {
      direction = 1;
    }
  }

  Lcd_out(1, cont, "Hola maquina");
  Delay_ms(500);
}

unsigned short pos = 1;
unsigned short prev_pos = 1;
void op3() {
  if (currentOption != 3) {
    Lcd_Cmd(_LCD_CLEAR);
    currentOption = 3;
    pos = 1;
    prev_pos = 1;
  }
  clearFrame(prev_pos); // Clear the previous frame
  printFrame1(pos);
  printFrame2(pos);
  printFrame3(pos);
  prev_pos = pos;
  Delay_ms(50);
  pos++;
  if (pos > 17) { // Adjusted limit to avoid writing beyond the screen
    pos = 1; // Teleport to the left
  }
}

void main() {
  TRISA = 0xFF;
  ADCON0 = 0X00;
  ADCON1 = 0X0F;
  CMCON = 0X07;
  OSCCON = 0x72;
  Lcd_Init();
  Lcd_cmd(_LCD_CURSOR_OFF);

  while(1) {
    /*switch(PORTA) {
      case 0b00:{
        op1();
        break;
      }
      case 0b01:{
        op3();
        break;
      }

      case 0b10:{
        op2();
        break;
      }
    }*/
    if (PORTA.RA0 == 0 && PORTA.RA1 == 0) op1();
    else if (PORTA.RA0 == 0 && PORTA.RA1 == 1) op2();
    else if (PORTA.RA0 == 1 && PORTA.RA1 == 0) op3();
  }
}