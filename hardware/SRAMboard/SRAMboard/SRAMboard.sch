EESchema Schematic File Version 4
LIBS:SRAMboard-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L kilib:IS66WV51216EBLL-70TLI U2
U 1 1 5D6AE48C
P 4350 4750
F 0 "U2" H 4375 6065 50  0000 C CNN
F 1 "IS66WV51216EBLL-70TLI" H 4375 5974 50  0000 C CNN
F 2 "Package_SO:TSOP-II-44_10.16x18.41mm_P0.8mm" H 4350 4750 50  0001 C CNN
F 3 "https://www.mouser.ee/datasheet/2/198/66WV51216EALL-EBLL-462627.pdf" H 4350 4750 50  0001 C CNN
	1    4350 4750
	1    0    0    -1  
$EndComp
Text GLabel 1000 4350 0    50   Input ~ 0
A0
Text GLabel 1000 4450 0    50   Input ~ 0
A1
Text GLabel 1000 4550 0    50   Input ~ 0
A2
Text GLabel 1000 4650 0    50   Input ~ 0
A3
Text GLabel 1000 4750 0    50   Input ~ 0
A4
Text GLabel 1000 4850 0    50   Input ~ 0
A5
Text GLabel 1000 4950 0    50   Input ~ 0
A6
Text GLabel 1000 5150 0    50   Input ~ 0
A8
Text GLabel 1000 5250 0    50   Input ~ 0
A9
Text GLabel 1000 5350 0    50   Input ~ 0
A10
Text GLabel 1000 5450 0    50   Input ~ 0
A11
Text GLabel 1500 4350 2    50   Input ~ 0
A12
Text GLabel 1500 4450 2    50   Input ~ 0
A13
Text GLabel 1500 4550 2    50   Input ~ 0
A14
Text GLabel 1500 4650 2    50   Input ~ 0
A15
Text GLabel 1500 4750 2    50   Input ~ 0
A16
Text GLabel 1500 4850 2    50   Input ~ 0
A17
Text GLabel 1500 4950 2    50   Input ~ 0
A18
$Comp
L power:GND #PWR03
U 1 1 5D6C94B6
P 1650 5600
F 0 "#PWR03" H 1650 5350 50  0001 C CNN
F 1 "GND" H 1655 5427 50  0000 C CNN
F 2 "" H 1650 5600 50  0001 C CNN
F 3 "" H 1650 5600 50  0001 C CNN
	1    1650 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 5D6C989D
P 2000 5600
F 0 "#PWR04" H 2000 5450 50  0001 C CNN
F 1 "+3V3" H 2015 5773 50  0000 C CNN
F 2 "" H 2000 5600 50  0001 C CNN
F 3 "" H 2000 5600 50  0001 C CNN
	1    2000 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 5250 2000 5250
Wire Wire Line
	2000 5250 2000 5550
Wire Wire Line
	1500 5350 1650 5350
Wire Wire Line
	1650 5350 1650 5500
Text GLabel 1500 5050 2    50   Input ~ 0
GND
Text GLabel 1500 5150 2    50   Input ~ 0
3V3
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J2
U 1 1 5D6CE918
P 7200 4600
F 0 "J2" H 7250 5417 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 7250 5326 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x13_P2.54mm_Vertical" H 7200 4600 50  0001 C CNN
F 3 "~" H 7200 4600 50  0001 C CNN
	1    7200 4600
	1    0    0    -1  
$EndComp
Text GLabel 7000 4000 0    50   Input ~ 0
CS0#
Text GLabel 7000 4300 0    50   Input ~ 0
OE#
Text GLabel 7000 4400 0    50   Input ~ 0
WE#
Text GLabel 7000 4500 0    50   Input ~ 0
UB#
Text GLabel 7000 4600 0    50   Input ~ 0
LB#
Text GLabel 7000 4700 0    50   Input ~ 0
IO0
Text GLabel 7000 4800 0    50   Input ~ 0
IO1
Text GLabel 7000 4900 0    50   Input ~ 0
IO2
Text GLabel 7000 5000 0    50   Input ~ 0
IO3
Text GLabel 7000 5100 0    50   Input ~ 0
IO4
Text GLabel 7000 5200 0    50   Input ~ 0
IO5
Text GLabel 7500 4000 2    50   Input ~ 0
IO6
Text GLabel 7500 4100 2    50   Input ~ 0
IO7
Text GLabel 7500 4200 2    50   Input ~ 0
IO8
Text GLabel 7500 4300 2    50   Input ~ 0
IO9
Text GLabel 7500 4400 2    50   Input ~ 0
IO10
Text GLabel 7500 4500 2    50   Input ~ 0
IO11
Text GLabel 7500 4600 2    50   Input ~ 0
IO12
Text GLabel 7500 4700 2    50   Input ~ 0
IO13
Text GLabel 7500 4800 2    50   Input ~ 0
IO14
Text GLabel 7500 4900 2    50   Input ~ 0
IO15
Text GLabel 3750 4200 0    50   Input ~ 0
CS0#
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J1
U 1 1 5D6EB6AA
P 1200 4950
F 0 "J1" H 1250 5767 50  0000 C CNN
F 1 "Conn_02x13_Odd_Even" H 1250 5676 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x13_P2.54mm_Vertical" H 1200 4950 50  0001 C CNN
F 3 "~" H 1200 4950 50  0001 C CNN
	1    1200 4950
	1    0    0    -1  
