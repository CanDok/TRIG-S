#line 1 "C:/Users/windows 10/Desktop/pic projeler/Multichannel_trig/Embed_Software/TRIGS.c"
#line 8 "C:/Users/windows 10/Desktop/pic projeler/Multichannel_trig/Embed_Software/TRIGS.c"
unsigned char t[10];
unsigned char a[5];
unsigned int dl =100;
unsigned int wd =100;
const code unsigned char Const_Text1[] = "CH1 Trigd";
const code unsigned char Const_Text2[] = "CH2 Trigd";
const code unsigned char Const_Text3[] = "CH3 Trigd";
const code unsigned char Const_Text4[] = "CH4 Trigd";
const code unsigned char Const_Text5[] = "CH5 Trigd";
const code unsigned char Const_Text6[] = "CH6 Trigd";
const code unsigned char Const_Text7[] = "CH7 Trigd";
const code unsigned char Const_Text8[] = "CH8 Trigd";
const code unsigned char Const_Text9[] = "TRIG-S v01";
const code unsigned char Const_Text10[] = "Width set to: ";
const code unsigned char Const_Text11[] = "Delay set to: ";

char* codetxt_to_ramtxt(const char* ctxt){
 static char txt[20];
 char i;
 for(i =0; txt[i] = ctxt[i]; i++);
 return txt;
}

void main() {

 portc = 0;
 portd = 0;
 porta = 0;
 portb = 0;

 TRISA=0;
 TRISB=1;
 TRISC=0;
 TRISD=0;


 UART1_Init(9600);
 delay_ms(100);
 UART1_Write_Text(codetxt_to_ramtxt(Const_Text9));
 UART1_Write(10);
 UART1_Write(13);

 PORTD.RD2=1;
 delay_ms(50);
 PORTD.RD2=0;
 delay_ms(100);
 PORTD.RD2=1;
 delay_ms(100);
 PORTD.RD2=0;
 delay_ms(150);
 PORTD.RD2=1;
 delay_ms(150);
 PORTD.RD2=0;

while(1){

 if (UART1_Data_Ready() == 1) {
 UART1_Read_Text(t,"?",255);

if((t[2] == 'S')&(t[3] == 'S')&(t[4] == 'M')&(t[5] == 'T')&(t[6] == 'R')&(t[7] == 'G')&(t[8] == 'C')){

 if(t[9] == '0'){
portd.rd0 = 1;
Vdelay_ms(wd);
portd.rd0 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text1));
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }
 if(t[9] == '1'){
 portd.rd1 = 1;
 Vdelay_ms(wd);
 portd.rd1 = 0;
 UART1_Write_Text(codetxt_to_ramtxt(Const_Text2));
 UART1_Write(10);
 UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }
 if(t[9] == '2'){
portd.rd2 = 1;
Vdelay_ms(wd);
portd.rd2 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text3));
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }
 if(t[9] == '3'){
 portd.rd3 = 1;
Vdelay_ms(wd);
portd.rd3 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text4));
 UART1_Write(10);
 UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }
 if(t[9] == '4'){
portd.rd4 = 1;
Vdelay_ms(wd);
portd.rd4 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text5));
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }

 if(t[9] == '5'){
portd.rd5 = 1;
Vdelay_ms(wd);
portd.rd5 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text6));
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }

 if(t[9] == '6'){
portd.rd6 = 1;
Vdelay_ms(wd);
portd.rd6 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text7));
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
 }

 if(t[9] == '7'){
portd.rd7 = 1;
Vdelay_ms(wd);
portd.rd7 = 0;
UART1_Write_Text(codetxt_to_ramtxt(Const_Text8));
UART1_Write(10);
UART1_Write(13);
t[2]==' ';
t[3]==' ';
t[4]==' ';
t[5]==' ';
t[6]==' ';
t[7]==' ';
t[8]==' ';
t[9]==' ';
 }
 }


 if((t[2] == 'I')&(t[3] == 'D')&(t[4] == 'N')&(t[5] == '/')&(t[6] == '*')){
UART1_Write_Text(codetxt_to_ramtxt(Const_Text9));
UART1_Write(10);
UART1_Write(13);
t[2]==' ';
t[3]==' ';
t[4]==' ';
t[5]==' ';
t[6]==' ';
t[7]==' ';
t[8]==' ';
t[9]==' ';
}


if((t[6] == 'S')&(t[7] == 'E')&(t[8] == 'T')){
if((t[9] == 'W')&(t[10] == 'D')){
UART1_Write_Text(codetxt_to_ramtxt(Const_Text10));
wd = atoi(&t[2]);
IntToStr(wd,a);
UART1_Write_Text(a);
UART1_Write(10);
UART1_Write(13);
 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
}
 if((t[9] == 'D')&(t[10] == 'L')){
UART1_Write_Text(codetxt_to_ramtxt(Const_Text11));


UART1_Write_Text(a);
UART1_Write(10);
UART1_Write(13);


 t[2]==' ';
 t[3]==' ';
 t[4]==' ';
 t[5]==' ';
 t[6]==' ';
 t[7]==' ';
 t[8]==' ';
 t[9]==' ';
}
}
}
}
}
