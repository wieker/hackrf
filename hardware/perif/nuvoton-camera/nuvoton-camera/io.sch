EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L Connector:Conn_01x20_Male J3
U 1 1 5EC95CF0
P 4050 3400
F 0 "J3" H 4158 4481 50  0000 C CNN
F 1 "Conn_01x20_Male" H 4158 4390 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Horizontal" H 4050 3400 50  0001 C CNN
F 3 "~" H 4050 3400 50  0001 C CNN
	1    4050 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0109
U 1 1 5EC99CB1
P 5750 1750
F 0 "#PWR0109" H 5750 1600 50  0001 C CNN
F 1 "+3V3" H 5765 1923 50  0000 C CNN
F 2 "" H 5750 1750 50  0001 C CNN
F 3 "" H 5750 1750 50  0001 C CNN
	1    5750 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EC9A3C5
P 5100 4900
F 0 "#PWR0110" H 5100 4650 50  0001 C CNN
F 1 "GND" H 5105 4727 50  0000 C CNN
F 2 "" H 5100 4900 50  0001 C CNN
F 3 "" H 5100 4900 50  0001 C CNN
	1    5100 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2500 5100 2500
Wire Wire Line
	5100 2500 5100 2800
Wire Wire Line
	4250 2800 5100 2800
Connection ~ 5100 2800
Wire Wire Line
	5100 2800 5100 3200
Wire Wire Line
	4250 3200 5100 3200
Connection ~ 5100 3200
Wire Wire Line
	5100 3200 5100 3900
Wire Wire Line
	4250 3900 5100 3900
Connection ~ 5100 3900
Wire Wire Line
	5100 3900 5100 4200
Wire Wire Line
	4250 4200 5100 4200
Connection ~ 5100 4200
Wire Wire Line
	5100 4200 5100 4400
Wire Wire Line
	4250 4400 5100 4400
Connection ~ 5100 4400
Wire Wire Line
	5100 4400 5100 4900
Wire Wire Line
	4250 4300 5750 4300
Wire Wire Line
	5750 4300 5750 1750
Text GLabel 4250 4000 2    50   Input ~ 0
NvtRX
Text GLabel 4250 4100 2    50   Input ~ 0
NvtTX
NoConn ~ 4250 3800
NoConn ~ 4250 3700
NoConn ~ 4250 3600
NoConn ~ 4250 3500
NoConn ~ 4250 3400
NoConn ~ 4250 3300
NoConn ~ 4250 3100
NoConn ~ 4250 3000
NoConn ~ 4250 2900
NoConn ~ 4250 2700
NoConn ~ 4250 2600
$EndSCHEMATC
