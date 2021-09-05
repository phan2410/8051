#include <AT89X52.H>
/********Khai bao chan giao tiep************/
#define LCD_RS P2_0
#define LCD_RW P2_1
#define LCD_EN P2_2
#define LCD_D4 P2_4
#define LCD_D5 P2_5
#define LCD_D6 P2_6
#define LCD_D7 P2_7
/********************************************/
unsigned tmr1loop, count1, rps1, d0, d1, d2, d3, d4;
double temp;
unsigned pass1;
/************************************/
void delay_us(unsigned int t){
        unsigned int i;
        for(i=0;i<t;i++);
}
void delay_ms(unsigned int t){
        unsigned int i,j;
        for(i=0;i<t;i++)
        for(j=0;j<125;j++);
}
/**************Ctr giao tiep LCD 16x2 4bit**********************/
void LCD_Enable(void){
        LCD_EN =1;
        delay_us(3);
        LCD_EN=0;
        delay_us(50);
}
//Ham Gui 4 Bit Du Lieu Ra LCD
void LCD_Send4Bit(unsigned char Data){
        LCD_D4=Data & 0x01;
        LCD_D5=(Data>>1)&1;
        LCD_D6=(Data>>2)&1;
        LCD_D7=(Data>>3)&1;
}
// Ham Gui 1 Lenh Cho LCD
void LCD_SendCommand(unsigned char command){
        LCD_Send4Bit(command >>4);/* Gui 4 bit cao */
        LCD_Enable();
        LCD_Send4Bit(command); /* Gui 4 bit thap*/
        LCD_Enable();
}
void LCD_Clear(){// Ham Xoa Man Hinh LCD
        LCD_SendCommand(0x01);
        delay_us(10);
}
// Ham Khoi Tao LCD
void LCD_Init(){
        LCD_Send4Bit(0x00);
        delay_ms(20);
        LCD_RS=0;
        LCD_RW=0;
        LCD_Send4Bit(0x03);
        LCD_Enable();
        delay_ms(5);
        LCD_Enable();
        delay_us(100);
        LCD_Enable();
        LCD_Send4Bit(0x02);
        LCD_Enable();
        LCD_SendCommand( 0x28 ); // giao thuc 4 bit, hien thi 2 hang, ki tu 5x8
        LCD_SendCommand( 0x0c); // cho phep hien thi man hinh
        LCD_SendCommand( 0x06 ); // tang ID, khong dich khung hinh
        LCD_SendCommand(0x01); // xoa toan bo khung hinh
}
void LCD_Gotoxy(unsigned char x, unsigned char y){
        unsigned char address;
        if(!y)address=(0x80+x);
        else address=(0xc0+x);
        delay_us(1000);
        LCD_SendCommand(address);
        delay_us(50);
}
void LCD_PutChar(unsigned char Data){//Ham Gui 1 Ki Tu
        LCD_RS=1;
        LCD_SendCommand(Data);
        LCD_RS=0 ;
}
void LCD_Puts (char *s){//Ham gui 1 chuoi ky tu
        while (*s){
                LCD_PutChar(*s);
                s++;
        }
}
/**************************RTOS****************************/

void extint0isr() interrupt IE0_VECTOR{
	if (!P3_2 && (pass1==0)){
		pass1=1;
	}
}
void extint1isr() interrupt IE1_VECTOR{
	if ((pass1==1) && !P3_3) {
		count1++;
		pass1=0;
	}
}
void tmr1isr() interrupt TF1_VECTOR{
	if (--tmr1loop==1){
		TH1=0x7B;
		TL1=0x90;
	}else if(tmr1loop ==0){
		temp = count1/12 + 0.5;
		rps1= temp/1;
		count1=0;
		tmr1loop=31;
	}
}
/******************Ctr chinh**************************/
void main(){
        LCD_Init();//Khoi tao LCD
        delay_ms(1000);
        LCD_Puts("Speed motor test !");//Gui chuoi len LCD
        delay_ms(1000);
        LCD_Clear();//Xoa man hinh
        LCD_Gotoxy(0,0);//Tro toi vi tri
        LCD_Puts("Process...");
        delay_ms(2000);
        LCD_Gotoxy(0,1);//Tro toi vi tri
        LCD_Puts("Start ...");
				IT0=1;//External interrupt 0 edge-triggered
				IT1=1;
				EA=1;
				ET1=1;
				EX1=1;
				EX0=1;			
				TMOD |= 0x10;
				TMOD &= 0x1F;
				delay_ms(1000);	
				LCD_Clear();
				delay_ms(300);
				LCD_Puts("Rps: ");
				tmr1loop=31;
				TR1=1;
        while(1){
					d4= rps1/10000;
					d3= (rps1%10000)/1000;
					d2= ((rps1%10000)%1000)/100;
					d1=(((rps1%10000)%1000)%100)/10;
					d0=(((rps1%10000)%1000)%100)%10;
					LCD_Gotoxy(5,0);
					LCD_PutChar('0'+d4);
					LCD_PutChar('0'+d3);
					LCD_PutChar('0'+d2);
					LCD_PutChar('0'+d1);
					LCD_PutChar('0'+d0);
				}
}
//THE END