// SPDX-License-Identifier: Zlib
#include <Arduino.h>
#include <ESP32Servo.h>

#include <array>
#include <cstdint>


constexpr std::uint8_t PIN_DEBUG_LED{23};
constexpr std::array<std::uint8_t, 6> PIN_SERVO{2, 4, 12, 13, 14, 15};


static std::array<Servo, PIN_SERVO.size()> servo;


void setup() {

	/* Open serial interface in order to be able to communicate debug
	 * messages
	 */
	Serial.begin(115200);
	Serial.println("WifiServoBridge");


	/* Initialize all servos by attaching them to their desired pins
	 */
	if (PIN_SERVO.size() != servo.size()) {
		loopError("The number of servos must match the number of servo pins");
		return;
	}

	for (auto i = 0; i < servo.size(); ++i) {
		auto const result = servo.at(i).attach(PIN_SERVO.at(i));

		if (0 == result) {
			loopError("Failed attaching servo to pin");
			return;
		}
	}


	/* Signal the user that the application is up and running
	 */
	::pinMode(PIN_DEBUG_LED, OUTPUT);
	::digitalWrite(PIN_DEBUG_LED, HIGH);


	/* Test servos by setting them to a known rotation
	 */
	servo.at(0).write(0);
	servo.at(1).write(36);
	servo.at(2).write(72);
	servo.at(3).write(108);
	servo.at(4).write(144);
	servo.at(5).write(180);
}


void loop() {
}


static void loopError(char const* message) {
	Serial.println(message);
	for (;;) {
		::digitalWrite(PIN_DEBUG_LED, HIGH);
		::delay(500);
		::digitalWrite(PIN_DEBUG_LED, LOW);
		::delay(500);
	}
}

