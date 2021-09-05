#include <AT89X52.H>
unsigned loopcount0, speedlimit, delay;
void tmr0isr() interrupt TF0_VECTOR{
	if (--loopcount0==0){
		P1_2=~P1_2;
		loopcount0=3*speedlimit;
	}else if (loopcount0==speedlimit){
		P1_3=P1_2;
	}else if (loopcount0==2*speedlimit){
		P1_4=~P1_2;
	}
}
void main(void){
	P1=0;
	EA=1;
	ET0=1;
	TMOD=0x02;
	TH0=9;
	TL0=9;
	for (delay=0;delay<65535;delay++){};//delay for stablility
	speedlimit=111;
	loopcount0=3*speedlimit;
	TR0=1;
	delay=5000;
	while(1){
		if(--delay==0){
			if (speedlimit>70) delay=7000;
			else if (speedlimit>50) delay=17000;
			else if (speedlimit>30) delay=30000;
			else if (speedlimit>20) delay=49000;
			else if (speedlimit>13) delay=55000;
			else delay=65535;
			if (speedlimit>5) --speedlimit;
		}
	}
}