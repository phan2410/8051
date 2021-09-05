//24Mhz crystal => 2Mhz tick for timer (machine cycle=12 x clock cycle)
#include <AT892051.H>
/********Khai bao chan giao tiep************/
#define LCD_RS P3_7
#define LCD_RW P1_2
#define LCD_EN P1_3
#define LCD_D4 P1_4
#define LCD_D5 P1_5
#define LCD_D6 P1_6
#define LCD_D7 P1_7
unsigned n5,n4,n3,n2,n1,n0, delay, even;
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

/*************************interrupt timer 0****************************/
void tmr0isr() interrupt 1{
	if(--delay==0){
		if (!P3_4) P3_4=1;
		delay=40;
		TR0=0;
	}
}
/*************************external interrupt 0****************************/
void extint0() interrupt 0{
	if (P3_4){
		P3_4=0;
		TR0=1;
		if (++even==2){
				even=0;
						if (++n0==10){
							n0=0;
							if(++n1==10){
								n1=0;
								if(++n2==10){
									n2=0;
									if(++n3==10){
										n3=0;
										if(++n4==10){
											n4=0;
											if(++n5==10){
												n5=0;
											}
										}
									}
								}
							}
						}
		}
	}
}
/******************Ctr chinh**************************/
void main(){
        LCD_Init();//Khoi tao LCD
				delay_ms(1000);
        LCD_Puts("An To Present");//Gui chuoi len LCD
        delay_ms(1000);
        LCD_Clear();//Xoa man hinh
        LCD_Gotoxy(0,0);//Tro toi vi tri
        LCD_Puts("Test LCD.......");
        delay_ms(1000);
        LCD_Gotoxy(0,1);//Tro toi vi tri
        LCD_Puts("OK!!!!");
				delay_ms(1000);
				EA=1;
				ET0=1;
				IT0=1;
				TMOD=0x02;
				TH0=6;
				TL0=6;
				delay=40;
				LCD_Clear();
				delay_ms(300);
				LCD_Puts("Round: ");
				EX0=1;
        while(1){
					LCD_Gotoxy(6,0);
					LCD_PutChar('0'+n5);
					LCD_PutChar('0'+n4);
					LCD_PutChar('0'+n3);
					LCD_PutChar('0'+n2);
					LCD_PutChar('0'+n1);
					LCD_PutChar('0'+n0);
				}
}