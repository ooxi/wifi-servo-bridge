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
L Connector_Generic:Conn_01x02 J1
U 1 1 613E490B
P 3400 2500
F 0 "J1" H 3480 2492 50  0000 L CNN
F 1 "Conn_01x02" H 3480 2401 50  0000 L CNN
F 2 "WifiServoBridge:Power Connector" H 3400 2500 50  0001 C CNN
F 3 "~" H 3400 2500 50  0001 C CNN
	1    3400 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 613E5D1B
P 3400 2900
F 0 "J2" H 3480 2892 50  0000 L CNN
F 1 "Conn_01x02" H 3480 2801 50  0000 L CNN
F 2 "WifiServoBridge:Power Connector" H 3400 2900 50  0001 C CNN
F 3 "~" H 3400 2900 50  0001 C CNN
	1    3400 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x19 J3
U 1 1 613E6FF3
P 7500 3400
F 0 "J3" H 7580 3442 50  0000 L CNN
F 1 "Conn_01x19" H 7580 3351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x19_P2.54mm_Vertical" H 7500 3400 50  0001 C CNN
F 3 "~" H 7500 3400 50  0001 C CNN
	1    7500 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 613EBC4E
P 10000 2600
F 0 "J5" H 10080 2642 50  0000 L CNN
F 1 "Conn_01x03" H 10080 2551 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 2600 50  0001 C CNN
F 3 "~" H 10000 2600 50  0001 C CNN
	1    10000 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 613F02FC
P 10000 3100
F 0 "J6" H 10080 3142 50  0000 L CNN
F 1 "Conn_01x03" H 10080 3051 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 3100 50  0001 C CNN
F 3 "~" H 10000 3100 50  0001 C CNN
	1    10000 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 613F171F
P 10000 3600
F 0 "J7" H 10080 3642 50  0000 L CNN
F 1 "Conn_01x03" H 10080 3551 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 3600 50  0001 C CNN
F 3 "~" H 10000 3600 50  0001 C CNN
	1    10000 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J8
U 1 1 613F319C
P 10000 4100
F 0 "J8" H 10080 4142 50  0000 L CNN
F 1 "Conn_01x03" H 10080 4051 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 4100 50  0001 C CNN
F 3 "~" H 10000 4100 50  0001 C CNN
	1    10000 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J9
U 1 1 613F5A4F
P 10000 4600
F 0 "J9" H 10080 4642 50  0000 L CNN
F 1 "Conn_01x03" H 10080 4551 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 4600 50  0001 C CNN
F 3 "~" H 10000 4600 50  0001 C CNN
	1    10000 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J10
U 1 1 613F6FC4
P 10000 5100
F 0 "J10" H 10080 5142 50  0000 L CNN
F 1 "Conn_01x03" H 10080 5051 50  0000 L CNN
F 2 "WifiServoBridge:Servo Connector" H 10000 5100 50  0001 C CNN
F 3 "~" H 10000 5100 50  0001 C CNN
	1    10000 5100
	1    0    0    -1  
$EndComp
Text GLabel 3200 2500 0    50   Input ~ 0
SERVO_VCC
Text GLabel 3200 2600 0    50   Input ~ 0
SERVO_GND
Text GLabel 3200 2900 0    50   Input ~ 0
MCU_+5V
Text GLabel 3200 3000 0    50   Input ~ 0
MCU_GND
Text GLabel 9800 2600 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 3100 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 2700 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 3200 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 3600 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 4100 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 4600 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 5100 0    50   Input ~ 0
SERVO_VCC
Text GLabel 9800 3700 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 4200 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 4700 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 5200 0    50   Input ~ 0
SERVO_GND
Text GLabel 9800 2500 0    50   Input ~ 0
MCU_GPIO5
Text GLabel 9800 3000 0    50   Input ~ 0
MCU_GPIO17
Text GLabel 9800 3500 0    50   Input ~ 0
MCU_GPIO16
Text GLabel 9800 4000 0    50   Input ~ 0
MCU_GPIO4
Text GLabel 9800 4500 0    50   Input ~ 0
MCU_GPIO2
Text GLabel 9800 5000 0    50   Input ~ 0
MCU_GPIO15
Text GLabel 5700 2550 2    50   Input ~ 0
MCU_GPIO2
Text GLabel 5700 2750 2    50   Input ~ 0
MCU_GPIO4
Text GLabel 5700 3450 2    50   Input ~ 0
MCU_GPIO12
Text GLabel 5700 3550 2    50   Input ~ 0
MCU_GPIO13
Text GLabel 5700 3650 2    50   Input ~ 0
MCU_GPIO14
Text GLabel 5700 2850 2    50   Input ~ 0
MCU_GPIO5
$Comp
L Connector_Generic:Conn_01x19 J4
U 1 1 613EA2C8
P 8200 3400
F 0 "J4" H 8280 3442 50  0000 L CNN
F 1 "Conn_01x19" H 8280 3351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x19_P2.54mm_Vertical" H 8200 3400 50  0001 C CNN
F 3 "~" H 8200 3400 50  0001 C CNN
	1    8200 3400
	-1   0    0    -1  
