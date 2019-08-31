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
L kilib:IS66WV51216EBLL-70BLI U1
U 1 1 5D6ABEC0
P 2200 2150
F 0 "U1" H 2225 2815 50  0000 C CNN
F 1 "IS66WV51216EBLL-70BLI" H 2225 2724 50  0000 C CNN
F 2 "kifootp:BGA-48_6.0x8.0mm_Layout6x8_P0.75mm" H 2300 2450 50  0001 C CNN
F 3 "https://www.mouser.ee/datasheet/2/198/66WV51216EALL-EBLL-462627.pdf" H 2200 2150 50  0001 C CNN
	1    2200 2150
	1    0    0    -1  
$EndComp
$Comp
L kilib:IS66WV51216EBLL-70BLI U1
U 2 1 5D6ACA3A
P 4900 2100
F 0 "U1" H 4925 2765 50  0000 C CNN
F 1 "IS66WV51216EBLL-70BLI" H 4925 2674 50  0000 C CNN
F 2 "kifootp:BGA-48_6.0x8.0mm_Layout6x8_P0.75mm" H 5000 2400 50  0001 C CNN
F 3 "https://www.mouser.ee/datasheet/2/198/66WV51216EALL-EBLL-462627.pdf" H 4900 2100 50  0001 C CNN
	2    4900 2100
	1    0    0    -1  
$EndComp
$Comp
L kilib:IS66WV51216EBLL-70BLI U1
U 3 1 5D6AD8BD
P 7600 2100
F 0 "U1" H 7625 2765 50  0000 C CNN
F 1 "IS66WV51216EBLL-70BLI" H 7625 2674 50  0000 C CNN
F 2 "kifootp:BGA-48_6.0x8.0mm_Layout6x8_P0.75mm" H 7700 2400 50  0001 C CNN
F 3 "https://www.mouser.ee/datasheet/2/198/66WV51216EALL-EBLL-462627.pdf" H 7600 2100 50  0001 C CNN
	3    7600 2100
	1    0    0    -1  
$EndComp
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
$Comp
L Device:C C1
U 1 1 5D6B318A
P 9300 1900
F 0 "C1" H 9415 1946 50  0000 L CNN
F 1 "C" H 9415 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9338 1750 50  0001 C CNN
F 3 "~" H 9300 1900 50  0001 C CNN
	1    9300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D6B3B06
P 10450 1600
F 0 "C2" H 10565 1646 50  0000 L CNN
F 1 "C" H 10565 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10488 1450 50  0001 C CNN
F 3 "~" H 10450 1600 50  0001 C CNN
	1    10450 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 5D6B462C
P 9650 1300
F 0 "#PWR01" H 9650 1150 50  0001 C CNN
F 1 "+3V3" H 9665 1473 50  0000 C CNN
F 2 "" H 9650 1300 50  0001 C CNN
F 3 "" H 9650 1300 50  0001 C CNN
	1    9650 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5D6B5745
P 9650 2350
F 0 "#PWR02" H 9650 2100 50  0001 C CNN
F 1 "GND" H 9655 2177 50  0000 C CNN
F 2 "" H 9650 2350 50  0001 C CNN
F 3 "" H 9650 2350 50  0001 C CNN
	1    9650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1300 9650 1500
Wire Wire Line
	9300 1750 9650 1750
Wire Wire Line
	9300 2050 9300 2200
Wire Wire Line
	9300 2200 9650 2200
Wire Wire Line
	9650 2200 9650 2300
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D6B9CFA
P 9450 1500
F 0 "#FLG01" H 9450 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 9450 1673 50  0000 C CNN
F 2 "" H 9450 1500 50  0001 C CNN
F 3 "~" H 9450 1500 50  0001 C CNN
	1    9450 1500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5D6BB1B2
P 10000 2300
F 0 "#FLG02" H 10000 2375 50  0001 C CNN
F 1 "PWR_FLAG" H 10000 2473 50  0000 C CNN
F 2 "" H 10000 2300 50  0001 C CNN
F 3 "~" H 10000 2300 50  0001 C CNN
	1    10000 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1500 9650 1500
Connection ~ 9650 1500
Wire Wire Line
	9650 1500 9650 1650
Wire Wire Line
	9650 2300 10000 2300
Connection ~ 9650 2300
Wire Wire Line
	9650 2300 9650 2350
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
	2000 5250 2000 5600
Wire Wire Line
	1500 5350 1650 5350
