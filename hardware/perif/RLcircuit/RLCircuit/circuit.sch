EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 2700 3300 0    50   Input ~ 0
RLctl
$Comp
L Transistor_FET:2N7002K Q?
U 1 1 5F13B223
P 3350 3300
F 0 "Q?" H 3554 3346 50  0000 L CNN
F 1 "2N7002K" H 3554 3255 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3550 3225 50  0001 L CIN
F 3 "https://www.diodes.com/assets/Datasheets/ds30896.pdf" H 3350 3300 50  0001 L CNN
	1    3350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3300 3150 3300
$Comp
L Device:R R?
U 1 1 5F13EBF2
P 3950 4050
F 0 "R?" V 3743 4050 50  0000 C CNN
F 1 "R" V 3834 4050 50  0000 C CNN
F 2 "" V 3880 4050 50  0001 C CNN
F 3 "~" H 3950 4050 50  0001 C CNN
	1    3950 4050
	0    1    1    0   
$EndComp
$Comp
L Device:L L?
U 1 1 5F13F643
P 4600 4450
F 0 "L?" H 4653 4496 50  0000 L CNN
F 1 "L" H 4653 4405 50  0000 L CNN
F 2 "" H 4600 4450 50  0001 C CNN
F 3 "~" H 4600 4450 50  0001 C CNN
	1    4600 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F140665
P 4600 5050
F 0 "#PWR?" H 4600 4800 50  0001 C CNN
F 1 "GND" H 4605 4877 50  0000 C CNN
F 2 "" H 4600 5050 50  0001 C CNN
F 3 "" H 4600 5050 50  0001 C CNN
	1    4600 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F140B9B
P 3450 2750
F 0 "#PWR?" H 3450 2600 50  0001 C CNN
F 1 "+3V3" H 3465 2923 50  0000 C CNN
F 2 "" H 3450 2750 50  0001 C CNN
F 3 "" H 3450 2750 50  0001 C CNN
	1    3450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2750 3450 3100
Wire Wire Line
	3450 3500 3450 4050
Wire Wire Line
	3450 4050 3800 4050
Wire Wire Line
	4100 4050 4600 4050
Wire Wire Line
	4600 4050 4600 4300
Wire Wire Line
	4600 4600 4600 5050
Text GLabel 4950 4050 2    50   Input ~ 0
RLsense
Wire Wire Line
	4600 4050 4950 4050
Connection ~ 4600 4050
$EndSCHEMATC
