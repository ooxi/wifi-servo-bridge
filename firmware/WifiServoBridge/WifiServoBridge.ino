// SPDX-License-Identifier: Zlib
#include <Arduino.h>
#include <ESP32Servo.h>
#include <WebServer.h>
#include <WiFi.h>

/* @warning `UriBraces.h' should be available through espressif's WebServer
 *     library but cannot be found
 */
#include "vendor/optional.hpp"
#include "vendor/UriBraces.h"

#include <array>
#include <cstdint>
#include <string>
#include <utility>


struct ServoConfig {
	char const* name;
	std::uint8_t pin;
};

static std::string const WIFI_SSID{"***"};	// Replace with your Wifi SSID
static std::string const WIFI_PASSWORD{"***"};	// Replace with your Wifi password
constexpr std::uint16_t WIFI_PORT{80};

constexpr std::uint8_t PIN_DEBUG_LED{23};
constexpr std::array<ServoConfig, 6> PIN_SERVO{
	ServoConfig{"A", 5},
	ServoConfig{"B", 17},
	ServoConfig{"C", 16},
	ServoConfig{"D", 4},
	ServoConfig{"E", 2},
	ServoConfig{"F", 15},
};


static WebServer httpd{WIFI_PORT};
static std::array<Servo, PIN_SERVO.size()> servos;


/**
 * Tells the user a non recoverable error has occured and halts further
 * processing
 */
static void loopError(char const* message) {
	Serial.println(message);
	httpd.stop();

	for (;;) {
		::digitalWrite(PIN_DEBUG_LED, LOW);
		::delay(500);
		::digitalWrite(PIN_DEBUG_LED, HIGH);
		::delay(500);
	}
}


/**
 * Provides a UI for human debugging
 *
 * GET /
 */
static void handleGetRoot() {
	constexpr auto HTTP_OK{200};
	httpd.send(HTTP_OK, "text/plain", "WifiServoBridge\n");
}


/**
 * @return Index of servo by name iff name is valid
 */
static tl::optional<std::size_t> getServoIdxFromName(String const& expectedName) {
	for (std::size_t idx = 0; idx < PIN_SERVO.size(); ++idx) {
		String const actualName{PIN_SERVO.at(idx).name};

		if (actualName.equals(expectedName)) {
			return idx;
		}
	}

	return tl::nullopt;
}


/**
 * Reads back the servo position last set by this firmware
 *
 * GET /v2/servo/$servo/
 *
 * @param $servo Servo name to read position from
 *
 * @warning Might _not_ be the physical servo position!
 */
static void handleGetServo() {
	constexpr auto HTTP_OK{200};
	constexpr auto HTTP_BAD_REQUEST{400};

	auto const servoIdx = getServoIdxFromName(httpd.pathArg(0));

	if (!servoIdx.has_value()) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid servo name\n");
		return;
	}

	auto const position = servos.at(servoIdx.value()).read();
	httpd.send(HTTP_OK, "application/json", String(position));
}


/**
 * Move servo to angle
 *
 * PUT /v2/servo/$servo/$angle
 *
 * @param $servo Servo name to write position to
 * @param $angle Desired server angle (0 - 180)
 */
static void handlePutServo() {
	constexpr auto HTTP_OK{200};
	constexpr auto HTTP_BAD_REQUEST{400};

	auto const servoIdx = getServoIdxFromName(httpd.pathArg(0));
	auto const angle = httpd.pathArg(1).toInt();

	if (!servoIdx.has_value()) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid servo name\n");
		return;
	}

	if ((angle < 0) || (angle > 180)) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid angle\n");
		return;
	}

	servos.at(servoIdx.value()).write(angle);
	auto const position = servos.at(servoIdx.value()).read();
	httpd.send(HTTP_OK, "application/json", String(position));
}


void setup() {

	/* Earliest signal that module is alive
	 */
	::pinMode(PIN_DEBUG_LED, OUTPUT);
	::digitalWrite(PIN_DEBUG_LED, HIGH);


	/* Open serial interface in order to be able to communicate debug
	 * messages
	 */
	Serial.begin(115200);
	Serial.println("WifiServoBridge");


	/* Initialize all servos by attaching them to their desired pins
	 */
	if (PIN_SERVO.size() != servos.size()) {
		loopError("The number of servos must match the number of servo pins");
		return;
	}

	for (auto i = 0; i < servos.size(); ++i) {
		auto const result = servos.at(i).attach(PIN_SERVO.at(i).pin);

		if (0 == result) {
			loopError("Failed attaching servo to pin");
			return;
		}
	}


	/* Reset servo position
	 */
	for (Servo& servo : servos) {
		servo.write(0);
	}


	/* Connect to specified Wifi
	 */
	Serial.println(("Connecting to " + WIFI_SSID).c_str());
	WiFi.begin(WIFI_SSID.c_str(), WIFI_PASSWORD.c_str());

	while (WiFi.status() != WL_CONNECTED) {
		::digitalWrite(PIN_DEBUG_LED, LOW);
		::delay(250);
		::digitalWrite(PIN_DEBUG_LED, HIGH);
		::delay(250);
		Serial.print(".");
	}

	Serial.println("");
	Serial.print("WiFi connected @ ");
	Serial.println(WiFi.localIP());


	/* Initialize HTTP server
	 */
	httpd.begin();

	httpd.on("/", HTTP_GET, handleGetRoot);
	httpd.on(UriBraces{"/v2/servo/{}/"}, HTTP_GET, handleGetServo);
	httpd.on(UriBraces{"/v2/servo/{}/{}"}, HTTP_PUT, handlePutServo);


	/* Signal the user that the application is up and running
	 */
	::digitalWrite(PIN_DEBUG_LED, LOW);
}


void loop() {
	httpd.handleClient();

	/* Allow the CPU to switch to other tasks
	 *
	 * @see https://github.com/espressif/arduino-esp32/blob/f7fc8ab37714efc1e00ef640a3e4f51ca647fac5/libraries/WebServer/examples/HelloServer/HelloServer.ino#L73
	 */
	::delay(2);
}

