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
L Analog_ADC:AD9283 U1
U 1 1 5DF494B5
P 5450 2900
F 0 "U1" H 5450 3881 50  0000 C CNN
F 1 "AD9283" H 5450 3790 50  0000 C CNN
F 2 "Package_SO:SSOP-20_5.3x7.2mm_P0.65mm" H 5450 2900 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD9283.pdf" H 5450 2900 50  0001 C CNN
	1    5450 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DF4A28E
P 4500 3450
F 0 "C1" H 4615 3496 50  0000 L CNN
F 1 "0.1uF" H 4615 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4538 3300 50  0001 C CNN
F 3 "~" H 4500 3450 50  0001 C CNN
	1    4500 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DF4B0FA
P 6100 1400
F 0 "C2" H 6215 1446 50  0000 L CNN
F 1 "0.1uF" H 6215 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6138 1250 50  0001 C CNN
F 3 "~" H 6100 1400 50  0001 C CNN
	1    6100 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5DF4B3B0
P 6600 1400
F 0 "C3" H 6715 1446 50  0000 L CNN
F 1 "0.1uF" H 6715 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 1250 50  0001 C CNN
F 3 "~" H 6600 1400 50  0001 C CNN
	1    6600 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5DF4B69D
P 7050 1400
F 0 "C4" H 7165 1446 50  0000 L CNN
F 1 "0.1uF" H 7165 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7088 1250 50  0001 C CNN
F 3 "~" H 7050 1400 50  0001 C CNN
	1    7050 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5DF4BE4B
P 6600 1850
F 0 "#PWR08" H 6600 1600 50  0001 C CNN
F 1 "GND" H 6605 1677 50  0000 C CNN
F 2 "" H 6600 1850 50  0001 C CNN
F 3 "" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR07
U 1 1 5DF4C425
P 6600 900
F 0 "#PWR07" H 6600 750 50  0001 C CNN
F 1 "+3V3" H 6615 1073 50  0000 C CNN
F 2 "" H 6600 900 50  0001 C CNN
F 3 "" H 6600 900 50  0001 C CNN
	1    6600 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1250 6100 1050
Wire Wire Line
	6100 1050 6600 1050
Wire Wire Line
	7050 1050 7050 1250
Wire Wire Line
	6600 900  6600 1050
Connection ~ 6600 1050
Wire Wire Line
	6600 1050 7050 1050
Wire Wire Line
	6600 1250 6600 1050
Wire Wire Line
	6100 1550 6100 1700
Wire Wire Line
	6100 1700 6600 1700
Wire Wire Line
	7050 1700 7050 1550
Wire Wire Line
	6600 1850 6600 1700
Connection ~ 6600 1700
Wire Wire Line
	6600 1700 7050 1700
Wire Wire Line
	6600 1550 6600 1700
Wire Wire Line
	4500 3300 4750 3300
Wire Wire Line
	4750 3100 4500 3100
Wire Wire Line
	4500 3100 4500 3300
Connection ~ 4500 3300
$Comp
L power:GND #PWR05
U 1 1 5DF4E85B
P 5050 3900
F 0 "#PWR05" H 5050 3650 50  0001 C CNN
F 1 "GND" H 5055 3727 50  0000 C CNN
F 2 "" H 5050 3900 50  0001 C CNN
F 3 "" H 5050 3900 50  0001 C CNN
	1    5050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3600 4500 3750
Wire Wire Line
	4500 3750 5050 3750
Wire Wire Line
	5050 3750 5050 3900
Wire Wire Line
	5050 3750 5350 3750
Wire Wire Line
	5550 3750 5550 3700
Connection ~ 5050 3750
Wire Wire Line
	5450 3700 5450 3750
Connection ~ 5450 3750
Wire Wire Line
	5450 3750 5550 3750
Wire Wire Line
	5350 3700 5350 3750
Connection ~ 5350 3750
Wire Wire Line
	5350 3750 5450 3750