$EndComp
Text GLabel 7300 2500 0    50   Input ~ 0
MCU_+3V3
Text GLabel 7300 2600 0    50   Input ~ 0
MCU_EN
Text GLabel 7300 2700 0    50   Input ~ 0
MCU_SP
Text GLabel 7300 2800 0    50   Input ~ 0
MCU_SN
Text GLabel 7300 2900 0    50   Input ~ 0
MCU_GPIO34
Text GLabel 7300 3000 0    50   Input ~ 0
MCU_GPIO35
Text GLabel 7300 3100 0    50   Input ~ 0
MCU_GPIO32
Text GLabel 7300 3200 0    50   Input ~ 0
MCU_GPIO33
Text GLabel 7300 3300 0    50   Input ~ 0
MCU_GPIO25
Text GLabel 7300 3400 0    50   Input ~ 0
MCU_GPIO26
Text GLabel 7300 3500 0    50   Input ~ 0
MCU_GPIO27
Text GLabel 7300 3600 0    50   Input ~ 0
MCU_GPIO14
Text GLabel 7300 3700 0    50   Input ~ 0
MCU_GPIO12
Text GLabel 7300 3800 0    50   Input ~ 0
MCU_GND
Text GLabel 7300 3900 0    50   Input ~ 0
MCU_GPIO13
Text GLabel 7300 4000 0    50   Input ~ 0
MCU_GPIO9
Text GLabel 7300 4100 0    50   Input ~ 0
MCU_GPIO10
Text GLabel 7300 4200 0    50   Input ~ 0
MCU_CMD
Text GLabel 7300 4300 0    50   Input ~ 0
MCU_+5V
Text GLabel 8400 2500 2    50   Input ~ 0
MCU_GND
Text GLabel 8400 2600 2    50   Input ~ 0
MCU_GPIO23
Text GLabel 8400 2700 2    50   Input ~ 0
MCU_GPIO22
Text GLabel 8400 2900 2    50   Input ~ 0
MCU_GPIO3
Text GLabel 8400 3000 2    50   Input ~ 0
MCU_GPIO21
Text GLabel 8400 3100 2    50   Input ~ 0
MCU_GND
Text GLabel 8400 3200 2    50   Input ~ 0
MCU_GPIO19
Text GLabel 8400 3300 2    50   Input ~ 0
MCU_GPIO18
Text GLabel 8400 3400 2    50   Input ~ 0
MCU_GPIO5
Text GLabel 8400 3500 2    50   Input ~ 0
MCU_GPIO17
Text GLabel 8400 3600 2    50   Input ~ 0
MCU_GPIO16
Text GLabel 8400 3700 2    50   Input ~ 0
MCU_GPIO4
Text GLabel 8400 3800 2    50   Input ~ 0
MCU_GPIO0
Text GLabel 8400 3900 2    50   Input ~ 0
MCU_GPIO2
Text GLabel 8400 4000 2    50   Input ~ 0
MCU_GPIO15
Text GLabel 8400 4300 2    50   Input ~ 0
DEBUG_LED
Text GLabel 8400 4200 2    50   Input ~ 0
MCU_GPIO7
Text GLabel 8400 4100 2    50   Input ~ 0
MCU_GPIO8
Text GLabel 8400 2800 2    50   Input ~ 0
MCU_GPIO1
Text GLabel 5150 2150 1    50   Input ~ 0
MCU_+5V
Text GLabel 5100 5350 3    50   Input ~ 0
MCU_GND
$Comp
L WifiServoBridge:ESP32NodeMCU U1
U 1 1 6143E7D2
P 5100 2350
F 0 "U1" V 4650 -450 50  0000 C CNN
F 1 "ESP32NodeMCU" V 4750 -200 50  0000 C CNN
F 2 "WifiServoBridge:ESP32 NodeMCU" H 5100 2350 50  0001 C CNN
F 3 "" H 5100 2350 50  0001 C CNN
	1    5100 2350
	1    0    0    -1  
