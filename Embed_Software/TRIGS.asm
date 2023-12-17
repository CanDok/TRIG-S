
_codetxt_to_ramtxt:

;TRIGS.c,24 :: 		char* codetxt_to_ramtxt(const char* ctxt){
;TRIGS.c,27 :: 		for(i =0; txt[i] = ctxt[i]; i++);
	CLRF       R3+0
L_codetxt_to_ramtxt0:
	MOVF       R3+0, 0
	ADDLW      codetxt_to_ramtxt_txt_L0+0
	MOVWF      R2+0
	MOVF       R3+0, 0
	ADDWF      FARG_codetxt_to_ramtxt_ctxt+0, 0
	MOVWF      R0+0
	MOVF       FARG_codetxt_to_ramtxt_ctxt+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_codetxt_to_ramtxt1
	INCF       R3+0, 1
	GOTO       L_codetxt_to_ramtxt0
L_codetxt_to_ramtxt1:
;TRIGS.c,28 :: 		return txt;
	MOVLW      codetxt_to_ramtxt_txt_L0+0
	MOVWF      R0+0
;TRIGS.c,29 :: 		}
L_end_codetxt_to_ramtxt:
	RETURN
; end of _codetxt_to_ramtxt

_main:

;TRIGS.c,31 :: 		void main() {
;TRIGS.c,33 :: 		portc = 0;
	CLRF       PORTC+0
;TRIGS.c,34 :: 		portd = 0;
	CLRF       PORTD+0
;TRIGS.c,35 :: 		porta = 0;
	CLRF       PORTA+0
;TRIGS.c,36 :: 		portb = 0;
	CLRF       PORTB+0
;TRIGS.c,38 :: 		TRISA=0;
	CLRF       TRISA+0
;TRIGS.c,39 :: 		TRISB=1;
	MOVLW      1
	MOVWF      TRISB+0
;TRIGS.c,40 :: 		TRISC=0;
	CLRF       TRISC+0
;TRIGS.c,41 :: 		TRISD=0;
	CLRF       TRISD+0
;TRIGS.c,44 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;TRIGS.c,45 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;TRIGS.c,46 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text9));
	MOVLW      _Const_Text9+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text9+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,47 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,48 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,50 :: 		PORTD.RD2=1;
	BSF        PORTD+0, 2
;TRIGS.c,51 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;TRIGS.c,52 :: 		PORTD.RD2=0;
	BCF        PORTD+0, 2
;TRIGS.c,53 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;TRIGS.c,54 :: 		PORTD.RD2=1;
	BSF        PORTD+0, 2
;TRIGS.c,55 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;TRIGS.c,56 :: 		PORTD.RD2=0;
	BCF        PORTD+0, 2
;TRIGS.c,57 :: 		delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;TRIGS.c,58 :: 		PORTD.RD2=1;
	BSF        PORTD+0, 2
;TRIGS.c,59 :: 		delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;TRIGS.c,60 :: 		PORTD.RD2=0;
	BCF        PORTD+0, 2
;TRIGS.c,62 :: 		while(1){
L_main9:
;TRIGS.c,64 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;TRIGS.c,65 :: 		UART1_Read_Text(t,"?",255);
	MOVLW      _t+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr1_TRIGS+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      255
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;TRIGS.c,67 :: 		if((t[2] == 'S')&(t[3] == 'S')&(t[4] == 'M')&(t[5] == 'T')&(t[6] == 'R')&(t[7] == 'G')&(t[8] == 'C')){
	MOVF       _t+2, 0
	XORLW      83
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _t+3, 0
	XORLW      83
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+4, 0
	XORLW      77
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+5, 0
	XORLW      84
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+6, 0
	XORLW      82
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+7, 0
	XORLW      71
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+8, 0
	XORLW      67
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;TRIGS.c,69 :: 		if(t[9] == '0'){
	MOVF       _t+9, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;TRIGS.c,70 :: 		portd.rd0 = 1;
	BSF        PORTD+0, 0
;TRIGS.c,71 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,72 :: 		portd.rd0 = 0;
	BCF        PORTD+0, 0
;TRIGS.c,73 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text1));
	MOVLW      _Const_Text1+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text1+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,74 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,75 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,84 :: 		}
L_main13:
;TRIGS.c,85 :: 		if(t[9] == '1'){
	MOVF       _t+9, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;TRIGS.c,86 :: 		portd.rd1 = 1;
	BSF        PORTD+0, 1
;TRIGS.c,87 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,88 :: 		portd.rd1 = 0;
	BCF        PORTD+0, 1
;TRIGS.c,89 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text2));
	MOVLW      _Const_Text2+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text2+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,90 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,91 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,100 :: 		}
L_main14:
;TRIGS.c,101 :: 		if(t[9] == '2'){
	MOVF       _t+9, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;TRIGS.c,102 :: 		portd.rd2 = 1;
	BSF        PORTD+0, 2
;TRIGS.c,103 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,104 :: 		portd.rd2 = 0;
	BCF        PORTD+0, 2
;TRIGS.c,105 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text3));
	MOVLW      _Const_Text3+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text3+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,106 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,107 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,116 :: 		}