$Comp
L power:+3V3 #PWR06
U 1 1 5DF50782
P 5450 1750
F 0 "#PWR06" H 5450 1600 50  0001 C CNN
F 1 "+3V3" H 5465 1923 50  0000 C CNN
F 2 "" H 5450 1750 50  0001 C CNN
F 3 "" H 5450 1750 50  0001 C CNN
	1    5450 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2100 5550 2000
Wire Wire Line
	5550 2000 5450 2000
Wire Wire Line
	5450 2000 5450 1750
Wire Wire Line
	5250 2100 5350 2100
Wire Wire Line
	5450 2100 5450 2000
Connection ~ 5350 2100
Wire Wire Line
	5350 2100 5450 2100
Connection ~ 5450 2000
Wire Wire Line
	6150 3400 6350 3400
Wire Wire Line
	6350 3400 6350 3750
Wire Wire Line
	6350 3750 5550 3750
Connection ~ 5550 3750
$Comp
L Connector:Conn_01x20_Female J4
U 1 1 5DF5206A
P 7400 3100
F 0 "J4" H 7428 3076 50  0000 L CNN
F 1 "Conn_01x20_Female" H 7428 2985 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Horizontal" H 7400 3100 50  0001 C CNN
F 3 "~" H 7400 3100 50  0001 C CNN
	1    7400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2400 7200 2400
Wire Wire Line
	6150 2500 7200 2500
Wire Wire Line
	6150 2600 7200 2600
Wire Wire Line
	6150 2700 7200 2700
Wire Wire Line
	6150 2800 7200 2800
Wire Wire Line
	6150 2900 7200 2900
Wire Wire Line
	6150 3000 7200 3000
Wire Wire Line
	6150 3100 7200 3100
Wire Wire Line
	6150 3300 7200 3300
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J3
U 1 1 5DF5B1E1
P 2750 1700
F 0 "J3" H 2800 2017 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 2800 1926 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 2750 1700 50  0001 C CNN
F 3 "~" H 2750 1700 50  0001 C CNN
	1    2750 1700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5DF5BF23
P 1900 1450
F 0 "#FLG01" H 1900 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 1900 1623 50  0000 C CNN
F 2 "" H 1900 1450 50  0001 C CNN
F 3 "~" H 1900 1450 50  0001 C CNN
	1    1900 1450
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5DF5C552
P 3800 1400
F 0 "#FLG02" H 3800 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 3800 1573 50  0000 C CNN
F 2 "" H 3800 1400 50  0001 C CNN
F 3 "~" H 3800 1400 50  0001 C CNN
	1    3800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 5DF5C9D4
P 2250 1450
F 0 "#PWR01" H 2250 1300 50  0001 C CNN
F 1 "+3V3" H 2265 1623 50  0000 C CNN
F 2 "" H 2250 1450 50  0001 C CNN
F 3 "" H 2250 1450 50  0001 C CNN
	1    2250 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5DF5D263
P 3500 2050
F 0 "#PWR04" H 3500 1800 50  0001 C CNN
F 1 "GND" H 3505 1877 50  0000 C CNN
F 2 "" H 3500 2050 50  0001 C CNN
F 3 "" H 3500 2050 50  0001 C CNN
	1    3500 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1900 2250 1900
Wire Wire Line
	2250 1900 2250 1800
Wire Wire Line
	1900 1450 2250 1450
Connection ~ 2250 1450
Wire Wire Line
	2550 1800 2250 1800
Connection ~ 2250 1800
Wire Wire Line
	2250 1800 2250 1700
Wire Wire Line
	2550 1700 2250 1700
Connection ~ 2250 1700
Wire Wire Line
	2250 1700 2250 1600
Wire Wire Line
	2550 1600 2250 1600
Connection ~ 2250 1600
Wire Wire Line
	2250 1600 2250 1450
Wire Wire Line
	3500 2050 3500 1900
Wire Wire Line
	3500 1600 3050 1600