$EndComp
Text GLabel 1000 5050 0    50   Input ~ 0
A7
NoConn ~ 1500 5450
NoConn ~ 1500 5550
NoConn ~ 1000 5550
Text GLabel 3750 3700 0    50   Input ~ 0
A4
Text GLabel 3750 3800 0    50   Input ~ 0
A3
Text GLabel 3750 3900 0    50   Input ~ 0
A2
Text GLabel 3750 4000 0    50   Input ~ 0
A1
Text GLabel 3750 4100 0    50   Input ~ 0
A0
Text GLabel 3750 4300 0    50   Input ~ 0
IO0
Text GLabel 3750 4400 0    50   Input ~ 0
IO1
Text GLabel 3750 4500 0    50   Input ~ 0
IO2
Text GLabel 3750 4600 0    50   Input ~ 0
IO3
Text GLabel 3750 4700 0    50   Input ~ 0
3V3
Text GLabel 3750 4800 0    50   Input ~ 0
GND
Text GLabel 3750 4900 0    50   Input ~ 0
IO4
Text GLabel 3750 5000 0    50   Input ~ 0
IO5
Text GLabel 3750 5100 0    50   Input ~ 0
IO6
Text GLabel 3750 5200 0    50   Input ~ 0
IO7
Text GLabel 3750 5300 0    50   Input ~ 0
WE#
Text GLabel 3750 5400 0    50   Input ~ 0
A16
Text GLabel 3750 5500 0    50   Input ~ 0
A15
Text GLabel 3750 5600 0    50   Input ~ 0
A14
Text GLabel 3750 5700 0    50   Input ~ 0
A13
Text GLabel 3750 5800 0    50   Input ~ 0
A12
Text GLabel 5000 4300 2    50   Input ~ 0
IO15
Text GLabel 5000 3700 2    50   Input ~ 0
A5
Text GLabel 5000 3800 2    50   Input ~ 0
A6
Text GLabel 5000 3900 2    50   Input ~ 0
A7
Text GLabel 5000 4000 2    50   Input ~ 0
OE#
Text GLabel 5000 4100 2    50   Input ~ 0
UB#
Text GLabel 5000 4200 2    50   Input ~ 0
LB#
Text GLabel 5000 4400 2    50   Input ~ 0
IO14
Text GLabel 5000 5100 2    50   Input ~ 0
IO9
Text GLabel 5000 4500 2    50   Input ~ 0
IO13
Text GLabel 5000 4600 2    50   Input ~ 0
IO12
Text GLabel 5000 4900 2    50   Input ~ 0
IO11
Text GLabel 5000 5000 2    50   Input ~ 0
IO10
Text GLabel 5000 5200 2    50   Input ~ 0
IO8
Text GLabel 5000 5300 2    50   Input ~ 0
A18
Text GLabel 5000 5400 2    50   Input ~ 0
A8
Text GLabel 5000 5500 2    50   Input ~ 0
A9
Text GLabel 5000 5600 2    50   Input ~ 0
A10
Text GLabel 5000 5700 2    50   Input ~ 0
A11
Text GLabel 5000 5800 2    50   Input ~ 0
A17
$Comp
L power:GND #PWR06
U 1 1 5D743EDC
P 6100 4850
F 0 "#PWR06" H 6100 4600 50  0001 C CNN
F 1 "GND" H 6105 4677 50  0000 C CNN
F 2 "" H 6100 4850 50  0001 C CNN
F 3 "" H 6100 4850 50  0001 C CNN
	1    6100 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR05
U 1 1 5D746E81
P 5600 5050
F 0 "#PWR05" H 5600 4900 50  0001 C CNN
F 1 "+3V3" H 5615 5223 50  0000 C CNN
F 2 "" H 5600 5050 50  0001 C CNN
F 3 "" H 5600 5050 50  0001 C CNN
	1    5600 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 4800 5600 4800
Wire Wire Line
	5600 4800 5600 5050
Wire Wire Line
	5000 4700 6100 4700
Wire Wire Line
	6100 4700 6100 4850
Wire Wire Line
	6900 4100 7000 4100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D6C3E6A
P 2500 5500
F 0 "#FLG0101" H 2500 5575 50  0001 C CNN
F 1 "PWR_FLAG" H 2500 5673 50  0000 C CNN
F 2 "" H 2500 5500 50  0001 C CNN
F 3 "~" H 2500 5500 50  0001 C CNN
	1    2500 5500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5D6C42FB
P 2200 5050
F 0 "#FLG0102" H 2200 5125 50  0001 C CNN
F 1 "PWR_FLAG" H 2200 5223 50  0000 C CNN
F 2 "" H 2200 5050 50  0001 C CNN
F 3 "~" H 2200 5050 50  0001 C CNN
	1    2200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5500 2200 5500
Wire Wire Line
	2200 5500 2200 5050
Connection ~ 1650 5500
Wire Wire Line
	1650 5500 1650 5600
Wire Wire Line
	2000 5550 2500 5550
Wire Wire Line
	2500 5550 2500 5500
Connection ~ 2000 5550
Wire Wire Line
	2000 5550 2000 5600
NoConn ~ 6900 4100
NoConn ~ 7000 4200
NoConn ~ 7500 5000
NoConn ~ 7500 5100
NoConn ~ 7500 5200
$EndSCHEMATC
