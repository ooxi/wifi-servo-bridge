// SPDX-License-Identifier: Zlib
#include <Arduino.h>
#include <ESP32Servo.h>
#include <WebServer.h>
#include <WiFi.h>

/* @warning Should be available through espressif's WebServer library but cannot
 *     be found
 */
#include "vendor/UriBraces.h"

#include <array>
#include <cstdint>
#include <string>


static std::string const WIFI_SSID{"***"};	// Replace with your Wifi SSID
static std::string const WIFI_PASSWORD{"***"};	// Replace with your Wifi password
constexpr std::uint16_t WIFI_PORT{80};

constexpr std::uint8_t PIN_DEBUG_LED{23};
constexpr std::array<std::uint8_t, 6> PIN_SERVO{2, 4, 12, 13, 14, 15};


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
 * Reads back the servo position last set by this firmware
 *
 * GET /v1/servo/$servo/
 *
 * @param $servo Servo number to read position from
 *
 * @warning Might _not_ be the physical servo position!
 */
static void handleGetServo() {
	constexpr auto HTTP_OK{200};
	constexpr auto HTTP_BAD_REQUEST{400};

	/* @warning Unfortunately Arduino's String::toInt cannot differentiate
	 *     between "Cannot parse" and "successfully parsed zero"
	 *
	 *     Moreover std::stoul is not available 😑
	 */
	auto const servoIdx = httpd.pathArg(0).toInt();

	if ((servoIdx < 0) || (servoIdx >= servos.size())) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid servo index\n");
		return;
	}

	auto const position = servos.at(servoIdx).read();
	httpd.send(HTTP_OK, "application/json", String(position));
}


/**
 * Move servo to angle
 *
 * PUT /v1/servo/$servo/$angle
 *
 * @param $servo Servo number to write position to
 * @param $angle Desired server angle (0 - 180)
 */
static void handlePutServo() {
	constexpr auto HTTP_OK{200};
	constexpr auto HTTP_BAD_REQUEST{400};

	auto const servoIdx = httpd.pathArg(0).toInt();
	auto const angle = httpd.pathArg(1).toInt();

	if ((servoIdx < 0) || (servoIdx >= servos.size())) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid servo index\n");
		return;
	}

	if ((angle < 0) || (angle > 180)) {
		httpd.send(HTTP_BAD_REQUEST, "text/plain", "Invalid angle\n");
		return;
	}

	servos.at(servoIdx).write(angle);
	auto const position = servos.at(servoIdx).read();
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
		auto const result = servos.at(i).attach(PIN_SERVO.at(i));

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
	httpd.on(UriBraces{"/v1/servo/{}/"}, HTTP_GET, handleGetServo);
	httpd.on(UriBraces{"/v1/servo/{}/{}"}, HTTP_PUT, handlePutServo);


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

