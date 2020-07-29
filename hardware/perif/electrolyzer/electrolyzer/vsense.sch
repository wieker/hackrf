EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Device:R R?
U 1 1 5F2009CA
P 2100 3800
F 0 "R?" H 2170 3846 50  0000 L CNN
F 1 "R" H 2170 3755 50  0000 L CNN
F 2 "" V 2030 3800 50  0001 C CNN
F 3 "~" H 2100 3800 50  0001 C CNN
	1    2100 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F2010AC
P 2100 3000
F 0 "R?" H 2170 3046 50  0000 L CNN
F 1 "R" H 2170 2955 50  0000 L CNN
F 2 "" V 2030 3000 50  0001 C CNN
F 3 "~" H 2100 3000 50  0001 C CNN
	1    2100 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F201596
P 2100 4700
F 0 "#PWR?" H 2100 4450 50  0001 C CNN
F 1 "GND" H 2105 4527 50  0000 C CNN
F 2 "" H 2100 4700 50  0001 C CNN
F 3 "" H 2100 4700 50  0001 C CNN
	1    2100 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3150 2100 3400
Wire Wire Line
	2100 3400 2650 3400
Wire Wire Line
	2650 3400 2650 3800
Wire Wire Line
	2650 3800 3150 3800
Connection ~ 2100 3400
Wire Wire Line
	2100 3400 2100 3650
Text GLabel 1250 2500 0    50   Input ~ 0
vs_in
Wire Wire Line
	1250 2500 2100 2500
Wire Wire Line
	2100 2850 2100 2500
Text GLabel 3150 3800 2    50   Input ~ 0
v_sense
Wire Wire Line
	2100 3950 2100 4700
$EndSCHEMATC
