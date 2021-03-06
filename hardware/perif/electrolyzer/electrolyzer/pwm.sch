EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L Transistor_FET:2N7002 Q?
U 1 1 5F2034CC
P 3400 2800
F 0 "Q?" V 3742 2800 50  0000 C CNN
F 1 "2N7002" V 3651 2800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3600 2725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 3400 2800 50  0001 L CNN
	1    3400 2800
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5F2077BB
P 4150 3750
F 0 "Q?" H 4354 3796 50  0000 L CNN
F 1 "2N7002" H 4354 3705 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4350 3675 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 4150 3750 50  0001 L CNN
	1    4150 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F20B43C
P 2250 3350
F 0 "C?" H 2365 3396 50  0000 L CNN
F 1 "C" H 2365 3305 50  0000 L CNN
F 2 "" H 2288 3200 50  0001 C CNN
F 3 "~" H 2250 3350 50  0001 C CNN
	1    2250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5F20BC15
P 5450 2700
F 0 "L?" V 5269 2700 50  0000 C CNN
F 1 "L" V 5360 2700 50  0000 C CNN
F 2 "" H 5450 2700 50  0001 C CNN
F 3 "~" H 5450 2700 50  0001 C CNN
	1    5450 2700
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5F20C26A
P 6400 3450
F 0 "C?" H 6515 3496 50  0000 L CNN
F 1 "C" H 6515 3405 50  0000 L CNN
F 2 "" H 6438 3300 50  0001 C CNN
F 3 "~" H 6400 3450 50  0001 C CNN
	1    6400 3450
	1    0    0    -1  
$EndComp
Text GLabel 1650 2700 0    50   Input ~ 0
pwr_in
Text GLabel 7150 2700 2    50   Input ~ 0
pwr_out
Wire Wire Line
	1650 2700 2250 2700
Wire Wire Line
	2250 3200 2250 2700
Connection ~ 2250 2700
Wire Wire Line
	2250 2700 3200 2700
Wire Wire Line
	3600 2700 4250 2700
Wire Wire Line
	5600 2700 6400 2700
Wire Wire Line
	6400 3300 6400 2700
Connection ~ 6400 2700
Wire Wire Line
	6400 2700 7150 2700
Wire Wire Line
	4250 3550 4250 2700
Connection ~ 4250 2700
Wire Wire Line
	4250 2700 5300 2700
$Comp
L power:GND #PWR?
U 1 1 5F21355A
P 2250 4500
F 0 "#PWR?" H 2250 4250 50  0001 C CNN
F 1 "GND" H 2255 4327 50  0000 C CNN
F 2 "" H 2250 4500 50  0001 C CNN
F 3 "" H 2250 4500 50  0001 C CNN
	1    2250 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F213995
P 4250 4450
F 0 "#PWR?" H 4250 4200 50  0001 C CNN
F 1 "GND" H 4255 4277 50  0000 C CNN
F 2 "" H 4250 4450 50  0001 C CNN
F 3 "" H 4250 4450 50  0001 C CNN
	1    4250 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F214128
P 6400 4350
F 0 "#PWR?" H 6400 4100 50  0001 C CNN
F 1 "GND" H 6405 4177 50  0000 C CNN
F 2 "" H 6400 4350 50  0001 C CNN
F 3 "" H 6400 4350 50  0001 C CNN
	1    6400 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4350 6400 3600
Wire Wire Line
	4250 3950 4250 4450
Wire Wire Line
	2250 4500 2250 3500
Text GLabel 3400 3750 0    50   Input ~ 0
sw_d
Wire Wire Line
	3400 3750 3950 3750
Text GLabel 2950 3250 0    50   Input ~ 0
sw_t
Wire Wire Line
	2950 3250 3400 3250
Wire Wire Line
	3400 3250 3400 3000
$EndSCHEMATC
