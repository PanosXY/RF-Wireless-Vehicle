#define WC              0x00 //Write Configuration Register Command
#define RC              0x10 //Read  Configuration Register Command
#define WTP             0x20 //Write TX Payload Command
#define RTXP            0x21 //Read  TX Payload Command
#define WTA             0x22 //Write TX Address Command
#define RTA             0x23 //Read  TX Address Command
#define RRP             0x24 //Read  RX Payload Command

#define FORWARD         0x20
#define BACKWARD        0x40
#define RIGHT           0x60
#define LEFT            0x80
#define STOP            0xA0
#define LIGHTS          0xB0

sbit LED at RB5_bit;
sbit KEY at RA2_bit;

sbit TX_EN at RC1_bit;   //OUT
sbit TRX_CE at RC0_bit;  //OUT
sbit PRW_UP at RC2_bit;  //OUT
sbit CSN at RB4_bit;     //OUT
sbit DR at RB3_bit;      //IN
sbit AM at RA5_bit;      //IN
sbit CD at RA4_bit;      //IN

int Xaxis, Yaxis;
unsigned short Forward=0, Backward=0, Left=0, Right=0, Stop=0;
unsigned short flag=0;

void PortInitialization(){

     TRISB5_bit=0;
     TRISA2_bit=1;

     TRISC1_bit=0;
     TRISC0_bit=0;
     TRISC2_bit=0;
     TRISB4_bit=0;
     TRISB3_bit=1;
     TRISA5_bit=1;
     TRISA4_bit=1;
     
     ANSELA=0;
     ANSELB=0;
     ANSELA.F0=1; //X AXIS
     ANSELA.F1=1; //Y AXIS
     
     //FIXED VOLTAGE REFERNCE REGISTER
     FVREN_bit=1; //FIXED VOLTAGE REFERENCE ENABLE
     FVRRDY_bit=1; //FIXED VOLTAGE REFERENCE OUTPUT IS READY FOR USE
     CDAFVR1_bit=0; //COMPARATOR AND DAC FVR IS OFF
     CDAFVR0_bit=0;
     ADFVR1_bit=1; //FIXED VOLTAGE REFERENCE OUPUT IS 2.048 VOLT
     ADFVR0_bit=0;
     
     ADNREF_bit=0; //VOLTAGE- REFERENCE TO VSS(GND)
     ADPREF1_bit=1; //VOLTAGE+ REFERENCE TO FVR MODULE
     ADPREF0_bit=1;

     Delay_ms(100);
     Spi1_Init();
     Delay_ms(100);
     
     LED=1;
     Delay_ms(1000);
     LED=0;
     
     Delay_ms(100);
     Uart1_Init(9600);
     Delay_ms(100);

}

void readConfigRegister(){
 short i, buffer, buffer1;

 PRW_UP=1; //SPI PROGRAMMING MODE
 TRX_CE=0;
 TX_EN=0;

 Delay_ms(2);
 CSN=0;
 SPI1_Write(RC); //READ CONFIG REGISTER

 for(i=0;i<10;i++){
  buffer1=SPI1_Read(buffer);
 }

 CSN=1;
 Delay_ms(2);

 TX_EN=0; //RECEIVE MODE
 PRW_UP=1;
 TRX_CE=1;
}

void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
 short i;
 short nRFConfig[10];

 PRW_UP=1; //SPI PROGRAMMING MODE
 TRX_CE=0;
 TX_EN=0;

 Delay_ms(2);
 nRFConfig[0] = 0b01111011; //123 CHANNEL NO
 nRFConfig[1] = 0b00001100; //433MHZ, +10DBM, NORMAL OPERATION, NO RETRANSMISSION
 nRFConfig[2] = 0b01000100; //4 BYTE RX ADDRESS WIDTH, 4 BYTE TX ADDRESS WIDTH
 nRFConfig[3] = 0b00000001; //RX PAYLOAD 1 BYTE
 nRFConfig[4] = 0b00000001; //TX PAYLOAD 1 BYTE
 nRFConfig[5] = nrfAddress0; //ADDRESS
 nRFConfig[6] = nrfAddress1;
 nRFConfig[7] = nrfAddress2;
 nRFConfig[8] = nrfAddress3;
 nRFConfig[9] = 0b11011011; //16 BIT CRC, CRC ENABLE, 16MHZ OSCCILLATOR, NO EXTRNAL CLOCK SIGNAL

 CSN = 0;
 SPI1_Write(WC); //Write nRF configuration

 for(i=0;i<10;i++){
  SPI1_Write(nRFConfig[i]);
 }

 CSN = 1;
 Delay_ms(2);

 TX_EN=0; //RECEIVE MODE
 PRW_UP=1;
 TRX_CE=1;
 }
 
