#include <AT89X52.H>
unsigned loopcount;
void tmr0isr() interrupt TF0_VECTOR{
	if (--loopcount==0){
		loopcount=2;
		P1_2=~P1_2;
	}
}
void main(void){
	EA=1;
	ET0=1;
	TMOD=0x02;
	TH0=6;
	TL0=6;
	loopcount=2;
	TR0=1;
	while(1);
}