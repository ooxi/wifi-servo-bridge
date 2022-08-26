# SPDX-License-Identifier: Zlib
FIRMWARE=WifiServoBridge
BUILD_EXTRA_FLAGS=-DWIFI_SERVO_BRIDGE_BEHAVE_AS_ACCESS_POINT
FQBN=esp32:esp32:nodemcu-32s
TTY=/dev/ttyUSB0

.PHONY: all
all:				\
	install-dependencies	\
	clean			\
	build			\


.PHONY: install-dependencies
install-dependencies:
	arduino-cli --config-file 'arduino-cli.yaml' core update-index
	arduino-cli core install 'esp32:esp32@1.0.6'
	arduino-cli lib install 'ESP32Servo@0.11.0'


.PHONY: clean
clean:
	@if [ -d 'build' ]; then	\
		rm -rf 'build';		\
	fi


.PHONY: build
build:
	arduino-cli compile --fqbn '$(FQBN)' --output-dir 'build' --build-property 'build.extra_flags=$(BUILD_EXTRA_FLAGS)' '$(FIRMWARE)'


.PHONY: upload
upload: all
	arduino-cli upload --port '$(TTY)' --fqbn '$(FQBN)' --input-dir 'build' '$(FIRMWARE)'

