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
L Device:C C1
U 1 1 5EA60079
P 7500 2950
F 0 "C1" H 7615 2996 50  0000 L CNN
F 1 "0.1uF" H 7615 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7538 2800 50  0001 C CNN
F 3 "~" H 7500 2950 50  0001 C CNN
	1    7500 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5EA6062B
P 8200 2950
F 0 "C2" H 8315 2996 50  0000 L CNN
F 1 "4.7uF" H 8315 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8238 2800 50  0001 C CNN
F 3 "~" H 8200 2950 50  0001 C CNN
	1    8200 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EA60B6E
P 7850 3850
F 0 "#PWR09" H 7850 3600 50  0001 C CNN
F 1 "GND" H 7855 3677 50  0000 C CNN
F 2 "" H 7850 3850 50  0001 C CNN
F 3 "" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR08
U 1 1 5EA60E78
P 7850 2150
F 0 "#PWR08" H 7850 2000 50  0001 C CNN
F 1 "+3V3" H 7865 2323 50  0000 C CNN
F 2 "" H 7850 2150 50  0001 C CNN
F 3 "" H 7850 2150 50  0001 C CNN
	1    7850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2800 7500 2500
Wire Wire Line
	7500 2500 7600 2500
Wire Wire Line
	8200 2500 8200 2800
Wire Wire Line
	7850 2150 7850 2500
Connection ~ 7850 2500
Wire Wire Line
	7850 2500 8200 2500
Wire Wire Line
	7500 3100 7500 3500
Wire Wire Line
	7500 3500 7850 3500
Wire Wire Line
	8200 3500 8200 3100
Wire Wire Line
	7850 3850 7850 3500
Connection ~ 7850 3500
Wire Wire Line
	7850 3500 8200 3500
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5EA619BD
P 7600 2350
F 0 "#FLG01" H 7600 2425 50  0001 C CNN
F 1 "PWR_FLAG" H 7600 2523 50  0000 C CNN
F 2 "" H 7600 2350 50  0001 C CNN
F 3 "~" H 7600 2350 50  0001 C CNN
	1    7600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5EA61D74
P 7850 3250
F 0 "#FLG02" H 7850 3325 50  0001 C CNN
F 1 "PWR_FLAG" H 7850 3423 50  0000 C CNN
F 2 "" H 7850 3250 50  0001 C CNN
F 3 "~" H 7850 3250 50  0001 C CNN
	1    7850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3500 7850 3250
Wire Wire Line
	7600 2350 7600 2500
Connection ~ 7600 2500
Wire Wire Line
	7600 2500 7850 2500
$Comp
L power:GND #PWR06
U 1 1 5EA63848
P 4200 4500
F 0 "#PWR06" H 4200 4250 50  0001 C CNN
F 1 "GND" H 4205 4327 50  0000 C CNN
F 2 "" H 4200 4500 50  0001 C CNN
F 3 "" H 4200 4500 50  0001 C CNN
	1    4200 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5EA65302
P 6550 4950
F 0 "D1" H 6543 4695 50  0000 C CNN
F 1 "LED" H 6543 4786 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6550 4950 50  0001 C CNN
F 3 "~" H 6550 4950 50  0001 C CNN
	1    6550 4950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5EA6591F
P 6550 5350
F 0 "D2" H 6543 5095 50  0000 C CNN
F 1 "LED" H 6543 5186 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6550 5350 50  0001 C CNN
F 3 "~" H 6550 5350 50  0001 C CNN
	1    6550 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 5EA65D83
P 6550 5700
F 0 "D3" H 6543 5445 50  0000 C CNN
F 1 "LED" H 6543 5536 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6550 5700 50  0001 C CNN
F 3 "~" H 6550 5700 50  0001 C CNN
	1    6550 5700
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5EA66132
P 6550 6050
F 0 "D4" H 6543 5795 50  0000 C CNN
F 1 "LED" H 6543 5886 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6550 6050 50  0001 C CNN
F 3 "~" H 6550 6050 50  0001 C CNN
	1    6550 6050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5EA6657F
P 7250 4950
F 0 "R1" V 7043 4950 50  0000 C CNN
F 1 "10kOhm" V 7134 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 4950 50  0001 C CNN
F 3 "~" H 7250 4950 50  0001 C CNN
	1    7250 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5EA668DA
