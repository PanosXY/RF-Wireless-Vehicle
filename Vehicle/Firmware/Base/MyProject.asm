
_PortInit:

;MyProject.c,37 :: 		PortInit(){
;MyProject.c,38 :: 		TRISA1_bit=0;
	BCF        TRISA1_bit+0, BitPos(TRISA1_bit+0)
;MyProject.c,39 :: 		TRISA2_bit=0;
	BCF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;MyProject.c,40 :: 		TRISB4_bit=0;
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;MyProject.c,41 :: 		TRISB5_bit=0;
	BCF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;MyProject.c,43 :: 		TRISE0_bit=0;
	BCF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
;MyProject.c,44 :: 		TRISA5_bit=0;
	BCF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;MyProject.c,45 :: 		TRISD5_bit=0;
	BCF        TRISD5_bit+0, BitPos(TRISD5_bit+0)
;MyProject.c,46 :: 		TRISD6_bit=0;
	BCF        TRISD6_bit+0, BitPos(TRISD6_bit+0)
;MyProject.c,48 :: 		TRISD1_bit=0;
	BCF        TRISD1_bit+0, BitPos(TRISD1_bit+0)
;MyProject.c,49 :: 		TRISD0_bit=0;
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;MyProject.c,50 :: 		TRISC0_bit=0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;MyProject.c,51 :: 		TRISD2_bit=0;
	BCF        TRISD2_bit+0, BitPos(TRISD2_bit+0)
;MyProject.c,52 :: 		TRISD3_bit=1;
	BSF        TRISD3_bit+0, BitPos(TRISD3_bit+0)
;MyProject.c,53 :: 		TRISD4_bit=1;
	BSF        TRISD4_bit+0, BitPos(TRISD4_bit+0)
;MyProject.c,54 :: 		TRISE1_bit=1;
	BSF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
;MyProject.c,56 :: 		ANSELA=0;
	CLRF       ANSELA+0
;MyProject.c,57 :: 		ANSELB=0;
	CLRF       ANSELB+0
;MyProject.c,58 :: 		ANSELD=0;
	CLRF       ANSELD+0
;MyProject.c,59 :: 		ANSELE=0;
	CLRF       ANSELE+0
;MyProject.c,61 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInit0:
	DECFSZ     R13, 1
	GOTO       L_PortInit0
	DECFSZ     R12, 1
	GOTO       L_PortInit0
	NOP
	NOP
;MyProject.c,62 :: 		Spi1_Init();
	CALL       _SPI1_Init+0
;MyProject.c,63 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInit1:
	DECFSZ     R13, 1
	GOTO       L_PortInit1
	DECFSZ     R12, 1
	GOTO       L_PortInit1
	NOP
	NOP
;MyProject.c,65 :: 		LED1=1;
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,66 :: 		LED2=1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;MyProject.c,67 :: 		LED3=1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,68 :: 		LED4=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,69 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_PortInit2:
	DECFSZ     R13, 1
	GOTO       L_PortInit2
	DECFSZ     R12, 1
	GOTO       L_PortInit2
	DECFSZ     R11, 1
	GOTO       L_PortInit2
	NOP
	NOP
;MyProject.c,70 :: 		LED1=0;
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;MyProject.c,71 :: 		LED2=0;
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;MyProject.c,72 :: 		LED3=0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,73 :: 		LED4=0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,75 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInit3:
	DECFSZ     R13, 1
	GOTO       L_PortInit3
	DECFSZ     R12, 1
	GOTO       L_PortInit3
	NOP
	NOP
;MyProject.c,76 :: 		Uart1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      103
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,77 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInit4:
	DECFSZ     R13, 1
	GOTO       L_PortInit4
	DECFSZ     R12, 1
	GOTO       L_PortInit4
	NOP
	NOP
;MyProject.c,79 :: 		PWM1_Init(4500);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      221
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,80 :: 		PWM2_Init(4500);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      221
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;MyProject.c,81 :: 		PWM1_start();
	CALL       _PWM1_Start+0
;MyProject.c,82 :: 		PWM2_start();
	CALL       _PWM2_Start+0
;MyProject.c,84 :: 		}
L_end_PortInit:
	RETURN
