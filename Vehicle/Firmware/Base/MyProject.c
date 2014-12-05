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

sbit LED1 at RA1_bit;
sbit LED2 at RA2_bit;
sbit LED3 at RB4_bit;
sbit LED4 at RB5_bit;

sbit MOTORA1 at RE0_bit;
sbit MOTORA2 at RA5_bit;
sbit MOTORB1 at RD5_bit;
sbit MOTORB2 at RD6_bit;

sbit TX_EN at RD1_bit;  //OUTPUT
sbit TRX_CE at RD0_bit; //OUTPUT
sbit PRW_UP at RC0_bit; //OUTPUT
sbit CSN at RD2_bit;    //OUTPUT
sbit DR at RD3_bit;     //INPUT
sbit AM at RD4_bit;     //INPUT
sbit CD at RE1_bit;     //INPUT

unsigned short data;
unsigned short duty_cicle=0;

void PortInit() {
	TRISA1_bit=0;
	TRISA2_bit=0;
	TRISB4_bit=0;
	TRISB5_bit=0;

	TRISE0_bit=0;
	TRISA5_bit=0;
	TRISD5_bit=0;
	TRISD6_bit=0;

	TRISD1_bit=0;
	TRISD0_bit=0;
	TRISC0_bit=0;
	TRISD2_bit=0;
	TRISD3_bit=1;
	TRISD4_bit=1;
	TRISE1_bit=1;

	ANSELA=0;
	ANSELB=0;
	ANSELD=0;
	ANSELE=0;

	Delay_ms(100);
	Spi1_Init();
	Delay_ms(100);

	LED1=1;
	LED2=1;
	LED3=1;
	LED4=1;
	Delay_ms(1000);
	LED1=0;
	LED2=0;
	LED3=0;
	LED4=0;

	Delay_ms(100);
	Uart1_Init(9600);
	Delay_ms(100);

	PWM1_Init(4500);
	PWM2_Init(4500);
	PWM1_start();
	PWM2_start();
}

void readConfigRegister() {
	short i, buffer, budder2;

	PRW_UP=1; //SPI PROGRAMMING MODE
	TRX_CE=0;
	TX_EN=0;

	Delay_ms(2);
	CSN=0;
	SPI1_Write(RC); //READ CONFIG REGISTER

	for(i=0;i<10;i++){
		budder2=SPI1_Read(buffer);
	}

	CSN=1;
	Delay_ms(2);

	TX_EN=0; //RECEIVE MODE
	PRW_UP=1;
	TRX_CE=1;
}

void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3) {
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
 
void rxPacket() {
	short buffer;

	TX_EN=0; //RECEIVE MODE
	PRW_UP=1;
	TRX_CE=1;

	if(AM==1 && DR==1){

	CSN = 0;
	Delay_ms(2);
	SPI1_Write(RRP); //Read RX Payload

	data = SPI1_Read(buffer);

	Delay_ms(2);
	CSN = 1;

	}
}

void Lights() {
	if(data==LIGHTS){
		Delay_ms(300);
		LED1=!LED1;
		LED2=!LED2;
		LED3=!LED3;
		LED4=!LED4;
	}
}


void PWM_Start() {
	if (duty_cicle!=255) {
		for(duty_cicle=105; duty_cicle<255; duty_cicle+=15) {
		   delay_ms(50);
		   PWM2_Set_Duty_Cicle(duty_cicle);
		   delay_ms(10);
		   PWM1_Set_Duty_Cicle(duty_cicle);
		}
	} 
	else {
		PWM1_Set_Duty_Cicle(duty_cicle);
		PWM2_Set_Duty_Cicle(duty_cicle);
	}
}

void PWM_Stop() {
    for(duty_cicle=255; duty_cicle=0; duty_cicle-=15){
		delay_ms(20);
		PWM2_Set_Duty_Cicle(duty_cicle);
		delay_ms(10);
		PWM1_Set_Duty_Cicle(duty_cicle);
    }
}

void Movement() {

	if(data==FORWARD){
		MOTORA1=1;
		MOTORA2=0;
		MOTORB1=1;
		MOTORB2=0;
		PWM_Start();
	}

	if(data==BACKWARD){
		MOTORA1=0;
		MOTORA2=1;
		MOTORB1=0;
		MOTORB2=1;
		PWM_Start();
	}

	if(data==LEFT){
		MOTORA1=1;
		MOTORA2=0;
		MOTORB1=0;
		MOTORB2=1;
		PWM_Start();
	}

	if(data==RIGHT){
		MOTORA1=0;
		MOTORA2=1;
		MOTORB1=1;
		MOTORB2=0;
		PWM_Start();
	}

	if(data==STOP){
		MOTORA1=0;
		MOTORA2=0;
		MOTORB1=0;
		MOTORB2=0;
		PWM_Stop();
	}

}

void main() {

	PortInit();
	readConfigRegister();
	InitNRF(0xAB, 0xBC, 0x5F, 0x18);

	while(1) {
		rxPacket();
		Lights();
		Movement();
	}
}
