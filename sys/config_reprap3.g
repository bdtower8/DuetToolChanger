; Configuration file for Duet WiFi
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin

; Network
M550 P"ToolChanger"				; Set machine name
;M587 S"ssid" P"password" 		; WiFi Settings
M552 S1							; Enable Networking
M552 P0.0.0.0					; Enable DHCP
M586 P0 S1 						; Enable HTTP
M586 P1 S1 						; Disable FTP
M586 P2 S0 						; Disable Telnet

M667 S1 						; Select CoreXY mode

; Endstops
M574 X1 S1 P"xstop"
M574 Y1 S1 P"ystop"

M574 Z0 P"nil"						; Set Z endstop probe
M558 P5 C"zstop" H5 F360 T20000 	; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X20 Y-69 Z0		 		; Set Z probe trigger value, offset and trigger height
M557 X30:270 Y20:140 S60 			; Define mesh grid

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S0 						; Drive 2 Z
M569 P3 S1 						; Drive 3 E0
M569 P4 S1 						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S1 						; Drive 7 Coupler
M569 P8 S0 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED

M584 X0 Y1 Z2 C7 E3:4:5:6 								; Apply custom drive mapping
M208 X-41:324 Y-14:281.5 Z0:300 C0:500 S0				; Set axis maxima & minima
M350 E16:16:16:16 C8 I0 								; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1										; Configure microstepping with interpolation
M92 X100 Y100 Z1600 C100 E398:398:398:398 				; Set steps per mm
M566 X400 Y400 Z8 C2 E2:2:2:2							; Set maximum instantaneous speed changes (mm/min)
M203 X20000 Y20000 Z1200 C5000 E5000:5000:5000:5000		; Set maximum speeds (mm/min)
M201 X900 Y900 Z400 C400 E2500:2500:2500:2500 			; Set accelerations (mm/s^2)
M906 X1900 Y1900 Z1330 C500 E1400:1400:1400:1400 I30	; Set motor currents (mA) and motor idle factor in per cent
M84 S120 												; Set idle timeout
M204 P900 T1600 R3300

; Stall detection, coupler
;M574 C1 S3
;M915 C S3 F0 H50 R0

; init tool detection
;M98 P/macros/tool-detect/tool-detect-init

; Heaters
M308 S0 P"bed_temp" Y"thermistor" T100000 B4138 C0     	; define bed temperature sensor
M950 H0 C"bed_heat" T0 Q100                             ; heater 0 uses the bed_heat pin, sensor 0
M143 H0 S225 											; Set temperature limit for heater 0 to 225C

M308 S1 P"spi.cs1" Y"rtd-max31865"						; Set thermistor
M950 H1 C"e0_heat" T1;									; Assign heater
M143 H1 S300 											; Set temperature limit for heater 1 to 300C
M307 H1 A559.7 C283.1 D3.5              				; v6, 30w results from m303 h1 s275

M308 S2 P"spi.cs2" Y"rtd-max31865"						; Set thermistor
M950 H2 C"e1_heat" T2;									; Assign heater
M143 H2 S300 											; Set temperature limit for heater 2 to 300C
M307 H2 A559.7 C283.1 D3.5              				; v6, 30w results from m303 h2 s275

M308 S3 P"spi.cs5" Y"rtd-max31865"						; Set thermistor
M950 H3 C"duex.e2_heat" T3;								; Assign heater
M143 H3 S300 											; Set temperature limit for heater 3 to 300C
M307 H3 A559.7 C283.1 D3.5              				; v6, 30w results from m303 h3 s275

M308 S4 P"spi.cs6" Y"rtd-max31865"						; Set thermistor
M950 H4 C"duex.e3_heat" T4;									; Assign heater
M143 H4 S300 											; Set temperature limit for heater 4 to 300C
M307 H4 A559.7 C283.1 D3.5              				; v6, 30w results from m303 h4 s275

; Tools
M563 P0 S"T0" D0 H1 					; Define tool 0
;G10 P0 X30.65 Y1.8 Z-10.85				; Set tool 0 axis offsets
G10 P0 R0 S0 							; Set initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 					; Define tool 1
;G10 P1 X29.61 Y2.45 Z-11.33				; Set tool 1 axis offsets
G10 P1 R0 S0 							; Set initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 					; Define tool 2
;G10 P2 X30.64 Y2.48 Z-19.86				; Set tool 2 axis offsets
G10 P2 R0 S0 							; Set initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 					; Define tool 3
;G10 P3 X29.96 Y2.08 Z-19.75				; Set tool 3 axis offsets
G10 P3 R0 S0 							; Set initial tool 3 active and standby temperatures to 0C

; Fans
M950 F0 C"fan0"
M106 P0 S128 H1 T70					; T0 HE

M950 F1 C"fan1"
M106 P1 S128 H2 T70					; T1 HE

M950 F2 C"fan2"
M106 P2 S128 H3 T70					; T2 HE

M950 F3 C"duex.fan3"
M106 P3 S128 H4 T70					; T3 HE

; LEDs
M950 F4 C"duex.fan4"
M950 F5 C"duex.fan5"
M950 F6 C"duex.fan6"

M98 P/macros/lighting/lights_mid	; P4/P5

; Input
M950 J0 C"e0stop"

;M106 P7 S0						; part-cooling fan
;M106 P8 S0						; x/y stepper fans

; Custom settings
;M98 P/macros/pick - drop/Coupler - Lock			; lock coupler
