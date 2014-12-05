
_CustomChar:

;MyProject.c,27 :: 		void CustomChar(char pos_row, char pos_char) {
;MyProject.c,29 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,30 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVLW      _character+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_character+0)
	MOVWF      FSR0H
	MOVF       CustomChar_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;MyProject.c,31 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,32 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,33 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_TemperatureRead:

;MyProject.c,35 :: 		TemperatureRead(){
;MyProject.c,36 :: 		Temperature=ADC_Read(13);
	MOVLW      13
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0, 0
	MOVWF      _Temperature+0
	MOVF       R1, 0
	MOVWF      _Temperature+1
	MOVF       R2, 0
	MOVWF      _Temperature+2
	MOVF       R3, 0
	MOVWF      _Temperature+3
;MyProject.c,37 :: 		Delay_ms(3);
	MOVLW      4
	MOVWF      R12
	MOVLW      228
	MOVWF      R13
L_TemperatureRead3:
	DECFSZ     R13, 1
	GOTO       L_TemperatureRead3
	DECFSZ     R12, 1
	GOTO       L_TemperatureRead3
	NOP
;MyProject.c,38 :: 		Temperature=(Temperature*5.0)/1024;
	MOVF       _Temperature+0, 0
	MOVWF      R0
	MOVF       _Temperature+1, 0
	MOVWF      R1
	MOVF       _Temperature+2, 0
	MOVWF      R2
	MOVF       _Temperature+3, 0
	MOVWF      R3
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      32
	MOVWF      R6
	MOVLW      129
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      137
	MOVWF      R7
	CALL       _Div_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _Temperature+0
	MOVF       R1, 0
	MOVWF      _Temperature+1
	MOVF       R2, 0
	MOVWF      _Temperature+2
	MOVF       R3, 0
	MOVWF      _Temperature+3
;MyProject.c,39 :: 		Temperature=Temperature*100;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      72
	MOVWF      R6
	MOVLW      133
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _Temperature+0
	MOVF       R1, 0
	MOVWF      _Temperature+1
	MOVF       R2, 0
	MOVWF      _Temperature+2
	MOVF       R3, 0
	MOVWF      _Temperature+3
;MyProject.c,41 :: 		}
L_end_TemperatureRead:
	RETURN
; end of _TemperatureRead

_LCD:

