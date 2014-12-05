
_PortInitialization:

;MyProject.c,31 :: 		void PortInitialization(){
;MyProject.c,33 :: 		TRISB5_bit=0;
	BCF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;MyProject.c,34 :: 		TRISA2_bit=1;
	BSF        TRISA2_bit+0, BitPos(TRISA2_bit+0)
;MyProject.c,36 :: 		TRISC1_bit=0;
	BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;MyProject.c,37 :: 		TRISC0_bit=0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;MyProject.c,38 :: 		TRISC2_bit=0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;MyProject.c,39 :: 		TRISB4_bit=0;
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;MyProject.c,40 :: 		TRISB3_bit=1;
	BSF        TRISB3_bit+0, BitPos(TRISB3_bit+0)
;MyProject.c,41 :: 		TRISA5_bit=1;
	BSF        TRISA5_bit+0, BitPos(TRISA5_bit+0)
;MyProject.c,42 :: 		TRISA4_bit=1;
	BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;MyProject.c,44 :: 		ANSELA=0;
	CLRF       ANSELA+0
;MyProject.c,45 :: 		ANSELB=0;
	CLRF       ANSELB+0
;MyProject.c,46 :: 		ANSELA.F0=1; //X AXIS
	BSF        ANSELA+0, 0
;MyProject.c,47 :: 		ANSELA.F1=1; //Y AXIS
	BSF        ANSELA+0, 1
;MyProject.c,50 :: 		FVREN_bit=1; //FIXED VOLTAGE REFERENCE ENABLE
	BSF        FVREN_bit+0, BitPos(FVREN_bit+0)
;MyProject.c,51 :: 		FVRRDY_bit=1; //FIXED VOLTAGE REFERENCE OUTPUT IS READY FOR USE
	BSF        FVRRDY_bit+0, BitPos(FVRRDY_bit+0)
;MyProject.c,52 :: 		CDAFVR1_bit=0; //COMPARATOR AND DAC FVR IS OFF
	BCF        CDAFVR1_bit+0, BitPos(CDAFVR1_bit+0)
;MyProject.c,53 :: 		CDAFVR0_bit=0;
	BCF        CDAFVR0_bit+0, BitPos(CDAFVR0_bit+0)
;MyProject.c,54 :: 		ADFVR1_bit=1; //FIXED VOLTAGE REFERENCE OUPUT IS 2.048 VOLT
	BSF        ADFVR1_bit+0, BitPos(ADFVR1_bit+0)
;MyProject.c,55 :: 		ADFVR0_bit=0;
	BCF        ADFVR0_bit+0, BitPos(ADFVR0_bit+0)
;MyProject.c,57 :: 		ADNREF_bit=0; //VOLTAGE- REFERENCE TO VSS(GND)
	BCF        ADNREF_bit+0, BitPos(ADNREF_bit+0)
;MyProject.c,58 :: 		ADPREF1_bit=1; //VOLTAGE+ REFERENCE TO FVR MODULE
	BSF        ADPREF1_bit+0, BitPos(ADPREF1_bit+0)
;MyProject.c,59 :: 		ADPREF0_bit=1;
	BSF        ADPREF0_bit+0, BitPos(ADPREF0_bit+0)
;MyProject.c,61 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInitialization0:
	DECFSZ     R13, 1
	GOTO       L_PortInitialization0
	DECFSZ     R12, 1
	GOTO       L_PortInitialization0
	NOP
	NOP
;MyProject.c,62 :: 		Spi1_Init();
	CALL       _SPI1_Init+0
;MyProject.c,63 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInitialization1:
	DECFSZ     R13, 1
	GOTO       L_PortInitialization1
	DECFSZ     R12, 1
	GOTO       L_PortInitialization1
	NOP
	NOP
;MyProject.c,65 :: 		LED=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,66 :: 		Delay_ms(1000);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_PortInitialization2:
	DECFSZ     R13, 1
	GOTO       L_PortInitialization2
	DECFSZ     R12, 1
	GOTO       L_PortInitialization2
	DECFSZ     R11, 1
	GOTO       L_PortInitialization2
	NOP
	NOP
;MyProject.c,67 :: 		LED=0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,69 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInitialization3:
	DECFSZ     R13, 1
	GOTO       L_PortInitialization3
	DECFSZ     R12, 1
	GOTO       L_PortInitialization3
	NOP
	NOP
;MyProject.c,70 :: 		Uart1_Init(9600);
	BSF        BAUDCON+0, 3
	MOVLW      103
	MOVWF      SPBRG+0
	MOVLW      0
	MOVWF      SPBRG+1
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MyProject.c,71 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInitialization4:
	DECFSZ     R13, 1
	GOTO       L_PortInitialization4
	DECFSZ     R12, 1
	GOTO       L_PortInitialization4
	NOP
	NOP
;MyProject.c,73 :: 		}
L_end_PortInitialization:
	RETURN
