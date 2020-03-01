EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C C?
U 1 1 5E67193D
P 2900 2150
AR Path="/5E67193D" Ref="C?"  Part="1" 
AR Path="/5E5F7D61/5E67193D" Ref="C?"  Part="1" 
F 0 "C?" H 3015 2196 50  0000 L CNN
F 1 "0.1uF" H 3015 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2938 2000 50  0001 C CNN
F 3 "~" H 2900 2150 50  0001 C CNN
	1    2900 2150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5E671943
P 3350 2150
AR Path="/5E671943" Ref="C?"  Part="1" 
AR Path="/5E5F7D61/5E671943" Ref="C?"  Part="1" 
F 0 "C?" H 3465 2196 50  0000 L CNN
F 1 "0.1uF" H 3465 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3388 2000 50  0001 C CNN
F 3 "~" H 3350 2150 50  0001 C CNN
	1    3350 2150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E671949
P 3100 2550
AR Path="/5E671949" Ref="#PWR?"  Part="1" 
AR Path="/5E5F7D61/5E671949" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3100 2300 50  0001 C CNN
F 1 "GND" H 3105 2377 50  0000 C CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5E67194F
P 3150 1750
AR Path="/5E67194F" Ref="#PWR?"  Part="1" 
AR Path="/5E5F7D61/5E67194F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 1600 50  0001 C CNN
F 1 "+3V3" H 3165 1923 50  0000 C CNN
F 2 "" H 3150 1750 50  0001 C CNN
F 3 "" H 3150 1750 50  0001 C CNN
	1    3150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2300 2900 2450
Wire Wire Line
	2900 2450 3100 2450
Wire Wire Line
	3100 2450 3100 2550
Wire Wire Line
	3100 2450 3350 2450
Wire Wire Line
	3350 2450 3350 2400
Connection ~ 3100 2450
Wire Wire Line
	3350 2000 3350 1900
Wire Wire Line
	3350 1900 3150 1900
Wire Wire Line
	3150 1900 3150 1750
Wire Wire Line
	2900 2000 2900 1900
Wire Wire Line
	2900 1900 3150 1900
Connection ~ 3150 1900
Wire Wire Line
	3350 2400 3550 2400
Wire Wire Line
	3550 2400 3550 3000
Connection ~ 3350 2400
Wire Wire Line
	3350 2400 3350 2300
Text GLabel 2750 3000 0    50   Input ~ 0
CDONE
$Comp
L Device:LED D?
U 1 1 5E677C12
P 2900 3000
AR Path="/5E677C12" Ref="D?"  Part="1" 
AR Path="/5E5F7D61/5E677C12" Ref="D?"  Part="1" 
F 0 "D?" H 2893 2745 50  0000 C CNN
F 1 "LED" H 2893 2836 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2900 3000 50  0001 C CNN
F 3 "~" H 2900 3000 50  0001 C CNN
	1    2900 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E677C18
P 3200 3000
AR Path="/5E677C18" Ref="R?"  Part="1" 
AR Path="/5E5F7D61/5E677C18" Ref="R?"  Part="1" 
F 0 "R?" V 2993 3000 50  0000 C CNN
F 1 "10kohm" V 3084 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3130 3000 50  0001 C CNN
F 3 "~" H 3200 3000 50  0001 C CNN
	1    3200 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3000 3350 3000
Text GLabel 2750 3250 0    50   Input ~ 0
IO53
$Comp
L Device:LED D?
U 1 1 5E677C20
P 2900 3250
AR Path="/5E677C20" Ref="D?"  Part="1" 
AR Path="/5E5F7D61/5E677C20" Ref="D?"  Part="1" 
F 0 "D?" H 2893 2995 50  0000 C CNN
F 1 "LED" H 2893 3086 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2900 3250 50  0001 C CNN
F 3 "~" H 2900 3250 50  0001 C CNN
	1    2900 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E677C26
P 3200 3250
AR Path="/5E677C26" Ref="R?"  Part="1" 
AR Path="/5E5F7D61/5E677C26" Ref="R?"  Part="1" 
F 0 "R?" V 2993 3250 50  0000 C CNN
F 1 "10kohm" V 3084 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3130 3250 50  0001 C CNN
F 3 "~" H 3200 3250 50  0001 C CNN
	1    3200 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3250 3350 3250
Text GLabel 2750 3450 0    50   Input ~ 0
IO52
$Comp
L Device:LED D?
U 1 1 5E677C2E
P 2900 3450
AR Path="/5E677C2E" Ref="D?"  Part="1" 
AR Path="/5E5F7D61/5E677C2E" Ref="D?"  Part="1" 
F 0 "D?" H 2893 3195 50  0000 C CNN
F 1 "LED" H 2893 3286 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2900 3450 50  0001 C CNN
F 3 "~" H 2900 3450 50  0001 C CNN
	1    2900 3450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E677C34
