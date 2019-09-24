; tpost0.g
; called after tool 0 has been selected
;

M98 P/macros/lighting/lights_full

; turn on the extuder stepper
M906 E1600:0:0:0

;Drop Bed
G91
G1 Z1 F1500
G90

;Unlock Coupler
M98 P/macros/pick - drop/Coupler - Unlock

;Move In
G1 X-24.5 Y215 F24000
G1 Y250 F24000

; take a picture
M98 P/macros/camera/trigger_picture

; wait for warmup
M116 P0

; disable no-tool monitoring
; M98 P/macros/tool-detect/no-tool-detect-disable

;Collect
;G1 Y260.8 F2000
G1 Y261.2 F4000
G4 P250

;Close Coupler
M98 P/macros/pick - drop/Coupler - Lock

;Move Out
G1 Y240 F6000

;prime
M98 P/macros/Priming/t0_prime

; enable tool head monitoring
M591 D0 C3 P1 S1

;undo drop Bed
G91
G1 Z-1 F1500
G90

M98 P/macros/lighting/lights_dim