;MyProject.c,43 :: 		LCD(){
;MyProject.c,44 :: 		Lcd_Out(1,1,InitialText1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _InitialText1+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_InitialText1+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,45 :: 		TemperatureRead();
	CALL       _TemperatureRead+0
;MyProject.c,46 :: 		IntToStr(Temperature,txt);
	MOVF       _Temperature+0, 0
	MOVWF      R0
	MOVF       _Temperature+1, 0
	MOVWF      R1
	MOVF       _Temperature+2, 0
	MOVWF      R2
	MOVF       _Temperature+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	MOVLW      hi_addr(_txt+0)
	MOVWF      FARG_IntToStr_output+1
	CALL       _IntToStr+0
;MyProject.c,47 :: 		Lcd_Out(2,3,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_txt+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,48 :: 		CustomChar(2, 9);
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      9
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;MyProject.c,49 :: 		Lcd_Out(2,10,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_MyProject+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,50 :: 		Lcd_Out(2,1,InitialText2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _InitialText2+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_InitialText2+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,51 :: 		}
L_end_LCD:
	RETURN
; end of _LCD

_PortInit:

;MyProject.c,54 :: 		PortInit(){
;MyProject.c,56 :: 		TRISA0_bit=0;
	BCF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;MyProject.c,57 :: 		TRISB5_bit=1;
	BSF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;MyProject.c,59 :: 		ANSELA=0;
	CLRF       ANSELA+0
;MyProject.c,60 :: 		ANSELB=0;
	CLRF       ANSELB+0
;MyProject.c,61 :: 		ANSELB.F5=1;
	BSF        ANSELB+0, 5
;MyProject.c,63 :: 		TMR0CS_bit=0;
	BCF        TMR0CS_bit+0, BitPos(TMR0CS_bit+0)
;MyProject.c,64 :: 		TMR0SE_bit=0;
	BCF        TMR0SE_bit+0, BitPos(TMR0SE_bit+0)
;MyProject.c,65 :: 		PSA_bit=0;
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;MyProject.c,66 :: 		PS0_bit=1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;MyProject.c,67 :: 		PS1_bit=1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;MyProject.c,68 :: 		PS2_bit=1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;MyProject.c,70 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,71 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;MyProject.c,72 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,73 :: 		TMR0=0;
	CLRF       TMR0+0
;MyProject.c,75 :: 		Delay_ms(100);
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
;MyProject.c,76 :: 		Lcd_Init(); //Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,77 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12
	MOVLW      221
	MOVWF      R13
L_PortInit5:
	DECFSZ     R13, 1
	GOTO       L_PortInit5
	DECFSZ     R12, 1
	GOTO       L_PortInit5
	NOP
	NOP
;MyProject.c,78 :: 		Lcd_Cmd(_LCD_CLEAR); //Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,79 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,81 :: 		BACKLIGHT=1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,83 :: 		}
L_end_PortInit:
	RETURN
; end of _PortInit

_interrupt:
	CLRF       PCLATH+0
	CLRF       STATUS+0

;MyProject.c,85 :: 		void interrupt(){
;MyProject.c,87 :: 		if(TMR0IF_bit==1){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt6
;MyProject.c,88 :: 		tmr++;
	INCF       _tmr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tmr+1, 1
;MyProject.c,89 :: 		if(tmr==(15*30)){
	MOVF       _tmr+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVLW      194
	XORWF      _tmr+0, 0
L__interrupt19:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
;MyProject.c,90 :: 		BACKLIGHT=0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;MyProject.c,91 :: 		tmr=0;
	CLRF       _tmr+0
	CLRF       _tmr+1
;MyProject.c,92 :: 		GIE_bit=0;
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,93 :: 		}
L_interrupt7:
;MyProject.c,94 :: 		TMR0IF_bit=0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;MyProject.c,95 :: 		}
L_interrupt6:
;MyProject.c,97 :: 		}
L_end_interrupt:
L__interrupt18:
	RETFIE     %s
; end of _interrupt

_main:

;MyProject.c,100 :: 		void main() {
;MyProject.c,102 :: 		PortInit();
	CALL       _PortInit+0
;MyProject.c,103 :: 		LCD();
	CALL       _LCD+0
;MyProject.c,105 :: 		while(1){
L_main8:
;MyProject.c,107 :: 		IntToStr(Temperature,txt);
	MOVF       _Temperature+0, 0
	MOVWF      R0
	MOVF       _Temperature+1, 0
	MOVWF      R1
	MOVF       _Temperature+2, 0
	MOVWF      R2
	MOVF       _Temperature+3, 0
	MOVWF      R3
	CALL       _Double2Int+0
	MOVF       R0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	MOVLW      hi_addr(_txt+0)
	MOVWF      FARG_IntToStr_output+1
	CALL       _IntToStr+0
;MyProject.c,108 :: 		Lcd_Out(2,3,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_txt+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,109 :: 		CustomChar(2, 9);
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      9
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;MyProject.c,110 :: 		Lcd_Out(2,10,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr2_MyProject+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,111 :: 		Lcd_Out(2,1,InitialText2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _InitialText2+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_InitialText2+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,115 :: 		delay_ms(5000);
	MOVLW      26
	MOVWF      R11
	MOVLW      94
	MOVWF      R12
	MOVLW      110
	MOVWF      R13
L_main10:
	DECFSZ     R13, 1
	GOTO       L_main10
	DECFSZ     R12, 1
	GOTO       L_main10
	DECFSZ     R11, 1
	GOTO       L_main10
	NOP
;MyProject.c,116 :: 		fl=!fl;
	MOVLW
	XORWF      _fl+0, 1
;MyProject.c,117 :: 		if(fl==1){
	BTFSS      _fl+0, BitPos(_fl+0)
	GOTO       L_main11
;MyProject.c,118 :: 		Lcd_Out(1,1,InitialText3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _InitialText3+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_InitialText3+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,119 :: 		}
L_main11:
;MyProject.c,120 :: 		if(fl==0){
	BTFSC      _fl+0, BitPos(_fl+0)
	GOTO       L_main12
;MyProject.c,121 :: 		Lcd_Out(1,1,InitialText1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _InitialText1+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_InitialText1+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,122 :: 		}
L_main12:
;MyProject.c,125 :: 		}
	GOTO       L_main8
;MyProject.c,127 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
