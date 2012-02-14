EESchema Schematic File Version 2  date Fr 30 Dez 2011 10:09:52 CET
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:tinkerforge
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "Linear Poti Bricklet"
Date "30 dec 2011"
Rev "1.1"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2011, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7200 0    40   ~ 0
Copyright Tinkerforge GmbH 2011.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
NoConn ~ 4900 2900
Wire Wire Line
	5150 3150 5150 3000
Wire Wire Line
	5150 3000 4900 3000
Connection ~ 6050 4450
Wire Wire Line
	6050 4350 6050 4450
Wire Wire Line
	6500 4500 6500 4450
Wire Wire Line
	6800 3150 6900 3150
Wire Wire Line
	4900 3500 5250 3500
Wire Wire Line
	6050 4750 6500 4750
Wire Wire Line
	4900 3200 5250 3200
Connection ~ 5150 4550
Wire Wire Line
	5250 4450 5150 4450
Wire Wire Line
	5150 4450 5150 4850
Wire Wire Line
	5150 4750 5250 4750
Wire Wire Line
	4450 4050 4450 3950
Wire Wire Line
	4900 3400 5050 3400
Wire Wire Line
	5050 3400 5050 4650
Wire Wire Line
	5050 4650 5250 4650
Wire Wire Line
	5150 4550 5250 4550
Connection ~ 5150 4750
Wire Wire Line
	4900 3300 5250 3300
Wire Wire Line
	6050 4650 6500 4650
Wire Wire Line
	6950 2800 7150 2800
Wire Wire Line
	7150 2800 7150 3000
Wire Wire Line
	7400 3150 7500 3150
Wire Wire Line
	7500 3150 7500 3250
Wire Wire Line
	6050 4450 6100 4450
Wire Wire Line
	4900 3100 5000 3100
Wire Wire Line
	5000 3100 5000 2800
NoConn ~ 6050 4550
$Comp
L GND #PWR01
U 1 1 4CE528DC
P 6500 4500
F 0 "#PWR01" H 6500 4500 30  0001 C CNN
F 1 "GND" H 6500 4430 30  0001 C CNN
	1    6500 4500
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4CE528C6
P 6300 4450
F 0 "C1" V 6150 4450 50  0000 L CNN
F 1 "100nF" V 6400 4450 50  0000 L CNN
F 2 "0603" H 6300 4450 60  0001 C CNN
	1    6300 4450
	0    1    1    0   
$EndComp
$Comp
L DRILL U2
U 1 1 4C6534CF
P 10700 6500
F 0 "U2" H 10750 6550 60  0001 C CNN
F 1 "DRILL" H 10700 6500 60  0000 C CNN
F 2 "Drill" H 10700 6500 60  0001 C CNN
	1    10700 6500
	1    0    0    -1  
$EndComp
$Comp
L DRILL U3
U 1 1 4C6534CD
P 10700 6700
F 0 "U3" H 10750 6750 60  0001 C CNN
F 1 "DRILL" H 10700 6700 60  0000 C CNN
F 2 "Drill" H 10700 6700 60  0001 C CNN
	1    10700 6700
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C6534CA
P 11000 6700
F 0 "U5" H 11050 6750 60  0001 C CNN
F 1 "DRILL" H 11000 6700 60  0000 C CNN
F 2 "Drill" H 11000 6700 60  0001 C CNN
	1    11000 6700
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 4C6534C3
P 11000 6500
F 0 "U4" H 11050 6550 60  0001 C CNN
F 1 "DRILL" H 11000 6500 60  0000 C CNN
F 2 "Drill" H 11000 6500 60  0001 C CNN
	1    11000 6500
	1    0    0    -1  
$EndComp
NoConn ~ 4900 3800
NoConn ~ 4900 3700
NoConn ~ 4900 3600
NoConn ~ 7400 3200
$Comp
L RK11K113 RV1
U 1 1 4C65328C
P 7150 3150
F 0 "RV1" H 7250 3250 50  0000 C CNN
F 1 "F6005N" H 7150 3050 50  0000 C CNN
F 2 "F6005N" H 7150 3150 60  0001 C CNN
	1    7150 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 4C652DE8
P 7500 3250
F 0 "#PWR02" H 7500 3250 30  0001 C CNN
F 1 "GND" H 7500 3180 30  0001 C CNN
	1    7500 3250
	1    0    0    -1  
$EndComp
Text GLabel 6950 2800 0    60   Output ~ 0
IN_1
$Comp
L VCC #PWR03
U 1 1 4C652DAA
P 6800 3150
F 0 "#PWR03" H 6800 3250 30  0001 C CNN
F 1 "VCC" H 6800 3250 30  0000 C CNN
	1    6800 3150
	1    0    0    -1  
$EndComp
Text GLabel 5250 3500 2    60   Input ~ 0
IN_1
Text GLabel 6500 4750 2    60   Input ~ 0
SDA
Text GLabel 6500 4650 2    60   Input ~ 0
SCL
Text GLabel 5250 3300 2    60   Output ~ 0
SDA
Text GLabel 5250 3200 2    60   Output ~ 0
SCL
$Comp
L VCC #PWR04
U 1 1 4C5FD35E
P 6050 4350
F 0 "#PWR04" H 6050 4450 30  0001 C CNN
F 1 "VCC" H 6050 4450 30  0000 C CNN
	1    6050 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 4C5FD34E
P 5150 4850
F 0 "#PWR05" H 5150 4850 30  0001 C CNN
F 1 "GND" H 5150 4780 30  0001 C CNN
	1    5150 4850
	1    0    0    -1  
$EndComp
$Comp
L CAT24C U1
U 1 1 4C5FD337
P 5650 4850
F 0 "U1" H 5500 5350 60  0000 C CNN
F 1 "M24C64" H 5650 4850 60  0000 C CNN
F 2 "TSSOP8" H 5650 4850 60  0001 C CNN
	1    5650 4850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR06
U 1 1 4C5FCFB4
P 5000 2800
F 0 "#PWR06" H 5000 2900 30  0001 C CNN
F 1 "VCC" H 5000 2900 30  0000 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 4C5FCF5E
P 5150 3150
F 0 "#PWR07" H 5150 3150 30  0001 C CNN
F 1 "GND" H 5150 3080 30  0001 C CNN
	1    5150 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 4C5FCF4F
P 4450 4050
F 0 "#PWR08" H 4450 4050 30  0001 C CNN
F 1 "GND" H 4450 3980 30  0001 C CNN
	1    4450 4050
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 4C5FCF27
P 4450 3350
F 0 "P1" H 4200 3900 60  0000 C CNN
F 1 "CON-SENSOR" V 4650 3350 60  0000 C CNN
F 2 "CON-SENSOR" H 4450 3350 60  0001 C CNN
	1    4450 3350
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