$EndComp
Text GLabel 4450 2350 0    50   Input ~ 0
MCU_EN
Text GLabel 4450 2450 0    50   Input ~ 0
MCU_SP
Text GLabel 4450 2550 0    50   Input ~ 0
MCU_SN
Text GLabel 4450 2650 0    50   Input ~ 0
MCU_CMD
Text GLabel 5700 2350 2    50   Input ~ 0
MCU_GPIO0
Text GLabel 5700 2450 2    50   Input ~ 0
MCU_GPIO1
Text GLabel 5700 2650 2    50   Input ~ 0
MCU_GPIO3
Text GLabel 5700 2950 2    50   Input ~ 0
DEBUG_LED
Text GLabel 5700 3050 2    50   Input ~ 0
MCU_GPIO7
Text GLabel 5700 3150 2    50   Input ~ 0
MCU_GPIO8
Text GLabel 5700 3250 2    50   Input ~ 0
MCU_GPIO9
Text GLabel 5700 3350 2    50   Input ~ 0
MCU_GPIO10
Text GLabel 5700 3750 2    50   Input ~ 0
MCU_GPIO15
Text GLabel 5700 3850 2    50   Input ~ 0
MCU_GPIO16
Text GLabel 5700 3950 2    50   Input ~ 0
MCU_GPIO17
Text GLabel 5700 4050 2    50   Input ~ 0
MCU_GPIO18
Text GLabel 5700 4150 2    50   Input ~ 0
MCU_GPIO19
Text GLabel 5700 4250 2    50   Input ~ 0
MCU_GPIO21
Text GLabel 5700 4350 2    50   Input ~ 0
MCU_GPIO22
Text GLabel 5700 4450 2    50   Input ~ 0
MCU_GPIO23
Text GLabel 5700 4550 2    50   Input ~ 0
MCU_GPIO25
Text GLabel 5700 4650 2    50   Input ~ 0
MCU_GPIO26
Text GLabel 5700 4750 2    50   Input ~ 0
MCU_GPIO27
Text GLabel 5700 4850 2    50   Input ~ 0
MCU_GPIO32
Text GLabel 5700 4950 2    50   Input ~ 0
MCU_GPIO33
Text GLabel 5700 5050 2    50   Input ~ 0
MCU_GPIO34
Text GLabel 5700 5150 2    50   Input ~ 0
MCU_GPIO35
$Comp
L Device:LED D2
U 1 1 6148131F
P 8050 5500
F 0 "D2" H 8043 5245 50  0000 C CNN
F 1 "MCU" H 8043 5336 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 8050 5500 50  0001 C CNN
F 3 "~" H 8050 5500 50  0001 C CNN
	1    8050 5500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 61482E7F
P 8050 6050
F 0 "D3" H 8043 5795 50  0000 C CNN
F 1 "DEBUG" H 8043 5886 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 8050 6050 50  0001 C CNN
F 3 "~" H 8050 6050 50  0001 C CNN
	1    8050 6050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 6148821F
P 7550 5500
F 0 "R2" V 7343 5500 50  0000 C CNN
F 1 "660 Ω" V 7434 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7480 5500 50  0001 C CNN
F 3 "~" H 7550 5500 50  0001 C CNN
	1    7550 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 614892B8
P 7550 6050
F 0 "R3" V 7343 6050 50  0000 C CNN
F 1 "660 Ω" V 7434 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7480 6050 50  0001 C CNN
F 3 "~" H 7550 6050 50  0001 C CNN
	1    7550 6050
	0    1    1    0   
$EndComp
Text GLabel 7200 5500 0    50   Input ~ 0
MCU_+3V3
Text GLabel 5050 2150 1    50   Input ~ 0
MCU_+3V3
Text GLabel 7200 6050 0    50   Input ~ 0
DEBUG_LED
Text GLabel 8400 5500 2    50   Input ~ 0
MCU_GND
Text GLabel 8400 6050 2    50   Input ~ 0
MCU_GND
$Comp
L Device:LED D1
U 1 1 61420463
P 8050 4950
F 0 "D1" H 8043 4695 50  0000 C CNN
F 1 "VCC" H 8043 4786 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 8050 4950 50  0001 C CNN
F 3 "~" H 8050 4950 50  0001 C CNN
	1    8050 4950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 61420469
P 7550 4950
F 0 "R1" V 7343 4950 50  0000 C CNN
F 1 "1000 Ω" V 7434 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7480 4950 50  0001 C CNN
F 3 "~" H 7550 4950 50  0001 C CNN
	1    7550 4950
	0    1    1    0   
$EndComp
Text GLabel 7200 4950 0    50   Input ~ 0
SERVO_VCC
Text GLabel 8400 4950 2    50   Input ~ 0
SERVO_GND
Wire Wire Line
	7200 4950 7400 4950
Wire Wire Line
	7200 5500 7400 5500
Wire Wire Line
	7700 5500 7900 5500
Wire Wire Line
	7700 4950 7900 4950
Wire Wire Line
	7400 6050 7200 6050
Wire Wire Line
	7700 6050 7900 6050
Wire Wire Line
	8200 5500 8400 5500
Wire Wire Line
	8200 6050 8400 6050
Wire Wire Line
	8200 4950 8400 4950
Text GLabel 3200 3300 0    50   Input ~ 0
SERVO_GND
Text GLabel 3350 3300 2    50   Input ~ 0
MCU_GND
Wire Wire Line
	3200 3300 3350 3300
$EndSCHEMATC
