note_to_freq = {
   "C0":   16.35,
  "C#0":   17.32,
  "Db0":   17.32,
   "D0":   18.35,
  "D#0":   19.45,
  "Eb0":   19.45,
   "E0":   20.60,
   "F0":   21.83,
  "F#0":   23.12,
  "Gb0":   23.12,
   "G0":   24.50,
  "G#0":   25.96,
  "Ab0":   25.96,
   "A0":   27.50,
  "A#0":   29.14,
  "Bb0":   29.14,
   "B0":   30.87,
   "C1":   32.70,
  "C#1":   34.65,
  "Db1":   34.65,
   "D1":   36.71,
  "D#1":   38.89,
  "Eb1":   38.89,
   "E1":   41.20,
   "F1":   43.65,
  "F#1":   46.25,
  "Gb1":   46.25,
   "G1":   49.00,
  "G#1":   51.91,
  "Ab1":   51.91,
   "A1":   55.00,
  "A#1":   58.27,
  "Bb1":   58.27,
   "B1":   61.74,
   "C2":   65.41,
  "C#2":   69.30,
  "Db2":   69.30,
   "D2":   73.42,
  "D#2":   77.78,
  "Eb2":   77.78,
   "E2":   82.41,
   "F2":   87.31,
  "F#2":   92.50,
  "Gb2":   92.50,
   "G2":   98.00,
  "G#2":  103.83,
  "Ab2":  103.83,
   "A2":  110.00,
  "A#2":  116.54,
  "Bb2":  116.54,
   "B2":  123.47,
   "C3":  130.81,
  "C#3":  138.59,
  "Db3":  138.59,
   "D3":  146.83,
  "D#3":  155.56,
  "Eb3":  155.56,
   "E3":  164.81,
   "F3":  174.61,
  "F#3":  185.00,
  "Gb3":  185.00,
   "G3":  196.00,
  "G#3":  207.65,
  "Ab3":  207.65,
   "A3":  220.00,
  "A#3":  233.08,
  "Bb3":  233.08,
   "B3":  246.94,
   "C4":  261.63,
  "C#4":  277.18,
  "Db4":  277.18,
   "D4":  293.66,
  "D#4":  311.13,
  "Eb4":  311.13,
   "E4":  329.63,
   "F4":  349.23,
  "F#4":  369.99,
  "Gb4":  369.99,
   "G4":  392.00,
  "G#4":  415.30,
  "Ab4":  415.30,
   "A4":  440.00,
  "A#4":  466.16,
  "Bb4":  466.16,
   "B4":  493.88,
   "C5":  523.25,
  "C#5":  554.37,
  "Db5":  554.37,
   "D5":  587.33,
  "D#5":  622.25,
  "Eb5":  622.25,
   "E5":  659.26,
   "F5":  698.46,
  "F#5":  739.99,
  "Gb5":  739.99,
   "G5":  783.99,
  "G#5":  830.61,
  "Ab5":  830.61,
   "A5":  880.00,
  "A#5":  932.33,
  "Bb5":  932.33,
   "B5":  987.77,
   "C6": 1046.50,
  "C#6": 1108.73,
  "Db6": 1108.73,
   "D6": 1174.66,
  "D#6": 1244.51,
  "Eb6": 1244.51,
   "E6": 1318.51,
   "F6": 1396.91,
  "F#6": 1479.98,
  "Gb6": 1479.98,
   "G6": 1567.98,
  "G#6": 1661.22,
  "Ab6": 1661.22,
   "A6": 1760.00,
  "A#6": 1864.66,
  "Bb6": 1864.66,
   "B6": 1975.53,
   "C7": 2093.00,
  "C#7": 2217.46,
  "Db7": 2217.46,
   "D7": 2349.32,
  "D#7": 2489.02,
  "Eb7": 2489.02,
   "E7": 2637.02,
   "F7": 2793.83,
  "F#7": 2959.96,
  "Gb7": 2959.96,
   "G7": 3135.96,
  "G#7": 3322.44,
  "Ab7": 3322.44,
   "A7": 3520.00,
  "A#7": 3729.31,
  "Bb7": 3729.31,
   "B7": 3951.07,
   "C8": 4186.01,
  "C#8": 4434.92,
  "Db8": 4434.92,
   "D8": 4698.64,
  "D#8": 4978.03,
  "Eb8": 4978.03
}

def up_tone(note, step=1):
    for chr in note:
        if chr.isdigit():
            return note.replace(chr, str(int(chr)+step))

fur_elise = ['e4', 'd4#', 'e4', 'd4#', 'e4', 'b3', 'd4', 'c4', 'a3', 'd3', 'f3', 'a3', 'b3', 'f3', 'a3#', 'b3', 'c4', 'e4', 'd4#', 'e4', 'd4#', 'e4', 'b3', 'd4', 'c4', 'a3', 'd3', 'f3', 'a3', 'b3', 'f3', 'c4', 'b3', 'a3', 'b3', 'c4', 'd4', 'e4', 'g3', 'f4', 'e4', 'd4', 'e3', 'e4', 'd4', 'c4', 'd3', 'd4', 'c4', 'b3', 'e4', 'd4#', 'e4', 'd4#', 'e4', 'b3', 'd4', 'c4', 'a3', 'd3', 'f3', 'a3', 'b3', 'f3', 'a3', 'b3', 'c4', 'e4', 'd4#', 'e4', 'd4#', 'e4', 'b3', 'd4', 'c4', 'a3', 'd3', 'f3', 'a3', 'b3', 'f3', 'c4', 'b3', 'a3']
fur_elise = [up_tone(x.upper(), step=3) for x in fur_elise]

for i in range(len(fur_elise)):
    if '#' in fur_elise[i]:
        fur_elise[i] = fur_elise[i][:-2] + '#' + fur_elise[i][-2]

notes = sorted(set(fur_elise), key=lambda x: (x[1],x[0]))

note_to_str = {note:note.replace('#','s') for note in notes}

node_duration = 0.35

function_template = '''
set_note_{note_str}:\t\t; f = {freq} Hz
  ldi r29, hi8({loop_num_int})\t; 1/{freq} = t(on<->off) => 1/{freq} = (r29r28*4 + 14)/16M
  ldi r28, lo8({loop_num_int})\t; => r29r28 = (16M/{freq}-14)/4 = {loop_num}
  
  ldi r21, hi8({duration_loop_num_int})\t; t(play_note) = {node_duration}s => [(r21r20+1)*(r29r28*8 + 32) + 8]/16M = {node_duration}
  ldi r20, lo8({duration_loop_num_int})\t; => r21r20 = (16M*{node_duration} - 8)/(r29r28*8 + 32) - 1 = {duration_loop_num}
  
  ret'''

avg_loop_num = 0

for note in notes:
    freq = note_to_freq[note]
    loop_num = (16e6/freq - 14)/4
    loop_num_int = int(loop_num)
    duration_loop_num = (16e6*node_duration - 8)/(loop_num*8+32) - 1
    duration_loop_num_int = int(duration_loop_num)
    avg_loop_num += loop_num
    print(function_template.format(
        note_str=note_to_str[note],
        freq=freq,
        loop_num=loop_num,
        loop_num_int=loop_num_int,
        duration_loop_num=duration_loop_num,
        duration_loop_num_int=duration_loop_num_int,
        node_duration=node_duration
    ))

print("Avg r29r28 {}".format(avg_loop_num/len(notes)))

play_note_template = '''
  call set_note_{note_str}
  call play_note'''

for note in fur_elise:
    print(play_note_template.format(note_str=note_to_str[note]))