; end of _PortInitialization

_readConfigRegister:

;MyProject.c,75 :: 		void readConfigRegister(){
;MyProject.c,78 :: 		PRW_UP=1; //SPI PROGRAMMING MODE
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,79 :: 		TRX_CE=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,80 :: 		TX_EN=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,82 :: 		Delay_ms(2);
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
;MyProject.c,83 :: 		CSN=0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,84 :: 		SPI1_Write(RC); //READ CONFIG REGISTER
	MOVLW      16
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,86 :: 		for(i=0;i<10;i++){
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
;MyProject.c,87 :: 		buffer1=SPI1_Read(buffer);
	MOVF       readConfigRegister_buffer_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
;MyProject.c,86 :: 		for(i=0;i<10;i++){
	INCF       readConfigRegister_i_L0+0, 1
;MyProject.c,88 :: 		}
	GOTO       L_readConfigRegister6
L_readConfigRegister7:
;MyProject.c,90 :: 		CSN=1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,91 :: 		Delay_ms(2);
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
;MyProject.c,93 :: 		TX_EN=0; //RECEIVE MODE
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,94 :: 		PRW_UP=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,95 :: 		TRX_CE=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,96 :: 		}
L_end_readConfigRegister:
	RETURN
; end of _readConfigRegister

_InitNRF:

;MyProject.c,98 :: 		void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
;MyProject.c,102 :: 		PRW_UP=1; //SPI PROGRAMMING MODE
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,103 :: 		TRX_CE=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,104 :: 		TX_EN=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,106 :: 		Delay_ms(2);
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
;MyProject.c,107 :: 		nRFConfig[0] = 0b01111011; //123 CHANNEL NO
	MOVLW      123
	MOVWF      InitNRF_nRFConfig_L0+0
;MyProject.c,108 :: 		nRFConfig[1] = 0b00001100; //433MHZ, +10DBM, NORMAL OPERATION, NO RETRANSMISSION
	MOVLW      12
	MOVWF      InitNRF_nRFConfig_L0+1
;MyProject.c,109 :: 		nRFConfig[2] = 0b01000100; //4 BYTE RX ADDRESS WIDTH, 4 BYTE TX ADDRESS WIDTH
	MOVLW      68
	MOVWF      InitNRF_nRFConfig_L0+2
;MyProject.c,110 :: 		nRFConfig[3] = 0b00000001; //RX PAYLOAD 1 BYTE
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+3
;MyProject.c,111 :: 		nRFConfig[4] = 0b00000001; //TX PAYLOAD 1 BYTE
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+4
;MyProject.c,112 :: 		nRFConfig[5] = nrfAddress0; //ADDRESS
	MOVF       FARG_InitNRF_nRFAddress0+0, 0
	MOVWF      InitNRF_nRFConfig_L0+5
;MyProject.c,113 :: 		nRFConfig[6] = nrfAddress1;
	MOVF       FARG_InitNRF_nRFAddress1+0, 0
	MOVWF      InitNRF_nRFConfig_L0+6
;MyProject.c,114 :: 		nRFConfig[7] = nrfAddress2;
	MOVF       FARG_InitNRF_nRFAddress2+0, 0
	MOVWF      InitNRF_nRFConfig_L0+7
;MyProject.c,115 :: 		nRFConfig[8] = nrfAddress3;
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFConfig_L0+8
;MyProject.c,116 :: 		nRFConfig[9] = 0b11011011; //16 BIT CRC, CRC ENABLE, 16MHZ OSCCILLATOR, NO EXTRNAL CLOCK SIGNAL
	MOVLW      219
	MOVWF      InitNRF_nRFConfig_L0+9
;MyProject.c,118 :: 		CSN = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,119 :: 		SPI1_Write(WC); //Write nRF configuration
	CLRF       FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,121 :: 		for(i=0;i<10;i++){
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
;MyProject.c,122 :: 		SPI1_Write(nRFConfig[i]);
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
;MyProject.c,121 :: 		for(i=0;i<10;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,123 :: 		}
	GOTO       L_InitNRF11
L_InitNRF12:
;MyProject.c,125 :: 		CSN = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,126 :: 		Delay_ms(2);
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
;MyProject.c,128 :: 		TX_EN=0; //RECEIVE MODE
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,129 :: 		PRW_UP=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,130 :: 		TRX_CE=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,131 :: 		}
L_end_InitNRF:
	RETURN
; end of _InitNRF

_txPacket:

;MyProject.c,133 :: 		void txPacket(unsigned short packet0, short ad0,short ad1,short ad2,short ad3){
;MyProject.c,134 :: 		TX_EN = 0; //POWER DOWN
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,135 :: 		PRW_UP = 0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,136 :: 		TRX_CE = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,138 :: 		CSN=0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,139 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_txPacket15:
	DECFSZ     R13, 1
	GOTO       L_txPacket15
	DECFSZ     R12, 1
	GOTO       L_txPacket15
	NOP
	NOP
;MyProject.c,141 :: 		SPI1_Write(WTA); //WRITE TX ADRESS
	MOVLW      34
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,142 :: 		SPI1_Write(ad0);
	MOVF       FARG_txPacket_ad0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,143 :: 		SPI1_Write(ad1);
	MOVF       FARG_txPacket_ad1+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,144 :: 		SPI1_Write(ad2);
	MOVF       FARG_txPacket_ad2+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,145 :: 		SPI1_Write(ad3);
	MOVF       FARG_txPacket_ad3+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,146 :: 		CSN=1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,148 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_txPacket16:
	DECFSZ     R13, 1
	GOTO       L_txPacket16
	DECFSZ     R12, 1
	GOTO       L_txPacket16
;MyProject.c,150 :: 		CSN=0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,151 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_txPacket17:
	DECFSZ     R13, 1
	GOTO       L_txPacket17
	DECFSZ     R12, 1
	GOTO       L_txPacket17
	NOP
	NOP
;MyProject.c,153 :: 		SPI1_Write(WTP); //WRITE TX PAYLOAD
	MOVLW      32
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,154 :: 		SPI1_Write(packet0);
	MOVF       FARG_txPacket_packet0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,156 :: 		CSN=1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;MyProject.c,157 :: 		Delay_ms(2);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_txPacket18:
	DECFSZ     R13, 1
	GOTO       L_txPacket18
	DECFSZ     R12, 1
	GOTO       L_txPacket18
	NOP
	NOP
;MyProject.c,159 :: 		while( CD == 1 );
L_txPacket19:
	BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_txPacket20
	GOTO       L_txPacket19
L_txPacket20:
;MyProject.c,161 :: 		PRW_UP=1;   //START TRANSMITTING
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,162 :: 		TX_EN=1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,163 :: 		TRX_CE=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,165 :: 		while(DR==0); //WAIT FOR TRASMIT
L_txPacket21:
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_txPacket22
	GOTO       L_txPacket21
L_txPacket22:
;MyProject.c,166 :: 		Delay_ms(5);
	MOVLW      7
	MOVWF      R12
	MOVLW      125
	MOVWF      R13
L_txPacket23:
	DECFSZ     R13, 1
	GOTO       L_txPacket23
	DECFSZ     R12, 1
	GOTO       L_txPacket23
;MyProject.c,168 :: 		TRX_CE=0; //ENTER IN STANDBY MODE
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;MyProject.c,169 :: 		TX_EN=1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;MyProject.c,170 :: 		PRW_UP=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;MyProject.c,172 :: 		}
L_end_txPacket:
	RETURN
; end of _txPacket

_Joystick:

;MyProject.c,174 :: 		void Joystick(){
;MyProject.c,176 :: 		if(KEY==0){
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_Joystick24
;MyProject.c,177 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_Joystick25:
	DECFSZ     R13, 1
	GOTO       L_Joystick25
	DECFSZ     R12, 1
	GOTO       L_Joystick25
	NOP
	NOP
;MyProject.c,178 :: 		txPacket(LIGHTS, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      176
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,179 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_Joystick26:
	DECFSZ     R13, 1
	GOTO       L_Joystick26
	DECFSZ     R12, 1
	GOTO       L_Joystick26
	NOP
	NOP
;MyProject.c,180 :: 		}
L_Joystick24:
;MyProject.c,182 :: 		Xaxis=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _Xaxis+0
	MOVF       R1, 0
	MOVWF      _Xaxis+1
;MyProject.c,183 :: 		Delay_ms(3);
	MOVLW      4
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_Joystick27:
	DECFSZ     R13, 1
	GOTO       L_Joystick27
	DECFSZ     R12, 1
	GOTO       L_Joystick27
	NOP
;MyProject.c,184 :: 		Yaxis=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _Yaxis+0
	MOVF       R1, 0
	MOVWF      _Yaxis+1
;MyProject.c,185 :: 		Delay_ms(3);
	MOVLW      4
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_Joystick28:
	DECFSZ     R13, 1
	GOTO       L_Joystick28
	DECFSZ     R12, 1
	GOTO       L_Joystick28
	NOP
;MyProject.c,187 :: 		if(Xaxis<200){ //RIGHT
	MOVLW      128
	XORWF      _Xaxis+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick70
	MOVLW      200
	SUBWF      _Xaxis+0, 0
L__Joystick70:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick29
;MyProject.c,188 :: 		Right=1;
	MOVLW      1
	MOVWF      _Right+0
;MyProject.c,189 :: 		Stop=0;
	CLRF       _Stop+0
;MyProject.c,191 :: 		LED=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,192 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_Joystick30:
	DECFSZ     R13, 1
	GOTO       L_Joystick30
	DECFSZ     R12, 1
	GOTO       L_Joystick30
	DECFSZ     R11, 1
	GOTO       L_Joystick30
	NOP
	NOP
;MyProject.c,194 :: 		}
L_Joystick29:
;MyProject.c,196 :: 		if(Xaxis>900){ //LEFT
	MOVLW      128
	XORLW      3
	MOVWF      R0
	MOVLW      128
	XORWF      _Xaxis+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick71
	MOVF       _Xaxis+0, 0
	SUBLW      132
L__Joystick71:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick31
;MyProject.c,197 :: 		Left=1;
	MOVLW      1
	MOVWF      _Left+0
;MyProject.c,198 :: 		Stop=0;
	CLRF       _Stop+0
;MyProject.c,200 :: 		LED=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,201 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_Joystick32:
	DECFSZ     R13, 1
	GOTO       L_Joystick32
	DECFSZ     R12, 1
	GOTO       L_Joystick32
	DECFSZ     R11, 1
	GOTO       L_Joystick32
	NOP
	NOP
;MyProject.c,203 :: 		}
L_Joystick31:
;MyProject.c,205 :: 		if(Yaxis<200){ //FORWARD
	MOVLW      128
	XORWF      _Yaxis+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick72
	MOVLW      200
	SUBWF      _Yaxis+0, 0
L__Joystick72:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick33
;MyProject.c,206 :: 		Forward=1;
	MOVLW      1
	MOVWF      _Forward+0
;MyProject.c,207 :: 		Stop=0;
	CLRF       _Stop+0
;MyProject.c,209 :: 		LED=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,210 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_Joystick34:
	DECFSZ     R13, 1
	GOTO       L_Joystick34
	DECFSZ     R12, 1
	GOTO       L_Joystick34
	DECFSZ     R11, 1
	GOTO       L_Joystick34
	NOP
	NOP
;MyProject.c,212 :: 		}
L_Joystick33:
;MyProject.c,214 :: 		if(Yaxis>900){ //BACKWARD
	MOVLW      128
	XORLW      3
	MOVWF      R0
	MOVLW      128
	XORWF      _Yaxis+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick73
	MOVF       _Yaxis+0, 0
	SUBLW      132
L__Joystick73:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick35
;MyProject.c,215 :: 		Backward=1;
	MOVLW      1
	MOVWF      _Backward+0
;MyProject.c,216 :: 		Stop=0;
	CLRF       _Stop+0
;MyProject.c,218 :: 		LED=1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,219 :: 		Delay_ms(500);
	MOVLW      3
	MOVWF      R11
	MOVLW      138
	MOVWF      R12
	MOVLW      85
	MOVWF      R13
L_Joystick36:
	DECFSZ     R13, 1
	GOTO       L_Joystick36
	DECFSZ     R12, 1
	GOTO       L_Joystick36
	DECFSZ     R11, 1
	GOTO       L_Joystick36
	NOP
	NOP
;MyProject.c,221 :: 		}
L_Joystick35:
;MyProject.c,223 :: 		if((Xaxis<600 && Xaxis>400) && (Yaxis<600 && Yaxis>400)){
	MOVLW      128
	XORWF      _Xaxis+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      2
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick74
	MOVLW      88
	SUBWF      _Xaxis+0, 0
L__Joystick74:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick43
	MOVLW      128
	XORLW      1
	MOVWF      R0
	MOVLW      128
	XORWF      _Xaxis+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick75
	MOVF       _Xaxis+0, 0
	SUBLW      144
L__Joystick75:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick43
L__Joystick64:
	MOVLW      128
	XORWF      _Yaxis+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      2
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick76
	MOVLW      88
	SUBWF      _Yaxis+0, 0
L__Joystick76:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick43
	MOVLW      128
	XORLW      1
	MOVWF      R0
	MOVLW      128
	XORWF      _Yaxis+1, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Joystick77
	MOVF       _Yaxis+0, 0
	SUBLW      144
L__Joystick77:
	BTFSC      STATUS+0, 0
	GOTO       L_Joystick43
L__Joystick63:
L__Joystick62:
;MyProject.c,224 :: 		Stop=1;
	MOVLW      1
	MOVWF      _Stop+0
;MyProject.c,225 :: 		Right=0;
	CLRF       _Right+0
;MyProject.c,226 :: 		Left=0;
	CLRF       _Left+0
;MyProject.c,227 :: 		Forward=0;
	CLRF       _Forward+0
;MyProject.c,228 :: 		Backward=0;
	CLRF       _Backward+0
;MyProject.c,230 :: 		LED=0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;MyProject.c,231 :: 		}
L_Joystick43:
;MyProject.c,233 :: 		}
L_end_Joystick:
	RETURN
; end of _Joystick

_SendDirections:

;MyProject.c,235 :: 		void SendDirections(){
;MyProject.c,237 :: 		if(Forward==1){
	MOVF       _Forward+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_SendDirections44
;MyProject.c,238 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections45:
	DECFSZ     R13, 1
	GOTO       L_SendDirections45
	DECFSZ     R12, 1
	GOTO       L_SendDirections45
	NOP
	NOP
;MyProject.c,239 :: 		txPacket(FORWARD, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      32
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,240 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections46:
	DECFSZ     R13, 1
	GOTO       L_SendDirections46
	DECFSZ     R12, 1
	GOTO       L_SendDirections46
	NOP
	NOP
;MyProject.c,242 :: 		Forward=0;
	CLRF       _Forward+0
;MyProject.c,243 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,244 :: 		}
L_SendDirections44:
;MyProject.c,246 :: 		if(Backward==1 ){
	MOVF       _Backward+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_SendDirections47
;MyProject.c,247 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections48:
	DECFSZ     R13, 1
	GOTO       L_SendDirections48
	DECFSZ     R12, 1
	GOTO       L_SendDirections48
	NOP
	NOP
;MyProject.c,248 :: 		txPacket(BACKWARD, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      64
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,249 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections49:
	DECFSZ     R13, 1
	GOTO       L_SendDirections49
	DECFSZ     R12, 1
	GOTO       L_SendDirections49
	NOP
	NOP
;MyProject.c,251 :: 		Backward=0;
	CLRF       _Backward+0
;MyProject.c,252 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,253 :: 		}
L_SendDirections47:
;MyProject.c,255 :: 		if(Left==1 ){
	MOVF       _Left+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_SendDirections50
;MyProject.c,256 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections51:
	DECFSZ     R13, 1
	GOTO       L_SendDirections51
	DECFSZ     R12, 1
	GOTO       L_SendDirections51
	NOP
	NOP
;MyProject.c,257 :: 		txPacket(LEFT, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      128
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,258 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections52:
	DECFSZ     R13, 1
	GOTO       L_SendDirections52
	DECFSZ     R12, 1
	GOTO       L_SendDirections52
	NOP
	NOP
;MyProject.c,260 :: 		Left=0;
	CLRF       _Left+0
;MyProject.c,261 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,262 :: 		}
L_SendDirections50:
;MyProject.c,264 :: 		if(Right==1 ){
	MOVF       _Right+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_SendDirections53
;MyProject.c,265 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections54:
	DECFSZ     R13, 1
	GOTO       L_SendDirections54
	DECFSZ     R12, 1
	GOTO       L_SendDirections54
	NOP
	NOP
;MyProject.c,266 :: 		txPacket(RIGHT, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      96
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,267 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections55:
	DECFSZ     R13, 1
	GOTO       L_SendDirections55
	DECFSZ     R12, 1
	GOTO       L_SendDirections55
	NOP
	NOP
;MyProject.c,269 :: 		Right=0;
	CLRF       _Right+0
;MyProject.c,270 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,271 :: 		}
L_SendDirections53:
;MyProject.c,273 :: 		if(Stop==1 ){
	MOVF       _Stop+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_SendDirections56
;MyProject.c,274 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections57:
	DECFSZ     R13, 1
	GOTO       L_SendDirections57
	DECFSZ     R12, 1
	GOTO       L_SendDirections57
	NOP
	NOP
;MyProject.c,275 :: 		txPacket(STOP, 0xAB, 0xBC, 0x5F, 0x18);
	MOVLW      160
	MOVWF      FARG_txPacket_packet0+0
	MOVLW      171
	MOVWF      FARG_txPacket_ad0+0
	MOVLW      188
	MOVWF      FARG_txPacket_ad1+0
	MOVLW      95
	MOVWF      FARG_txPacket_ad2+0
	MOVLW      24
	MOVWF      FARG_txPacket_ad3+0
	CALL       _txPacket+0
;MyProject.c,276 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12
	MOVLW      251
	MOVWF      R13
L_SendDirections58:
	DECFSZ     R13, 1
	GOTO       L_SendDirections58
	DECFSZ     R12, 1
	GOTO       L_SendDirections58
	NOP
	NOP
;MyProject.c,278 :: 		Stop=0;
	CLRF       _Stop+0
;MyProject.c,279 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,280 :: 		}
L_SendDirections56:
;MyProject.c,282 :: 		}
L_end_SendDirections:
	RETURN
; end of _SendDirections

_main:

;MyProject.c,284 :: 		void main() {
;MyProject.c,286 :: 		PortInitialization();
	CALL       _PortInitialization+0
;MyProject.c,287 :: 		readConfigRegister();
	CALL       _readConfigRegister+0
;MyProject.c,288 :: 		InitNRF(0x92,0xC5,0xA6,0xB0);
	MOVLW      146
	MOVWF      FARG_InitNRF_nRFAddress0+0
	MOVLW      197
	MOVWF      FARG_InitNRF_nRFAddress1+0
	MOVLW      166
	MOVWF      FARG_InitNRF_nRFAddress2+0
	MOVLW      176
	MOVWF      FARG_InitNRF_nRFAddress3+0
	CALL       _InitNRF+0
;MyProject.c,290 :: 		while(1){
L_main59:
;MyProject.c,292 :: 		Joystick();
	CALL       _Joystick+0
;MyProject.c,293 :: 		if(flag == 0) {
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main61
;MyProject.c,294 :: 		SendDirections();
	CALL       _SendDirections+0
;MyProject.c,295 :: 		}
L_main61:
;MyProject.c,296 :: 		flag=0;
	CLRF       _flag+0
;MyProject.c,297 :: 		}
	GOTO       L_main59
;MyProject.c,299 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