P 7250 5350
F 0 "R2" V 7043 5350 50  0000 C CNN
F 1 "10kOhm" V 7134 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 5350 50  0001 C CNN
F 3 "~" H 7250 5350 50  0001 C CNN
	1    7250 5350
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EA66C12
P 7250 5700
F 0 "R3" V 7043 5700 50  0000 C CNN
F 1 "10kOhm" V 7134 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 5700 50  0001 C CNN
F 3 "~" H 7250 5700 50  0001 C CNN
	1    7250 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5EA66FFE
P 7250 6050
F 0 "R4" V 7043 6050 50  0000 C CNN
F 1 "10kOhm" V 7134 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 6050 50  0001 C CNN
F 3 "~" H 7250 6050 50  0001 C CNN
	1    7250 6050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EA67C19
P 7750 6250
F 0 "#PWR07" H 7750 6000 50  0001 C CNN
F 1 "GND" H 7755 6077 50  0000 C CNN
F 2 "" H 7750 6250 50  0001 C CNN
F 3 "" H 7750 6250 50  0001 C CNN
	1    7750 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4950 7750 4950
Wire Wire Line
	7400 6050 7750 6050
Wire Wire Line
	7750 4950 7750 5350
Connection ~ 7750 6050
Wire Wire Line
	7750 6050 7750 6250
Wire Wire Line
	7400 5700 7750 5700
Connection ~ 7750 5700
Wire Wire Line
	7750 5700 7750 6050
Wire Wire Line
	7400 5350 7750 5350
Connection ~ 7750 5350
Wire Wire Line
	7750 5350 7750 5700
Wire Wire Line
	6700 4950 7100 4950
Wire Wire Line
	6700 5350 7100 5350
Wire Wire Line
	6700 5700 7100 5700
Wire Wire Line
	6700 6050 7100 6050
$Comp
L Connector:Conn_01x20_Male J2
U 1 1 5EA6E6FC
P 1700 4600
F 0 "J2" H 1808 5681 50  0000 C CNN
F 1 "Conn_01x20_Male" H 1808 5590 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Horizontal" H 1700 4600 50  0001 C CNN
F 3 "~" H 1700 4600 50  0001 C CNN
	1    1700 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x20_Female J1
U 1 1 5EA6FAD6
P 1550 4600
F 0 "J1" H 1578 4576 50  0000 L CNN
F 1 "Conn_01x20_Female" H 1578 4485 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x20_P2.54mm_Horizontal" H 1550 4600 50  0001 C CNN
F 3 "~" H 1550 4600 50  0001 C CNN
	1    1550 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5500 2350 5500
$Comp
L power:GND #PWR03
U 1 1 5EA84AA8
P 2200 5950
F 0 "#PWR03" H 2200 5700 50  0001 C CNN
F 1 "GND" H 2205 5777 50  0000 C CNN
F 2 "" H 2200 5950 50  0001 C CNN
F 3 "" H 2200 5950 50  0001 C CNN
	1    2200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 5950 2200 5600
Wire Wire Line
	1900 5600 2200 5600
Wire Wire Line
	2200 5600 2200 5400
Wire Wire Line
	2200 3700 1900 3700
Connection ~ 2200 5600
Wire Wire Line
	1900 5400 2200 5400
Connection ~ 2200 5400
Wire Wire Line
	2200 5400 2200 5100
Wire Wire Line
	1900 4400 2200 4400
Connection ~ 2200 4400
Wire Wire Line
	2200 4400 2200 4000
Wire Wire Line
	1900 4000 2200 4000
Connection ~ 2200 4000
Wire Wire Line
	2200 4000 2200 3700
Wire Wire Line
	1900 5100 2200 5100
Connection ~ 2200 5100
Wire Wire Line
	2200 5100 2200 4400
$Comp
L power:GND #PWR02
U 1 1 5EA8BB06
P 1100 5950
F 0 "#PWR02" H 1100 5700 50  0001 C CNN
F 1 "GND" H 1105 5777 50  0000 C CNN
F 2 "" H 1100 5950 50  0001 C CNN
F 3 "" H 1100 5950 50  0001 C CNN
	1    1100 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 5EA8FE7D
