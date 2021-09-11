#define __SFR_OFFSET 0

; #include "avr/io.h"

.global main

main:
  sbi   4, 5     ; Set PB5-pin13(LED) as output

loop:
  call blink_led
  jmp   loop

blink_led:

  sbi 5, 5  ; LED on
  call set_delay_led_200ms
  call delay_led
  cbi 5, 5  ; LED off
  call set_delay_led_1s
  call delay_led

  ; uncomment the following lines to alternate blinking patterns
  ; sbi 5, 5  ; LED on
  ; call set_delay_led_200ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_500ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_100ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_200ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_100ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_100ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_50ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_50ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_20ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_50ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_20ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_50ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_20ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_50ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_50ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_50ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_100ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_100ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_100ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_200ms
  ; call delay_led

  ; sbi 5, 5  ; LED on
  ; call set_delay_led_200ms
  ; call delay_led
  ; cbi 5, 5  ; LED off
  ; call set_delay_led_500ms
  ; call delay_led

  ret

set_delay_led_1s:
  ldi r27, hi8(80)  ; 16000000/200000=80
  ldi r26, lo8(80)
  ret

set_delay_led_100ms:
  ldi r27, hi8(8) 
  ldi r26, lo8(8)
  ret

set_delay_led_200ms:
  ldi r27, hi8(16) 
  ldi r26, lo8(16)
  ret

set_delay_led_500ms:
  ldi r27, hi8(40) 
  ldi r26, lo8(40)
  ret

set_delay_led_50ms:
  ldi r27, hi8(4) 
  ldi r26, lo8(4)
  ret

set_delay_led_20ms:
  ldi r27, hi8(2) 
  ldi r26, lo8(2)
  ret

delay_led:
  movw r30, r26
1:  ; ~ 50000*4 (=200000) cycles
  ldi   r29, hi8(50000)
  ldi   r28, lo8(50000)
2:  ; ~ 4 cycles
  sbiw    r28, 1
  brne    2b
  sbiw    r30, 1
  brne    1b
  ret
