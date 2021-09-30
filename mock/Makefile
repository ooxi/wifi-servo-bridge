.PHONY: all
all: clean build


.PHONY: clean
clean:
	@if [ -f 'WifiServoBridgeMock' ]; then	\
		rm 'WifiServoBridgeMock';	\
	fi


.PHONY: build
build:
	go build 'WifiServoBridgeMock.go'


.PHONY: test
test:
	'./WifiServoBridgeMock'

