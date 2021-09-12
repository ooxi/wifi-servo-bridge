#include <Arduino.h>

#include <cstdint>


constexpr std::uint8_t PIN_DEBUG_LED{23};


void setup() {
	::pinMode(PIN_DEBUG_LED, OUTPUT);
}


void loop() {
	::digitalWrite(PIN_DEBUG_LED, HIGH);
	::delay(1000);
	::digitalWrite(PIN_DEBUG_LED, LOW);
	::delay(1000);
}