Wire Wire Line
	3800 1400 3500 1400
Wire Wire Line
	3500 1400 3500 1600
Connection ~ 3500 1600
Wire Wire Line
	3050 1700 3500 1700
Connection ~ 3500 1700
Wire Wire Line
	3500 1700 3500 1600
Wire Wire Line
	3050 1800 3500 1800
Connection ~ 3500 1800
Wire Wire Line
	3500 1800 3500 1700
Wire Wire Line
	3050 1900 3500 1900
Connection ~ 3500 1900
Wire Wire Line
	3500 1900 3500 1800
NoConn ~ 7200 3200
NoConn ~ 7200 4100
NoConn ~ 7200 4000
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5DF6C738
P 2150 2800
F 0 "J1" H 2258 3081 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2258 2990 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2150 2800 50  0001 C CNN
F 3 "~" H 2150 2800 50  0001 C CNN
	1    2150 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5DF6DA43
P 2150 3300
F 0 "J2" H 2258 3581 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2258 3490 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2150 3300 50  0001 C CNN
F 3 "~" H 2150 3300 50  0001 C CNN
	1    2150 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5DF70B1C
P 2900 3550
F 0 "#PWR03" H 2900 3300 50  0001 C CNN
F 1 "GND" H 2905 3377 50  0000 C CNN
F 2 "" H 2900 3550 50  0001 C CNN
F 3 "" H 2900 3550 50  0001 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2900 2900 2900
Wire Wire Line
	2900 2900 2900 3400
Wire Wire Line
	2350 3400 2900 3400
Connection ~ 2900 3400
Wire Wire Line
	2900 3400 2900 3550
$Comp
L power:+3V3 #PWR02
U 1 1 5DF76983
P 2750 2400
F 0 "#PWR02" H 2750 2250 50  0001 C CNN
F 1 "+3V3" H 2765 2573 50  0000 C CNN
F 2 "" H 2750 2400 50  0001 C CNN
F 3 "" H 2750 2400 50  0001 C CNN
	1    2750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3200 2700 3200
Wire Wire Line
	2700 3200 2700 2700
Wire Wire Line
	2700 2400 2750 2400
Wire Wire Line
	2350 2700 2700 2700
Connection ~ 2700 2700
Wire Wire Line
	2700 2700 2700 2400
Wire Wire Line
	2350 2800 3700 2800
Wire Wire Line
	3700 2800 3700 2500
Wire Wire Line
	3700 2500 4750 2500
Wire Wire Line
	4750 2700 4050 2700
Wire Wire Line
	4050 2700 4050 3300
Wire Wire Line
	4050 3300 2350 3300
NoConn ~ 7200 2200
NoConn ~ 7200 2300
$Comp
L Device:LED D1
U 1 1 5DF85C3A
P 5900 4550
F 0 "D1" V 5939 4433 50  0000 R CNN
F 1 "LED" V 5848 4433 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5900 4550 50  0001 C CNN
F 3 "~" H 5900 4550 50  0001 C CNN
	1    5900 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5DF8703F
P 6200 4550
F 0 "D2" V 6239 4433 50  0000 R CNN
F 1 "LED" V 6148 4433 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6200 4550 50  0001 C CNN
F 3 "~" H 6200 4550 50  0001 C CNN
	1    6200 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 5DF89034
P 6450 4550
F 0 "D3" V 6489 4433 50  0000 R CNN
F 1 "LED" V 6398 4433 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6450 4550 50  0001 C CNN
F 3 "~" H 6450 4550 50  0001 C CNN
	1    6450 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 5DF8AE8D
P 6650 4550
F 0 "D4" V 6689 4433 50  0000 R CNN
F 1 "LED" V 6598 4433 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6650 4550 50  0001 C CNN
F 3 "~" H 6650 4550 50  0001 C CNN
	1    6650 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 5DF8CEB4
