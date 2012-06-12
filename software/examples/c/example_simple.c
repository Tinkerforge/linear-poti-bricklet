
#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_linear_poti.h"

#define HOST "localhost"
#define PORT 4223
#define UID "abc" // Change to your UID

int main() {
	// Create IP connection to brickd
	IPConnection ipcon;
	if(ipcon_create(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not create connection\n");
		exit(1);
	}

	// Create device object
	LinearPoti poti;
	linear_poti_create(&poti, UID); 

	// Add device to IP connection
	if(ipcon_add_device(&ipcon, &poti) < 0) {
		fprintf(stderr, "Could not connect to Bricklet\n");
		exit(1);
	}
	// Don't use device before it is added to a connection

	// Get current position (value has range 0-100)
	uint16_t position;
	if(linear_poti_get_position(&poti, &position) < 0) {
		fprintf(stderr, "Could not get value, probably timeout\n");
		exit(1);
	}

	printf("Position: %d\n", position);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon);
}
