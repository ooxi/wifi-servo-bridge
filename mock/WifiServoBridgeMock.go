package main

import (
	"fmt"
	"log"
	"net/http"
	"regexp"
	"strconv"
)

var SERVO_POSITION = map[string]int{}

func handler(response http.ResponseWriter, request *http.Request) {
	requestPath := request.URL.Path;

	/**
	 * Reads back the servo position last set by this firmware
	 *
	 * GET /v2/servo/$servo/
	 *
	 * @param $servo Servo name to read position from
	 */
	if http.MethodGet == request.Method {
		pattern := regexp.MustCompile("^/v2/servo/([ABCDEF])/$")
		match := pattern.FindStringSubmatch(requestPath)

		if nil == match {
			response.WriteHeader(http.StatusBadRequest)
			fmt.Fprintf(response, "Could not parse `%s' as `%q'\n", requestPath, pattern)
			return
		}

		servoName := match[1]

		/* Go will return zero-value if key does not exist
		 */
		servoAngle := SERVO_POSITION[servoName]

		response.WriteHeader(http.StatusOK)
		response.Header().Set("Content-Type", "application/json")
		fmt.Fprintf(response, "%d", servoAngle)
		return
	}

	/**
	 * Move servo to angle
	 *
	 * PUT /v2/servo/$servo/$angle
	 *
	 * @param $servo Servo name to write position to
	 * @param $angle Desired server angle (0 - 180)
	 */
	if http.MethodPut == request.Method {
		pattern := regexp.MustCompile("^/v2/servo/([ABCDEF])/([0-9]+)$")
		match := pattern.FindStringSubmatch(requestPath)

		if nil == match {
			response.WriteHeader(http.StatusBadRequest)
			fmt.Fprintf(response, "Could not parse `%s' as `%q'\n", requestPath, pattern)
			return
		}

		servoName := match[1]
		servoAngle, atoiError := strconv.Atoi(match[2])

		if nil != atoiError {
			response.WriteHeader(http.StatusBadRequest)
			fmt.Fprintf(response, "Angle `%s' not numeric\n", match[2])
			return
		}

		if (servoAngle < 0) || (servoAngle > 180) {
			response.WriteHeader(http.StatusBadRequest)
			fmt.Fprintf(response, "Angle `%d' out of bounds\n", servoAngle)
			return
		}

		SERVO_POSITION[servoName] = servoAngle

		response.WriteHeader(http.StatusOK)
		response.Header().Set("Content-Type", "application/json")
		fmt.Fprintf(response, "%d", SERVO_POSITION[servoName])

		return
	}

	response.WriteHeader(http.StatusBadRequest)
	fmt.Fprintf(response, "Unsupported method\n")
}

func main() {
	    http.HandleFunc("/v2/servo/", handler)
	    log.Fatal(http.ListenAndServe(":8080", nil))
}