P 6850 4550
F 0 "D5" V 6889 4433 50  0000 R CNN
F 1 "LED" V 6798 4433 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 6850 4550 50  0001 C CNN
F 3 "~" H 6850 4550 50  0001 C CNN
	1    6850 4550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5DF8EF38
P 5900 5000
F 0 "R1" H 5970 5046 50  0000 L CNN
F 1 "10 kOhm" H 5970 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5830 5000 50  0001 C CNN
F 3 "~" H 5900 5000 50  0001 C CNN
	1    5900 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DF9048D
P 6200 5000
F 0 "R2" H 6270 5046 50  0000 L CNN
F 1 "10 kOhm" H 6270 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6130 5000 50  0001 C CNN
F 3 "~" H 6200 5000 50  0001 C CNN
	1    6200 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DF9243D
P 6450 5000
F 0 "R3" H 6520 5046 50  0000 L CNN
F 1 "10 kOhm" H 6520 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6380 5000 50  0001 C CNN
F 3 "~" H 6450 5000 50  0001 C CNN
	1    6450 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DF943EA
P 6650 5000
F 0 "R4" H 6720 5046 50  0000 L CNN
F 1 "10 kOhm" H 6720 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6580 5000 50  0001 C CNN
F 3 "~" H 6650 5000 50  0001 C CNN
	1    6650 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DF9644A
P 6850 5000
F 0 "R5" H 6920 5046 50  0000 L CNN
F 1 "10 kOhm" H 6920 4955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 5000 50  0001 C CNN
F 3 "~" H 6850 5000 50  0001 C CNN
	1    6850 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DF992D2
P 6350 5400
F 0 "#PWR09" H 6350 5150 50  0001 C CNN
F 1 "GND" H 6355 5227 50  0000 C CNN
F 2 "" H 6350 5400 50  0001 C CNN
F 3 "" H 6350 5400 50  0001 C CNN
	1    6350 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5150 5900 5300
Wire Wire Line
	5900 5300 6200 5300
Wire Wire Line
	6350 5300 6350 5400
Wire Wire Line
	6350 5300 6450 5300
Wire Wire Line
	6850 5300 6850 5150
Connection ~ 6350 5300
Wire Wire Line
	6650 5150 6650 5300
Connection ~ 6650 5300
Wire Wire Line
	6650 5300 6850 5300
Wire Wire Line
	6450 5150 6450 5300
Connection ~ 6450 5300
Wire Wire Line
	6450 5300 6650 5300
Wire Wire Line
	6200 5150 6200 5300
Connection ~ 6200 5300
Wire Wire Line
	6200 5300 6350 5300
Wire Wire Line
	5900 4700 5900 4850
Wire Wire Line
	6200 4850 6200 4700
Wire Wire Line
	6450 4850 6450 4700
Wire Wire Line
	6650 4850 6650 4700
Wire Wire Line
	6850 4700 6850 4850
Wire Wire Line
	7200 3400 6500 3400
Wire Wire Line
	6500 3400 6500 3900
Wire Wire Line
	6500 3900 5900 3900
Wire Wire Line
	5900 3900 5900 4400
Wire Wire Line
	6200 4400 6200 4000
Wire Wire Line
	6200 4000 6600 4000
Wire Wire Line
	6600 4000 6600 3500
Wire Wire Line
	6600 3500 7200 3500
Wire Wire Line
	7200 3600 6650 3600
Wire Wire Line
	6650 3600 6650 4050
Wire Wire Line
	6650 4050 6450 4050
Wire Wire Line
	6450 4050 6450 4400
Wire Wire Line
	6650 4400 6650 4150
Wire Wire Line
	6650 4150 6750 4150
Wire Wire Line
	6750 4150 6750 3700
Wire Wire Line
	6750 3700 7200 3700
Wire Wire Line
	7200 3800 6800 3800
Wire Wire Line
	6800 3800 6800 4400
Wire Wire Line
	6800 4400 6850 4400
NoConn ~ 7200 3900
$EndSCHEMATC
