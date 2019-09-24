; resume.g
; called before a print from SD card is resumed

G1 R1 Z5 F24000 ; go to 5mm above position of the last print move
G1 R1 ; go back to the last print move
M83 ; relative extruder moves
;G1 E5.00 F3000 ; un-retract after wipe
