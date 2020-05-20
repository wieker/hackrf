EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Connector:Conn_01x20_Male J1
U 1 1 5EB3D7C1
P 4650 5650
F 0 "J1" H 4758 6731 50  0000 C CNN
F 1 "Conn_01x20_Male" H 4758 6640 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Horizontal" H 4650 5650 50  0001 C CNN
F 3 "~" H 4650 5650 50  0001 C CNN
	1    4650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4750 6250 4750
Wire Wire Line
	4850 5050 6250 5050
Wire Wire Line
	6250 5050 6250 4750
Wire Wire Line
	4850 5450 6250 5450
Wire Wire Line
	6250 5450 6250 5050
Connection ~ 6250 5050
Wire Wire Line
	4850 6150 6250 6150
Wire Wire Line
	6250 6150 6250 5450
Connection ~ 6250 5450
Wire Wire Line
	4850 6450 6250 6450
Wire Wire Line
	6250 6450 6250 6150
Connection ~ 6250 6150
Wire Wire Line
	4850 6650 6250 6650
Wire Wire Line
	6250 6650 6250 6450
Connection ~ 6250 6450
NoConn ~ 4850 4850
NoConn ~ 4850 4950
NoConn ~ 4850 5150
NoConn ~ 4850 5250
NoConn ~ 4850 5350
NoConn ~ 4850 5550
NoConn ~ 4850 5650
NoConn ~ 4850 5750
NoConn ~ 4850 5850
NoConn ~ 4850 5950
NoConn ~ 4850 6050
NoConn ~ 4850 6250
NoConn ~ 4850 6350
Wire Wire Line
	4850 6550 10450 6550
$Comp
L kilib:M10578-A2 U?
U 1 1 5ECA8A37
P 3550 2600
F 0 "U?" H 3550 3151 39  0000 C CNN
F 1 "M10578-A2" H 3550 3076 39  0000 C CNN
F 2 "" H 3550 2600 39  0001 C CNN
F 3 "" H 3550 2600 39  0001 C CNN
	1    3550 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
