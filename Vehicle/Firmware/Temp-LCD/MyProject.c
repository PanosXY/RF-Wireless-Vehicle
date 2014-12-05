sbit LCD_RS at RC3_bit;
sbit LCD_EN at RC2_bit;
sbit LCD_D4 at RA4_bit;
sbit LCD_D5 at RA3_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA1_bit;

sbit LCD_RS_Direction at TRISC3_bit;
sbit LCD_EN_Direction at TRISC2_bit;
sbit LCD_D4_Direction at TRISA4_bit;
sbit LCD_D5_Direction at TRISA3_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA1_bit;

sbit BACKLIGHT at RA0_bit;

bit fl;
char InitialText1[]="    motrack     ";
char InitialText2[]="Temp:";
char InitialText3[]="Alex Efthymiadis";
char txt[7];
float Temperature;
unsigned int delay=0, delay1=0;
int tmr=0;
const char character[] = {6,9,9,6,0,0,0,0};

void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

TemperatureRead(){
 Temperature=ADC_Read(13);
 Delay_ms(3);
 Temperature=(Temperature*5.0)/1024;
 Temperature=Temperature*100;

}

LCD(){
 Lcd_Out(1,1,InitialText1);
 TemperatureRead();
 IntToStr(Temperature,txt);
 Lcd_Out(2,3,txt);
 CustomChar(2, 9);
 Lcd_Out(2,10,"C");
 Lcd_Out(2,1,InitialText2);
}


PortInit(){

           TRISA0_bit=0;
           TRISB5_bit=1;
           
           ANSELA=0;
           ANSELB=0;
           ANSELB.F5=1;
           
           TMR0CS_bit=0;
           TMR0SE_bit=0;
           PSA_bit=0;
           PS0_bit=1;
           PS1_bit=1;
           PS2_bit=1;
           
           GIE_bit=1;
           TMR0IE_bit=1;
           TMR0IF_bit=0;
           TMR0=0;
           
           Delay_ms(100);
           Lcd_Init(); //Initialize LCD
           Delay_ms(100);
           Lcd_Cmd(_LCD_CLEAR); //Clear display
           Lcd_Cmd(_LCD_CURSOR_OFF); //Cursor off

           BACKLIGHT=1;

}

void interrupt(){

     if(TMR0IF_bit==1){
                       tmr++;
                       if(tmr==(15*30)){
                                        BACKLIGHT=0;
                                        tmr=0;
                                        GIE_bit=0;
                       }
                       TMR0IF_bit=0;
     }

}


void main() {

     PortInit();
     LCD();
     
     while(1){
     
                  IntToStr(Temperature,txt);
                  Lcd_Out(2,3,txt);
                  CustomChar(2, 9);
                  Lcd_Out(2,10,"C");
                  Lcd_Out(2,1,InitialText2);



                  delay_ms(5000);
                  fl=!fl;
                  if(fl==1){
                   Lcd_Out(1,1,InitialText3);
                  }
                  if(fl==0){
                   Lcd_Out(1,1,InitialText1);
                  }


     }

}