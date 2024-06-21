#line 1 "C:/Users/jesus/Desktop/PracticasDispositivosProgramables/HolaMundoLCD/HolaMundoLCD.c"

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;


sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

void main() {
 TRISD = 0x00;
 TRISB = 0x00;
 ADCON0 = 0X00;
 ADCON1 = 0X0F;
 CMCON = 0X07;
 OSCCON = 0X72;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_out(1, 4, "IPN-UPIICSA");
}