; end of _PortInit

_readConfigRegister:

;MyProject.c,86 :: 		void readConfigRegister(){
;MyProject.c,89 :: 		PRW_UP=1; //SPI PROGRAMMING MODE
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,90 :: 		TRX_CE=0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,91 :: 		TX_EN=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,93 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_readConfigRegister5:
	DECFSZ     R13, 1
	GOTO       L_readConfigRegister5
	DECFSZ     R12, 1
	GOTO       L_readConfigRegister5
	NOP
	NOP
;MyProject.c,94 :: 		CSN=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,95 :: 		SPI1_Write(RC); //READ CONFIG REGISTER
	MOVLW      16
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,97 :: 		for(i=0;i<10;i++){
	CLRF       readConfigRegister_i_L0+0
L_readConfigRegister6:
	MOVLW      128
	XORWF      readConfigRegister_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_readConfigRegister7
;MyProject.c,98 :: 		buffer1=SPI1_Read(buffer);
	MOVF       readConfigRegister_buffer_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
;MyProject.c,97 :: 		for(i=0;i<10;i++){
	INCF       readConfigRegister_i_L0+0, 1
;MyProject.c,99 :: 		}
	GOTO       L_readConfigRegister6
L_readConfigRegister7:
;MyProject.c,101 :: 		CSN=1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,102 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_readConfigRegister9:
	DECFSZ     R13, 1
	GOTO       L_readConfigRegister9
	DECFSZ     R12, 1
	GOTO       L_readConfigRegister9
	NOP
	NOP
;MyProject.c,104 :: 		TX_EN=0; //RECEIVE MODE
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,105 :: 		PRW_UP=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,106 :: 		TRX_CE=1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,107 :: 		}
L_end_readConfigRegister:
	RETURN
; end of _readConfigRegister

_InitNRF:

;MyProject.c,109 :: 		void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
;MyProject.c,113 :: 		PRW_UP=1; //SPI PROGRAMMING MODE
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,114 :: 		TRX_CE=0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,115 :: 		TX_EN=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,117 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_InitNRF10:
	DECFSZ     R13, 1
	GOTO       L_InitNRF10
	DECFSZ     R12, 1
	GOTO       L_InitNRF10
	NOP
	NOP
;MyProject.c,118 :: 		nRFConfig[0] = 0b01111011; //123 CHANNEL NO
	MOVLW      123
	MOVWF      InitNRF_nRFConfig_L0+0
;MyProject.c,119 :: 		nRFConfig[1] = 0b00001100; //433MHZ, +10DBM, NORMAL OPERATION, NO RETRANSMISSION
	MOVLW      12
	MOVWF      InitNRF_nRFConfig_L0+1
;MyProject.c,120 :: 		nRFConfig[2] = 0b01000100; //4 BYTE RX ADDRESS WIDTH, 4 BYTE TX ADDRESS WIDTH
	MOVLW      68
	MOVWF      InitNRF_nRFConfig_L0+2
;MyProject.c,121 :: 		nRFConfig[3] = 0b00000001; //RX PAYLOAD 1 BYTE
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+3
;MyProject.c,122 :: 		nRFConfig[4] = 0b00000001; //TX PAYLOAD 1 BYTE
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+4
;MyProject.c,123 :: 		nRFConfig[5] = nrfAddress0; //ADDRESS
	MOVF       FARG_InitNRF_nRFAddress0+0, 0
	MOVWF      InitNRF_nRFConfig_L0+5
;MyProject.c,124 :: 		nRFConfig[6] = nrfAddress1;
	MOVF       FARG_InitNRF_nRFAddress1+0, 0
	MOVWF      InitNRF_nRFConfig_L0+6
;MyProject.c,125 :: 		nRFConfig[7] = nrfAddress2;
	MOVF       FARG_InitNRF_nRFAddress2+0, 0
	MOVWF      InitNRF_nRFConfig_L0+7
;MyProject.c,126 :: 		nRFConfig[8] = nrfAddress3;
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFConfig_L0+8
;MyProject.c,127 :: 		nRFConfig[9] = 0b11011011; //16 BIT CRC, CRC ENABLE, 16MHZ OSCCILLATOR, NO EXTRNAL CLOCK SIGNAL
	MOVLW      219
	MOVWF      InitNRF_nRFConfig_L0+9
;MyProject.c,129 :: 		CSN = 0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,130 :: 		SPI1_Write(WC); //Write nRF configuration
	CLRF       FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,132 :: 		for(i=0;i<10;i++){
	CLRF       InitNRF_i_L0+0
L_InitNRF11:
	MOVLW      128
	XORWF      InitNRF_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_InitNRF12
;MyProject.c,133 :: 		SPI1_Write(nRFConfig[i]);
	MOVLW      InitNRF_nRFConfig_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(InitNRF_nRFConfig_L0+0)
	MOVWF      FSR0H
	MOVF       InitNRF_i_L0+0, 0
	ADDWF      FSR0L, 1
	MOVLW      0
	BTFSC      InitNRF_i_L0+0, 7
	MOVLW      255
	ADDWFC     FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,132 :: 		for(i=0;i<10;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,134 :: 		}
	GOTO       L_InitNRF11
L_InitNRF12:
;MyProject.c,136 :: 		CSN = 1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,137 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_InitNRF14:
	DECFSZ     R13, 1
	GOTO       L_InitNRF14
	DECFSZ     R12, 1
	GOTO       L_InitNRF14
	NOP
	NOP
;MyProject.c,139 :: 		TX_EN=0; //RECEIVE MODE
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,140 :: 		PRW_UP=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,141 :: 		TRX_CE=1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,142 :: 		}
L_end_InitNRF:
	RETURN
; end of _InitNRF

_rxPacket:

;MyProject.c,144 :: 		void rxPacket(){
;MyProject.c,147 :: 		TX_EN=0; //RECEIVE MODE
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;MyProject.c,148 :: 		PRW_UP=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,149 :: 		TRX_CE=1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;MyProject.c,151 :: 		if(AM==1 && DR==1){
	BTFSS      RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L_rxPacket17
	BTFSS      RD3_bit+0, BitPos(RD3_bit+0)
	GOTO       L_rxPacket17
L__rxPacket41:
;MyProject.c,153 :: 		CSN = 0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,154 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_rxPacket18:
	DECFSZ     R13, 1
	GOTO       L_rxPacket18
	DECFSZ     R12, 1
	GOTO       L_rxPacket18
	NOP
	NOP
;MyProject.c,155 :: 		SPI1_Write(RRP); //Read RX Payload
	MOVLW      36
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,157 :: 		data0 = SPI1_Read(buffer);
	MOVF       rxPacket_buffer_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0, 0
	MOVWF      _data0+0
;MyProject.c,159 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_rxPacket19:
	DECFSZ     R13, 1
	GOTO       L_rxPacket19
	DECFSZ     R12, 1
	GOTO       L_rxPacket19
	NOP
	NOP
;MyProject.c,160 :: 		CSN = 1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;MyProject.c,162 :: 		}
L_rxPacket17:
;MyProject.c,164 :: 		}
L_end_rxPacket:
	RETURN
; end of _rxPacket

_Lights:

;MyProject.c,166 :: 		Lights(){
;MyProject.c,167 :: 		if(data0==LIGHTS){
	MOVF       _data0+0, 0
	XORLW      176
	BTFSS      STATUS+0, 2
	GOTO       L_Lights20
;MyProject.c,168 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11
	MOVLW      134
	MOVWF      R12
	MOVLW      153
	MOVWF      R13
L_Lights21:
	DECFSZ     R13, 1
	GOTO       L_Lights21
	DECFSZ     R12, 1
	GOTO       L_Lights21
	DECFSZ     R11, 1
	GOTO       L_Lights21
;MyProject.c,169 :: 		LED1=!LED1;
	MOVLW
	XORWF      RA1_bit+0, 1
;MyProject.c,170 :: 		LED2=!LED2;
	MOVLW
	XORWF      RA2_bit+0, 1
;MyProject.c,171 :: 		LED3=!LED3;
	MOVLW
	XORWF      RB4_bit+0, 1
;MyProject.c,172 :: 		LED4=!LED4;
	MOVLW
	XORWF      RB5_bit+0, 1
;MyProject.c,173 :: 		}
L_Lights20:
;MyProject.c,174 :: 		}
L_end_Lights:
	RETURN
; end of _Lights

_PWM_Start:

;MyProject.c,177 :: 		PWM_Start(){
;MyProject.c,178 :: 		if (duty!=255) {
	MOVF       _duty+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_PWM_Start22
;MyProject.c,179 :: 		for(duty=105; duty<255; duty+=15){
	MOVLW      105
	MOVWF      _duty+0
L_PWM_Start23:
	MOVLW      255
	SUBWF      _duty+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_PWM_Start24
;MyProject.c,180 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12
	MOVLW      238
	MOVWF      R13
L_PWM_Start26:
	DECFSZ     R13, 1
	GOTO       L_PWM_Start26
	DECFSZ     R12, 1
	GOTO       L_PWM_Start26
	NOP
;MyProject.c,181 :: 		PWM2_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,182 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_PWM_Start27:
	DECFSZ     R13, 1
	GOTO       L_PWM_Start27
	DECFSZ     R12, 1
	GOTO       L_PWM_Start27
	NOP
	NOP
;MyProject.c,183 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,179 :: 		for(duty=105; duty<255; duty+=15){
	MOVLW      15
	ADDWF      _duty+0, 1
;MyProject.c,184 :: 		}
	GOTO       L_PWM_Start23
L_PWM_Start24:
;MyProject.c,185 :: 		} else {
	GOTO       L_PWM_Start28
L_PWM_Start22:
;MyProject.c,186 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,187 :: 		PWM2_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,188 :: 		}
L_PWM_Start28:
;MyProject.c,189 :: 		}
L_end_PWM_Start:
	RETURN
; end of _PWM_Start

_PWM_Stop:

;MyProject.c,191 :: 		PWM_Stop(){
;MyProject.c,192 :: 		for(duty=255; duty=0; duty-=15){
	MOVLW      255
	MOVWF      _duty+0
L_PWM_Stop29:
	CLRF       _duty+0
	GOTO       L_PWM_Stop30
;MyProject.c,193 :: 		delay_ms(20);
L_PWM_Stop32:
	DECFSZ     R13, 1
	GOTO       L_PWM_Stop32
	DECFSZ     R12, 1
	GOTO       L_PWM_Stop32
	NOP
;MyProject.c,194 :: 		PWM2_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,195 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_PWM_Stop33:
	DECFSZ     R13, 1
	GOTO       L_PWM_Stop33
	DECFSZ     R12, 1
	GOTO       L_PWM_Stop33
	NOP
	NOP
;MyProject.c,196 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,192 :: 		for(duty=255; duty=0; duty-=15){
	MOVLW      15
	SUBWF      _duty+0, 1
;MyProject.c,197 :: 		}
	GOTO       L_PWM_Stop29
L_PWM_Stop30:
;MyProject.c,198 :: 		}
L_end_PWM_Stop:
	RETURN
; end of _PWM_Stop

_Movement:

;MyProject.c,200 :: 		void Movement(){
;MyProject.c,202 :: 		if(data0==FORWARD){
	MOVF       _data0+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_Movement34
;MyProject.c,203 :: 		MOTORA1=1;
	BSF        RE0_bit+0, BitPos(RE0_bit+0)
;MyProject.c,204 :: 		MOTORA2=0;
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
;MyProject.c,205 :: 		MOTORB1=1;
	BSF        RD5_bit+0, BitPos(RD5_bit+0)
;MyProject.c,206 :: 		MOTORB2=0;
	BCF        RD6_bit+0, BitPos(RD6_bit+0)
;MyProject.c,207 :: 		PWM_Start();
	CALL       _PWM_Start+0
;MyProject.c,208 :: 		}
L_Movement34:
;MyProject.c,210 :: 		if(data0==BACKWARD){
	MOVF       _data0+0, 0
	XORLW      64
	BTFSS      STATUS+0, 2
	GOTO       L_Movement35
;MyProject.c,211 :: 		MOTORA1=0;
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
;MyProject.c,212 :: 		MOTORA2=1;
	BSF        RA5_bit+0, BitPos(RA5_bit+0)
;MyProject.c,213 :: 		MOTORB1=0;
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
;MyProject.c,214 :: 		MOTORB2=1;
	BSF        RD6_bit+0, BitPos(RD6_bit+0)
;MyProject.c,215 :: 		PWM_Start();
	CALL       _PWM_Start+0
;MyProject.c,216 :: 		}
L_Movement35:
;MyProject.c,218 :: 		if(data0==LEFT){
	MOVF       _data0+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_Movement36
;MyProject.c,219 :: 		MOTORA1=1;
	BSF        RE0_bit+0, BitPos(RE0_bit+0)
;MyProject.c,220 :: 		MOTORA2=0;
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
;MyProject.c,221 :: 		MOTORB1=0;
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
;MyProject.c,222 :: 		MOTORB2=1;
	BSF        RD6_bit+0, BitPos(RD6_bit+0)
;MyProject.c,223 :: 		PWM_Start();
	CALL       _PWM_Start+0
;MyProject.c,224 :: 		}
L_Movement36:
;MyProject.c,226 :: 		if(data0==RIGHT){
	MOVF       _data0+0, 0
	XORLW      96
	BTFSS      STATUS+0, 2
	GOTO       L_Movement37
;MyProject.c,227 :: 		MOTORA1=0;
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
;MyProject.c,228 :: 		MOTORA2=1;
	BSF        RA5_bit+0, BitPos(RA5_bit+0)
;MyProject.c,229 :: 		MOTORB1=1;
	BSF        RD5_bit+0, BitPos(RD5_bit+0)
;MyProject.c,230 :: 		MOTORB2=0;
	BCF        RD6_bit+0, BitPos(RD6_bit+0)
;MyProject.c,231 :: 		PWM_Start();
	CALL       _PWM_Start+0
;MyProject.c,232 :: 		}
L_Movement37:
;MyProject.c,234 :: 		if(data0==STOP){
	MOVF       _data0+0, 0
	XORLW      160
	BTFSS      STATUS+0, 2
	GOTO       L_Movement38
;MyProject.c,235 :: 		MOTORA1=0;
	BCF        RE0_bit+0, BitPos(RE0_bit+0)
;MyProject.c,236 :: 		MOTORA2=0;
	BCF        RA5_bit+0, BitPos(RA5_bit+0)
;MyProject.c,237 :: 		MOTORB1=0;
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
;MyProject.c,238 :: 		MOTORB2=0;
	BCF        RD6_bit+0, BitPos(RD6_bit+0)
;MyProject.c,239 :: 		PWM_Stop();
	CALL       _PWM_Stop+0
;MyProject.c,240 :: 		}
L_Movement38:
;MyProject.c,242 :: 		}
L_end_Movement:
	RETURN
; end of _Movement

_main:

;MyProject.c,244 :: 		void main() {
;MyProject.c,246 :: 		PortInit();
	CALL       _PortInit+0
;MyProject.c,247 :: 		readConfigRegister();
	CALL       _readConfigRegister+0
;MyProject.c,248 :: 		InitNRF(0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      171
	MOVWF      FARG_InitNRF_nRFAddress0+0
	MOVLW      188
	MOVWF      FARG_InitNRF_nRFAddress1+0
	MOVLW      95
	MOVWF      FARG_InitNRF_nRFAddress2+0
	MOVLW      24
	MOVWF      FARG_InitNRF_nRFAddress3+0
	CALL       _InitNRF+0
;MyProject.c,250 :: 		while(1){
L_main39:
;MyProject.c,251 :: 		rxPacket();
	CALL       _rxPacket+0
;MyProject.c,252 :: 		Lights();
	CALL       _Lights+0
;MyProject.c,253 :: 		Movement();
	CALL       _Movement+0
;MyProject.c,255 :: 		}
	GOTO       L_main39
;MyProject.c,257 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
