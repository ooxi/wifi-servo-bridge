FIRMWARE=WifiServoBridge
FQBN=esp32:esp32:nodemcu-32s
#FQBN=esp32:esp32:esp32
TTY=/dev/ttyUSB0

.PHONY: all
all:				\
	install-dependencies	\
	clean			\
	build			\


.PHONY: install-dependencies
install-dependencies:
	arduino-cli --config-file 'arduino-cli.yaml' core update-index
	arduino-cli core install 'esp32:esp32'
	arduino-cli lib install 'ESP32Servo@0.9.0'


.PHONY: clean
clean:
	@if [ -d 'build' ]; then	\
		rm -rf 'build';		\
	fi


.PHONY: build
build:
	arduino-cli compile --fqbn '$(FQBN)' --output-dir 'build' '$(FIRMWARE)'


.PHONY: upload
upload: all
	arduino-cli upload --port '$(TTY)' --fqbn '$(FQBN)' --input-dir 'build' '$(FIRMWARE)'

