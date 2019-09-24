; tfree0.g
; called when tool 0 is freed
;

;Drop Bed
G91
G1 Z3 F1500
G90

;fan off
; M106 P2 S0

; disable tool attached monitoring
M591 D0 C3 P1 S0

;Move In
G1 X-24.5 Y185 F24000
;G1 Y250 F4000
G1 Y250 F8000

; stop short
;G1 Y256 E4 F2000
G1 Y256 E4 F4000

;Open Coupler
M98 P/macros/pick - drop/Coupler - Unlock

; final destination
;G1 Y261.2 F800
G1 Y261.2 F1200

;M98 P/macros/pick - drop/Coupler - Unlock

G4 P500

G1 Y250 F500

;Move Out
G1 Y210 F24000

;undo Drop Bed
G91
G1 Z-3 F1500
G90

; enable no-tool monitoring
; M98 P/macros/tool-detect/no-tool-detect-enable