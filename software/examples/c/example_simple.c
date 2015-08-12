#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_linear_poti.h"

#define HOST "localhost"
#define PORT 4223
#define UID "XYZ" // Change to your UID

int main(void) {
	// Create IP connection
	IPConnection ipcon;
	ipcon_create(&ipcon);

	// Create device object
	LinearPoti lp;
	linear_poti_create(&lp, UID, &ipcon);

	// Connect to brickd
	if(ipcon_connect(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not connect\n");
		return 1;
	}
	// Don't use device before ipcon is connected

	// Get current position (range is 0 to 100)
	uint16_t position;
	if(linear_poti_get_position(&lp, &position) < 0) {
		fprintf(stderr, "Could not get position, probably timeout\n");
		return 1;
	}

	printf("Position: %d\n", position);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon); // Calls ipcon_disconnect internally
	return 0;
}