void txPacket(unsigned short packet0, short ad0,short ad1,short ad2,short ad3){
 TX_EN = 0; //POWER DOWN
 PRW_UP = 0;
 TRX_CE = 0;

 CSN=0;
 Delay_ms(2);

 SPI1_Write(WTA); //WRITE TX ADRESS
 SPI1_Write(ad0);
 SPI1_Write(ad1);
 SPI1_Write(ad2);
 SPI1_Write(ad3);
 CSN=1;

 Delay_ms(5);

 CSN=0;
 Delay_ms(2);

 SPI1_Write(WTP); //WRITE TX PAYLOAD
 SPI1_Write(packet0);

 CSN=1;
 Delay_ms(2);

 while( CD == 1 );

 PRW_UP=1;   //START TRANSMITTING
 TX_EN=1;
 TRX_CE=1;

 while(DR==0); //WAIT FOR TRASMIT
 Delay_ms(5);

 TRX_CE=0; //ENTER IN STANDBY MODE
 TX_EN=1;
 PRW_UP=1;

}

void Joystick(){

     if(KEY==0){
                Delay_ms(10);
                txPacket(LIGHTS, 0xAB, 0xBC, 0x5F, 0x18);
                Delay_ms(10);
     }
     
     Xaxis=ADC_Read(0);
     Delay_ms(3);
     Yaxis=ADC_Read(1);
     Delay_ms(3);
     
     if(Xaxis<200){ //RIGHT
                    Right=1;
                    Stop=0;
                    
                    LED=1;
                    Delay_ms(500);

     }
     
     if(Xaxis>900){ //LEFT
                    Left=1;
                    Stop=0;
                    
                    LED=1;
                    Delay_ms(500);

     }
     
     if(Yaxis<200){ //FORWARD
                   Forward=1;
                   Stop=0;
                   
                   LED=1;
                   Delay_ms(500);

     }
     
     if(Yaxis>900){ //BACKWARD
                   Backward=1;
                   Stop=0;
                   
                   LED=1;
                   Delay_ms(500);

     }

     if((Xaxis<600 && Xaxis>400) && (Yaxis<600 && Yaxis>400)){
                   Stop=1;
                   Right=0;
                   Left=0;
                   Forward=0;
                   Backward=0;
                   
                   LED=0;
     }

}

void SendDirections(){

     if(Forward==1){
                    Delay_ms(10);
                    txPacket(FORWARD, 0xAB, 0xBC, 0x5F, 0x18);
                    Delay_ms(10);
                    
                    Forward=0;
                    flag=1;
     }
     
     if(Backward==1 ){
                    Delay_ms(10);
                    txPacket(BACKWARD, 0xAB, 0xBC, 0x5F, 0x18);
                    Delay_ms(10);

                    Backward=0;
                    flag=1;
     }
     
     if(Left==1 ){
                    Delay_ms(10);
                    txPacket(LEFT, 0xAB, 0xBC, 0x5F, 0x18);
                    Delay_ms(10);

                    Left=0;
                    flag=1;
}
     
     if(Right==1 ){
                    Delay_ms(10);
                    txPacket(RIGHT, 0xAB, 0xBC, 0x5F, 0x18);
                    Delay_ms(10);

                    Right=0;
                    flag=1;
     }
     
     if(Stop==1 ){
                    Delay_ms(10);
                    txPacket(STOP, 0xAB, 0xBC, 0x5F, 0x18);
                    Delay_ms(10);

                    Stop=0;
                    flag=1;
     }

}

void main() {

     PortInitialization();
     readConfigRegister();
     InitNRF(0x92,0xC5,0xA6,0xB0);

     while(1){
     
              Joystick();
              if(flag == 0) {
                     SendDirections();
              }
              flag=0;
     }

}