Wire Wire Line
	1650 5350 1650 5600
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
Text GLabel 10450 1450 2    50   Input ~ 0
3V3
Text GLabel 10450 1750 2    50   Input ~ 0
GND
Text GLabel 7000 4000 0    50   Input ~ 0
CS0#
Text GLabel 6900 4100 0    50   Input ~ 0
CS1#
Text GLabel 7000 4200 0    50   Input ~ 0
CS2
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
Text GLabel 7500 5000 2    50   Input ~ 0
NC0
Text GLabel 7500 5100 2    50   Input ~ 0
NC1
Text GLabel 7500 5200 2    50   Input ~ 0
NC2
Text GLabel 2850 2400 2    50   Input ~ 0
NC0
Text GLabel 4300 2150 0    50   Input ~ 0
NC1
Text GLabel 8250 2450 2    50   Input ~ 0
NC2
Text GLabel 3750 4200 0    50   Input ~ 0
CS0#
Text GLabel 8250 1750 2    50   Input ~ 0
CS2
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
Text GLabel 1600 1800 0    50   Input ~ 0
LB#
Text GLabel 1600 1900 0    50   Input ~ 0
IO8
Text GLabel 1600 2000 0    50   Input ~ 0
IO9
Text GLabel 1600 2100 0    50   Input ~ 0
GND
Text GLabel 1600 2200 0    50   Input ~ 0
3V3
Text GLabel 1600 2300 0    50   Input ~ 0
IO14
Text GLabel 1600 2400 0    50   Input ~ 0
IO15
Text GLabel 1600 2500 0    50   Input ~ 0
A18
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
Text GLabel 4300 1750 0    50   Input ~ 0
A0
Text GLabel 4300 1850 0    50   Input ~ 0
A3
Text GLabel 4300 1950 0    50   Input ~ 0
A5
Text GLabel 4300 2050 0    50   Input ~ 0
A17
Text GLabel 4300 2250 0    50   Input ~ 0
A14
Text GLabel 4300 2350 0    50   Input ~ 0
A12
Text GLabel 4300 2450 0    50   Input ~ 0
A9
Text GLabel 7000 1750 0    50   Input ~ 0
A2
Text GLabel 7000 1950 0    50   Input ~ 0
IO1
Text GLabel 7000 2050 0    50   Input ~ 0
IO3
Text GLabel 7000 2150 0    50   Input ~ 0
IO4
Text GLabel 7000 2250 0    50   Input ~ 0
IO5
Text GLabel 7000 2350 0    50   Input ~ 0
WE#
Text GLabel 7000 2450 0    50   Input ~ 0
A11
Text GLabel 2850 1800 2    50   Input ~ 0
OE#
Text GLabel 2850 1900 2    50   Input ~ 0
UB#
Text GLabel 2850 2000 2    50   Input ~ 0
IO10
Text GLabel 2850 2100 2    50   Input ~ 0
IO11
Text GLabel 2850 2200 2    50   Input ~ 0
IO12
Text GLabel 2850 2300 2    50   Input ~ 0
IO13
Text GLabel 2850 2500 2    50   Input ~ 0
A8
Text GLabel 5550 2350 2    50   Input ~ 0
A13
Text GLabel 5550 1750 2    50   Input ~ 0
A1
Text GLabel 5550 1850 2    50   Input ~ 0
A4
Text GLabel 5550 1950 2    50   Input ~ 0
A6
Text GLabel 5550 2050 2    50   Input ~ 0
A7
Text GLabel 5550 2150 2    50   Input ~ 0
A16
Text GLabel 5550 2250 2    50   Input ~ 0
A15
Text GLabel 5550 2450 2    50   Input ~ 0
A10
Text GLabel 8250 2350 2    50   Input ~ 0
IO7
Text GLabel 8250 1850 2    50   Input ~ 0
IO0
Text GLabel 8250 1950 2    50   Input ~ 0
IO2
Text GLabel 8250 2250 2    50   Input ~ 0
IO6
Wire Wire Line
	8250 2150 9000 2150
Wire Wire Line
	9000 2150 9000 2300
Wire Wire Line
	9000 2300 9650 2300
Wire Wire Line
	8250 2050 8900 2050
Wire Wire Line
	8900 2050 8900 1650
Wire Wire Line
	8900 1650 9650 1650
Connection ~ 9650 1650
Wire Wire Line
	9650 1650 9650 1750
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
Text GLabel 7000 1850 0    50   Input ~ 0
CS1#
$EndSCHEMATC