L_main15:
;TRIGS.c,117 :: 		if(t[9] == '3'){
	MOVF       _t+9, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;TRIGS.c,118 :: 		portd.rd3 = 1;
	BSF        PORTD+0, 3
;TRIGS.c,119 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,120 :: 		portd.rd3 = 0;
	BCF        PORTD+0, 3
;TRIGS.c,121 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text4));
	MOVLW      _Const_Text4+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text4+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,122 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,123 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,132 :: 		}
L_main16:
;TRIGS.c,133 :: 		if(t[9] == '4'){
	MOVF       _t+9, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;TRIGS.c,134 :: 		portd.rd4 = 1;
	BSF        PORTD+0, 4
;TRIGS.c,135 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,136 :: 		portd.rd4 = 0;
	BCF        PORTD+0, 4
;TRIGS.c,137 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text5));
	MOVLW      _Const_Text5+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text5+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,138 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,139 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,148 :: 		}
L_main17:
;TRIGS.c,150 :: 		if(t[9] == '5'){
	MOVF       _t+9, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;TRIGS.c,151 :: 		portd.rd5 = 1;
	BSF        PORTD+0, 5
;TRIGS.c,152 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,153 :: 		portd.rd5 = 0;
	BCF        PORTD+0, 5
;TRIGS.c,154 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text6));
	MOVLW      _Const_Text6+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text6+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,155 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,156 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,165 :: 		}
L_main18:
;TRIGS.c,167 :: 		if(t[9] == '6'){
	MOVF       _t+9, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;TRIGS.c,168 :: 		portd.rd6 = 1;
	BSF        PORTD+0, 6
;TRIGS.c,169 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,170 :: 		portd.rd6 = 0;
	BCF        PORTD+0, 6
;TRIGS.c,171 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text7));
	MOVLW      _Const_Text7+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text7+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,172 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,173 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,182 :: 		}
L_main19:
;TRIGS.c,184 :: 		if(t[9] == '7'){
	MOVF       _t+9, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;TRIGS.c,185 :: 		portd.rd7 = 1;
	BSF        PORTD+0, 7
;TRIGS.c,186 :: 		Vdelay_ms(wd);
	MOVF       _wd+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _wd+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;TRIGS.c,187 :: 		portd.rd7 = 0;
	BCF        PORTD+0, 7
;TRIGS.c,188 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text8));
	MOVLW      _Const_Text8+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text8+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,189 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,190 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,199 :: 		}
L_main20:
;TRIGS.c,200 :: 		}
L_main12:
;TRIGS.c,203 :: 		if((t[2] == 'I')&(t[3] == 'D')&(t[4] == 'N')&(t[5] == '/')&(t[6] == '*')){
	MOVF       _t+2, 0
	XORLW      73
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _t+3, 0
	XORLW      68
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+4, 0
	XORLW      78
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+5, 0
	XORLW      47
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+6, 0
	XORLW      42
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;TRIGS.c,204 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text9));
	MOVLW      _Const_Text9+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text9+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,205 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,206 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,215 :: 		}
L_main21:
;TRIGS.c,218 :: 		if((t[6] == 'S')&(t[7] == 'E')&(t[8] == 'T')){
	MOVF       _t+6, 0
	XORLW      83
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _t+7, 0
	XORLW      69
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ANDWF      R1+0, 1
	MOVF       _t+8, 0
	XORLW      84
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main22
;TRIGS.c,219 :: 		if((t[9] == 'W')&(t[10] == 'D')){
	MOVF       _t+9, 0
	XORLW      87
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _t+10, 0
	XORLW      68
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main23
;TRIGS.c,220 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text10));
	MOVLW      _Const_Text10+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text10+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,221 :: 		wd = atoi(&t[2]);
	MOVLW      _t+2
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _wd+0
	MOVF       R0+1, 0
	MOVWF      _wd+1
;TRIGS.c,222 :: 		IntToStr(wd,a);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _a+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;TRIGS.c,223 :: 		UART1_Write_Text(a);
	MOVLW      _a+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,224 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,225 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,234 :: 		}
L_main23:
;TRIGS.c,235 :: 		if((t[9] == 'D')&(t[10] == 'L')){
	MOVF       _t+9, 0
	XORLW      68
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _t+10, 0
	XORLW      76
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main24
;TRIGS.c,236 :: 		UART1_Write_Text(codetxt_to_ramtxt(Const_Text11));
	MOVLW      _Const_Text11+0
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+0
	MOVLW      hi_addr(_Const_Text11+0)
	MOVWF      FARG_codetxt_to_ramtxt_ctxt+1
	CALL       _codetxt_to_ramtxt+0
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,239 :: 		UART1_Write_Text(a);
	MOVLW      _a+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TRIGS.c,240 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,241 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TRIGS.c,252 :: 		}
L_main24:
;TRIGS.c,253 :: 		}
L_main22:
;TRIGS.c,254 :: 		}
L_main11:
;TRIGS.c,255 :: 		}
	GOTO       L_main9
;TRIGS.c,256 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
