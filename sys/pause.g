; pause.g
; called when a print from SD card is paused

M913 X30 Y30			; reduce motor currents to prevent damage to motion system

M83 				; relative extruder moves
G91 				; relative positioning
G1 Z5 F360 			; lift Z by 5mm
G90 				; absolute positioning
G1 X-15 Y-10 F3000 		; go to X=0 Y=0

M913 X100 Y100			; set motor currents back to 100%

; sound alarm
; M98 P/macros/sound_alarm


