; bed.g
; called to perform automatic bed compensation via G32

M98 P/macros/Coupler - Unlock		;Open Coupler
				
M561					; Clear any bed transform
G28 					; Home axes

G1 X0 Y0 F50000				;Move

; Probe the bed at 5 points

G30 P0 X5 Y5 H0 Z-99999
G30 P1 X5 Y195 H0 Z-99999

G1 X5 Y175 F50000
G1 X275 Y175 F50000
G1 X275 Y195 F50000

G30 P2 X295 Y195 H0 Z-99999
G30 P3 X295 Y5 H0 Z-99999
G30 P4 X150 Y100 H0 Z-99999 S

G91					; use relative positioning
G1 S2 Z4 F5000				; lift Z
G90					; back to absolute positioning

;park
G1 X140 Y245 F50000


