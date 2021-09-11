  #define __SFR_OFFSET 0

  ; #include "avr/io.h"

  .global main

  main:
    sbi   4, 4     ; Set PB5-pin12(Buzzer) as output

  loop:

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_B6
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    call set_note_D6
    call play_note

    call set_note_F6
    call play_note

    call set_note_A6
    call play_note

    call set_note_B6
    call set_note_duration_1s
    call play_note

    call set_note_F6
    call play_note

    call set_note_As6
    call play_note

    call set_note_B6
    call play_note

    call set_note_C7
    call set_note_duration_1s
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_B6
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    call set_note_D6
    call play_note

    call set_note_F6
    call play_note

    call set_note_A6
    call play_note

    call set_note_B6
    call set_note_duration_1s
    call play_note

    call set_note_F6
    call play_note

    call set_note_C7
    call play_note

    call set_note_B6
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    call set_note_B6
    call play_note

    call set_note_C7
    call play_note

    call set_note_D7
    call play_note

    call set_note_E7
    call set_note_duration_1s
    call play_note

    call set_note_G6
    call play_note

    call set_note_F7
    call play_note

    call set_note_E7
    call play_note

    call set_note_D7
    call set_note_duration_1s
    call play_note

    call set_note_E6
    call play_note

    call set_note_E7
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call set_note_duration_1s
    call play_note

    call set_note_D6
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call play_note

    call set_note_B6
    call set_note_duration_1s
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_B6
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    call set_note_D6
    call play_note

    call set_note_F6
    call play_note

    call set_note_A6
    call play_note

    call set_note_B6
    call set_note_duration_1s
    call play_note

    call set_note_F6
    call play_note

    call set_note_A6
    call play_note

    call set_note_B6
    call play_note

    call set_note_C7
    call set_note_duration_1s
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_Ds7
    call play_note

    call set_note_E7
    call play_note

    call set_note_B6
    call play_note

    call set_note_D7
    call play_note

    call set_note_C7
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    call set_note_D6
    call play_note

    call set_note_F6
    call play_note

    call set_note_A6
    call play_note

    call set_note_B6
    call set_note_duration_1s
    call play_note

    call set_note_F6
    call play_note

    call set_note_C7
    call play_note

    call set_note_B6
    call play_note

    call set_note_A6
    call set_note_duration_1s
    call play_note

    jmp   loop

  set_note_duration_1s: ; hiccup: not possible to dynamically set duration time in an exact way,
    ldi r21, hi8(905)     ; due to indispensable dynamically division of word-length integer
    ldi r20, lo8(905)     ; t(play_note) = 1s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 1
    ret                 ; roughly, we take average value of all r29r28 is 2201.9623768291367 => r21r20 = 905.6333229466998

  set_note_As6:           ; f = 1864.66 Hz
    ldi r29, hi8(2141)    ; 1/1864.66 = t(on<->off) => 1/1864.66 = (r29r28*4 + 14)/16M
    ldi r28, lo8(2141)    ; => r29r28 = (16M/1864.66-14)/4 = 2141.6631932899295
    
    ldi r21, hi8(278)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(278)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 278.6333561932551
    
    ret

  set_note_Ds7:           ; f = 2489.02 Hz
    ldi r29, hi8(1603)    ; 1/2489.02 = t(on<->off) => 1/2489.02 = (r29r28*4 + 14)/16M
    ldi r28, lo8(1603)    ; => r29r28 = (16M/2489.02-14)/4 = 1603.558199612699
    
    ldi r21, hi8(372)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(372)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 372.2362536824824
    
    ret

  set_note_A6:            ; f = 1760.0 Hz
    ldi r29, hi8(2269)    ; 1/1760.0 = t(on<->off) => 1/1760.0 = (r29r28*4 + 14)/16M
    ldi r28, lo8(2269)    ; => r29r28 = (16M/1760.0-14)/4 = 2269.2272727272725
    
    ldi r21, hi8(262)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(262)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 262.9414928715683
    
    ret

  set_note_B6:            ; f = 1975.53 Hz
    ldi r29, hi8(2021)    ; 1/1975.53 = t(on<->off) => 1/1975.53 = (r29r28*4 + 14)/16M
    ldi r28, lo8(2021)    ; => r29r28 = (16M/1975.53-14)/4 = 2021.2730988646085
    
    ldi r21, hi8(295)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(295)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 295.25584832799404
    
    ret

  set_note_D6:            ; f = 1174.66 Hz
    ldi r29, hi8(3401)    ; 1/1174.66 = t(on<->off) => 1/1174.66 = (r29r28*4 + 14)/16M
    ldi r28, lo8(3401)    ; => r29r28 = (16M/1174.66-14)/4 = 3401.7406653840258
    
    ldi r21, hi8(175)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(175)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 175.17283843670026
    
    ret

  set_note_E6:            ; f = 1318.51 Hz
    ldi r29, hi8(3030)    ; 1/1318.51 = t(on<->off) => 1/1318.51 = (r29r28*4 + 14)/16M
    ldi r28, lo8(3030)    ; => r29r28 = (16M/1318.51-14)/4 = 3030.2274650931736
    
    ldi r21, hi8(196)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(196)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 196.74357951162224
    
    ret

  set_note_F6:            ; f = 1396.91 Hz
    ldi r29, hi8(2859)    ; 1/1396.91 = t(on<->off) => 1/1396.91 = (r29r28*4 + 14)/16M
    ldi r28, lo8(2859)    ; => r29r28 = (16M/1396.91-14)/4 = 2859.962928893057
    
    ldi r21, hi8(208)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(208)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 208.49956926708688
    
    ret

  set_note_G6:            ; f = 1567.98 Hz
    ldi r29, hi8(2547)    ; 1/1567.98 = t(on<->off) => 1/1567.98 = (r29r28*4 + 14)/16M
    ldi r28, lo8(2547)    ; => r29r28 = (16M/1567.98-14)/4 = 2547.552947103917
    
    ldi r21, hi8(234)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(234)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 234.15051909113444
    
    ret

  set_note_C7:            ; f = 2093.0 Hz
    ldi r29, hi8(1907)    ; 1/2093.0 = t(on<->off) => 1/2093.0 = (r29r28*4 + 14)/16M
    ldi r28, lo8(1907)    ; => r29r28 = (16M/2093.0-14)/4 = 1907.6323459149546
    
    ldi r21, hi8(312)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(312)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 312.8673612016256
    
    ret

  set_note_D7:            ; f = 2349.32 Hz
    ldi r29, hi8(1699)    ; 1/2349.32 = t(on<->off) => 1/2349.32 = (r29r28*4 + 14)/16M
    ldi r28, lo8(1699)    ; => r29r28 = (16M/2349.32-14)/4 = 1699.1203326920129
    
    ldi r21, hi8(351)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(351)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 351.29395626533335
    
    ret

  set_note_E7:            ; f = 2637.02 Hz
    ldi r29, hi8(1513)    ; 1/2637.02 = t(on<->off) => 1/2637.02 = (r29r28*4 + 14)/16M
    ldi r28, lo8(1513)    ; => r29r28 = (16M/2637.02-14)/4 = 1513.3637325465868
    
    ldi r21, hi8(394)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(394)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 394.4219987800971
    
    ret

  set_note_F7:            ; f = 2793.83 Hz
    ldi r29, hi8(1428)    ; 1/2793.83 = t(on<->off) => 1/2793.83 = (r29r28*4 + 14)/16M
    ldi r28, lo8(1428)    ; => r29r28 = (16M/2793.83-14)/4 = 1428.2263398274054
    
    ldi r21, hi8(417)     ; t(play_note) = 0.3s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = 0.3
    ldi r20, lo8(417)     ; => r21r20 = (16M*0.3 - 8)/(r29r28*8 + 32) - 1 = 417.92750001532903
    
    ret

  play_note:                  ; (r21r20+1)*(r29r28*8 + 32) + 4
    movw   r24, r20           ; 1
    1:                          ; r25r24*(r29r28*8 + 32) + (r29r28*8 + 31) = (r25r24+1)*(r29r28*8 + 32) - 1
      sbi 5, 4                  ; set HIGH - 2 cycles
      call delay_logic_change         ;  r29r28*4 + 12
      cbi 5, 4                  ; set LOW  - 2 cycles
      call delay_logic_change         ;  r29r28*4 + 12
      sbiw    r24, 1            ; 2
      brne    1b                ; 2
    ret                       ; 4

  delay_logic_change:   ; cycles = r29r28*4 + 8
    movw r30, r28   ; 1 cycle
    3:                ; r31r30*(2+2) + (2+1) + 4 = r31r30*4 + 7
      sbiw    r30, 1  ; 2 cycles
      brne    3b      ; 2 cycles
    ret             ; 4 cycles
