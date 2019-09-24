; Configuration file for Duet WiFi
; executed by the firmware on start-up

; General preferences
M42 P100 S0						; set camera trigger low
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin

; Network
M550 PBeta30 						; Set machine name
;M587 S"ssid" P"password" 				; WiFi Settings
M552 S1							; Enable Networking
M552 P0.0.0.0						; Enable DHCP
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

M667 S1 						; Select CoreXY mode
M208 X-41 Y-14 Z-4.25 S1 				; Set axis minima
M208 X324 Y281.5 Z300 S0 				; Set axis maxima

; Disable Heaters for use with PWM.
M307 H7 A-1 C-1 D-1 					; disable heater 7 for use with TC Servo.


; Endstops						
M574 X1 Y1 S1						; Set endstop switches
M574 Z1 S2 						; Set Z endstop probe
M558 P7 X0 Y0 Z1 H7 F360 I0 T10000 			; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X20 Y-69 Z-4.25	 			; Set Z probe trigger value, offset and trigger height
M557 X30:270 Y20:140 S60 				; Define mesh grid

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S0 						; Drive 2 Z
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S0 						; Drive 5 E2
M569 P6 S0 						; Drive 6 E3
M569 P7 S1 						; Drive 7 UNUSED
M569 P8 S1 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED

; init tool detection
M98 P/macros/tool-detect/tool-detect-init

M584 X0 Y1 Z2 E3:4:5:6 					; Apply custom drive mapping
M350 X16 Y16 E16:16:16:16 I1 				; Configure microstepping without interpolation
M350 Z16 I1 						; Configure microstepping with interpolation
M92 X100 Y100 Z1600 E837:837:837:837 			; Set steps per mm
M205 X7 Y7 Z8 E2:2:2:2 					; Set maximum instantaneous speed changes (mm/s)
M203 X21000 Y21000 Z1000 E3300:3300:3300:3300 		; Set maximum speeds (mm/min)
M201 X900 Y900 Z400 E2500:2500:2500:2500 		; Set accelerations (mm/s^2)
M906 X1900 Y1900 Z1330 E1250:1250:1400:1250 I30 	; Set motor currents (mA) and motor idle factor in per cent
M84 S30 						; Set idle timeout

;Stall Detection
M915 X Y S5 F0 H400 R0

; Heaters
M305 P0 T100000 B4138 C0 				; Set thermistor + ADC parameters for heater 0
M143 H0 S255 						; Set temperature limit for heater 0 to 255C

M305 S"T0" P1 T100000 B4138 C0 X200 			; Set thermistor + ADC parameters for heater 1 and remap it to channel 200
M143 H1 S550 						; Set temperature limit for heater 1 to 550C
M307 H1 A513.2 C239.7 D4.0 V24.0 B0
M572 D0 S0.01

M305 S"T1" P2 T100000 B4138 C0 X201 			; Set thermistor + ADC parameters for heater 2 and remap it to channel 201
M143 H2 S550 						; Set temperature limit for heater 2 to 550C
M307 H2 A513.2 C239.7 D4.0 V24.0 B0
M572 D1 S0.01

M305 S"T2" P3 T100000 B4138 C0 X204			; Set thermistor + ADC parameters for heater 3 and remap it to channel 204
M143 H3 S550 						; Set temperature limit for heater 3 to 550C
M307 H3 A454.9 C322.7 D4.5 V24.0 B0
;M572 D2 S0.01

M305 S"T3" P4 T100000 B4138 C0 X205 			; Set thermistor + ADC parameters for heater 4 and remap it to channel 205
M143 H4 S550 						; Set temperature limit for heater 4 to 550C
M307 H4 A454.9 C322.7 D4.5 V24.0 B0
;M572 D3 S0.01


; Tools
M563 P0 S"T0" D0 H1 					; Define tool 0
G10 P0 X23.65 Y19.8 Z-0.6				; Set tool 0 axis offsets
G10 P0 R0 S0 						; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 					; Define tool 1
G10 P1 X23.62 Y20.28 Z-0.43	 				; Set tool 1 axis offsets
G10 P1 R0 S0 						; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 					; Define tool 2
;G10 P2 X33.25 Y0.95 Z-0.04				; Set tool 2 axis offsets
G10 P2 X23.46 Y20.28 Z-8.46				; Set tool 2 axis offsets (volcano test)
G10 P2 R0 S0 						; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 					; Define tool 3
;G10 P3 X32.52 Y0.72 Z-0.22				; Set tool 3 axis offsets
G10 P3 X23.46 Y19.21 Z-8.84				; Set tool 3 axis offsets
G10 P3 R0 S0 						; Set initial tool 3 active and standby temperatures to 0C

; Fans
M106 P0 S128 H1 T70					; T0 HE
M106 P1 S128 H2 T70					; T1 HE
M106 P2 S128 H3 T70					; T2 HE
M106 P3 S128 H4 T70					; T3 HE

M98 P/macros/lighting/lights_dim			; P4/P5

M106 P7 S0						; part-cooling fan
M106 P8 S0						; x/y stepper fans

; Custom settings
M98 P/macros/pick - drop/Coupler - Lock			; lock coupler

;M572 D0 S0.2 						; pressure advance T0
;M572 D1 S0.2 						; pressure advance T1
;M572 D2 S0.2 						; pressure advance T2
;M572 D3 S0.2 						; pressure advance T3