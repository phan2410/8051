#define __SFR_OFFSET 0

; #include "avr/io.h"

.global main

main:
  sbi   4, 4     ; Set PB5-pin12(Buzzer) as output

set_note_A6:            ; f = 1760.0 Hz
  ldi r29, hi8(2269)    ; 1/1760.0 = t(on<->off) => 1/1760.0 = (r29r28*4 + 14)/16M
  ldi r28, lo8(2269)    ; => r29r28 = (16M/1760.0-14)/4 = 2269.2272727272725

loop:

  sbi 5, 4                  ; set HIGH - 2 cycles
  call delay_logic_change   ;  r29r28*4 + 12
  cbi 5, 4                  ; set LOW  - 2 cycles
  call delay_logic_change   ;  r29r28*4 + 12

  jmp   loop

delay_logic_change:   ; cycles = r29r28*4 + 8
  movw r30, r28   ; 1 cycle
  3:                ; r31r30*(2+2) + (2+1) + 4 = r31r30*4 + 7
    sbiw    r30, 1  ; 2 cycles
    brne    3b      ; 2 cycles
  ret             ; 4 cycles