P 1000 3250
F 0 "#PWR01" H 1000 3100 50  0001 C CNN
F 1 "+3V3" H 1015 3423 50  0000 C CNN
F 2 "" H 1000 3250 50  0001 C CNN
F 3 "" H 1000 3250 50  0001 C CNN
	1    1000 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 5500 1000 5500
Wire Wire Line
	1000 3250 1000 5500
Wire Wire Line
	1100 3700 1350 3700
Wire Wire Line
	1100 3700 1100 4000
Wire Wire Line
	1350 5600 1100 5600
Connection ~ 1100 5600
Wire Wire Line
	1100 5600 1100 5950
Wire Wire Line
	1100 5400 1350 5400
Connection ~ 1100 5400
Wire Wire Line
	1100 5400 1100 5600
Wire Wire Line
	1350 5100 1100 5100
Connection ~ 1100 5100
Wire Wire Line
	1100 5100 1100 5400
Wire Wire Line
	1100 4400 1350 4400
Connection ~ 1100 4400
Wire Wire Line
	1100 4400 1100 5100
Wire Wire Line
	1350 4000 1100 4000
Connection ~ 1100 4000
Wire Wire Line
	1100 4000 1100 4400
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5EA9CF97
P 9700 1700
F 0 "J3" H 9672 1582 50  0000 R CNN
F 1 "Conn_01x04_Male" H 9672 1673 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9700 1700 50  0001 C CNN
F 3 "~" H 9700 1700 50  0001 C CNN
	1    9700 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 5300 2950 5300
NoConn ~ 1900 4300
NoConn ~ 1900 4200
NoConn ~ 1900 4100
NoConn ~ 1900 3900
NoConn ~ 1900 3800
NoConn ~ 1350 4100
NoConn ~ 1350 4200
NoConn ~ 1350 4300
NoConn ~ 1350 4500
NoConn ~ 1350 4600
NoConn ~ 1350 4700
NoConn ~ 1350 4800
NoConn ~ 1350 4900
NoConn ~ 1350 5000
NoConn ~ 1350 5200
NoConn ~ 1350 5300
Wire Wire Line
	1350 3900 1150 3900
Wire Wire Line
	1150 3900 1150 2850
Wire Wire Line
	1350 3800 1250 3800
Wire Wire Line
	1250 3800 1250 2950
Wire Wire Line
	5200 6050 6400 6050
Wire Wire Line
	5350 5700 6400 5700
Wire Wire Line
	6400 5350 5450 5350
Wire Wire Line
	5500 4950 6400 4950
$Comp
L power:+3V3 #PWR010
U 1 1 5EB0ABD9
P 9250 1150
F 0 "#PWR010" H 9250 1000 50  0001 C CNN
F 1 "+3V3" H 9265 1323 50  0000 C CNN
F 2 "" H 9250 1150 50  0001 C CNN
F 3 "" H 9250 1150 50  0001 C CNN
	1    9250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 1150 9250 1500
$Comp
L power:GND #PWR011
U 1 1 5EB1BA1A
P 9250 2150
F 0 "#PWR011" H 9250 1900 50  0001 C CNN
F 1 "GND" H 9255 1977 50  0000 C CNN
F 2 "" H 9250 2150 50  0001 C CNN
F 3 "" H 9250 2150 50  0001 C CNN
	1    9250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2150 9250 1800
Wire Wire Line
	9250 1800 9500 1800
Wire Wire Line
	9250 1500 9500 1500
Wire Wire Line
	1900 4900 6150 4900
Wire Wire Line
	1900 4700 6100 4700
Wire Wire Line
	1900 4600 6050 4600
Wire Wire Line
	4000 4500 4000 5650
Wire Wire Line
	4000 5650 4700 5650
Wire Wire Line
	4700 5650 4700 4500
Wire Wire Line
	4700 4500 5700 4500
Wire Wire Line
	1900 4500 4000 4500
Wire Wire Line
	1900 4800 6200 4800
Wire Wire Line
	1900 5000 3150 5000
Wire Wire Line
	1900 5200 3050 5200
$EndSCHEMATC