P 3200 3450
AR Path="/5E677C34" Ref="R?"  Part="1" 
AR Path="/5E5F7D61/5E677C34" Ref="R?"  Part="1" 
F 0 "R?" V 2993 3450 50  0000 C CNN
F 1 "10kohm" V 3084 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3130 3450 50  0001 C CNN
F 3 "~" H 3200 3450 50  0001 C CNN
	1    3200 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3450 3350 3450
Text GLabel 2750 3650 0    50   Input ~ 0
IO51
$Comp
L Device:LED D?
U 1 1 5E677C3C
P 2900 3650
AR Path="/5E677C3C" Ref="D?"  Part="1" 
AR Path="/5E5F7D61/5E677C3C" Ref="D?"  Part="1" 
F 0 "D?" H 2893 3395 50  0000 C CNN
F 1 "LED" H 2893 3486 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 2900 3650 50  0001 C CNN
F 3 "~" H 2900 3650 50  0001 C CNN
	1    2900 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E677C42
P 3200 3650
AR Path="/5E677C42" Ref="R?"  Part="1" 
AR Path="/5E5F7D61/5E677C42" Ref="R?"  Part="1" 
F 0 "R?" V 2993 3650 50  0000 C CNN
F 1 "10kohm" V 3084 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3130 3650 50  0001 C CNN
F 3 "~" H 3200 3650 50  0001 C CNN
	1    3200 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3650 3350 3650
Wire Wire Line
	3550 3000 3550 3250
Wire Wire Line
	3550 3450 3550 3250
Connection ~ 3550 3250
Wire Wire Line
	3550 3650 3550 3450
Connection ~ 3550 3450
Text GLabel 8000 4200 2    50   Input ~ 0
IO51
Text GLabel 8000 4100 2    50   Input ~ 0
IO52
Text GLabel 8000 4000 2    50   Input ~ 0
IO53
Text GLabel 8000 3900 2    50   Input ~ 0
IO54
Text GLabel 8000 3800 2    50   Input ~ 0
IO56
Text GLabel 8000 3700 2    50   Input ~ 0
IO57
Text GLabel 8000 3600 2    50   Input ~ 0
IO59
Text GLabel 8000 3500 2    50   Input ~ 0
IO60
Text GLabel 8000 3400 2    50   Input ~ 0
IO62
Text GLabel 8000 3300 2    50   Input ~ 0
IO63
Text GLabel 8000 3200 2    50   Input ~ 0
IO64
Text GLabel 8000 3100 2    50   Input ~ 0
IO65
Text GLabel 8000 3000 2    50   Input ~ 0
IO66
Text GLabel 8000 2900 2    50   Input ~ 0
IO68
Text GLabel 8000 2800 2    50   Input ~ 0
IO69
Text GLabel 8000 2700 2    50   Input ~ 0
IO71
Text GLabel 8000 2600 2    50   Input ~ 0
IO72
Text GLabel 8000 2500 2    50   Input ~ 0
IO73
Text GLabel 8000 2400 2    50   Input ~ 0
IO74
Text GLabel 5050 2300 0    50   Input ~ 0
IO78
Text GLabel 5050 2400 0    50   Input ~ 0
IO79
Text GLabel 5050 2500 0    50   Input ~ 0
IO80
Text GLabel 5050 2600 0    50   Input ~ 0
IO81
Text GLabel 5050 2700 0    50   Input ~ 0
IO82
Text GLabel 5050 2800 0    50   Input ~ 0
IO83
Text GLabel 5050 2900 0    50   Input ~ 0
IO85
Text GLabel 5050 3000 0    50   Input ~ 0
IO86
Text GLabel 5050 3100 0    50   Input ~ 0
IO87
Text GLabel 5050 3200 0    50   Input ~ 0
IO89
Text GLabel 5050 3300 0    50   Input ~ 0
IO90
Text GLabel 5050 3400 0    50   Input ~ 0
IO91
Text GLabel 5050 3500 0    50   Input ~ 0
IO93
Text GLabel 5050 3600 0    50   Input ~ 0
IO94
Text GLabel 5050 3700 0    50   Input ~ 0
IO95
Text GLabel 5050 3800 0    50   Input ~ 0
IO96
Text GLabel 5050 3900 0    50   Input ~ 0
IO97
Text GLabel 5050 4000 0    50   Input ~ 0
IO99
Text GLabel 5050 4100 0    50   Input ~ 0
IO100
$Comp
L Connector:Conn_01x20_Male J?
U 1 1 5E67DAE5
P 7800 3300
F 0 "J?" H 7908 4381 50  0000 C CNN
F 1 "Conn_01x20_Male" H 7908 4290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Vertical" H 7800 3300 50  0001 C CNN
F 3 "~" H 7800 3300 50  0001 C CNN
	1    7800 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x20_Male J?
U 1 1 5E67DAEB
P 5250 3300
F 0 "J?" H 5222 3182 50  0000 R CNN
F 1 "Conn_01x20_Male" H 5222 3273 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Vertical" H 5250 3300 50  0001 C CNN
F 3 "~" H 5250 3300 50  0001 C CNN
	1    5250 3300
	-1   0    0    1   
$EndComp
NoConn ~ 8000 4300
NoConn ~ 5050 4200
$EndSCHEMATC
