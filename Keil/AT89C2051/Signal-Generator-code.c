//12Mhz crystal => 1Mhz tick for timer (machine cycle=12 x clock cycle), MAX 46,875KHz
#include <AT892051.H>
#include <stdlib.h>
unsigned tmr1loop,TH0value;
void tmr0isr(void) interrupt TF0_VECTOR {
	P3_7=~P3_7;
}
void tmr1isr(void) interrupt TF1_VECTOR {
	if(--tmr1loop==0){
		TH0=rand()%1000+100;
		tmr1loop=400;
	}
}
void main(void){
		P3_7=1;
		EA=1;
		ET0=1;
		ET1=1;
		TMOD=0x22;
		TL1=6;
		TH1=6;
		TL0=131;
		TH0=131;
		tmr1loop=400;
		TR1=1;
		TR0=1;
		srand(TH0);
		while(1);
}