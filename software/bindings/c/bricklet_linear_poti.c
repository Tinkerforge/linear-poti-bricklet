/*************************************************************
 * This file was automatically generated on 2011-08-23.      *
 *                                                           *
 * If you have a bugfix for this file and want to commit it, *
 * please fix the bug in the generator. You can find a link  *
 * to the generator git on tinkerforge.com                   *
 *************************************************************/

#include "bricklet_linear_poti.h"

#include <string.h>

#define TYPE_GET_POSITION 1
#define TYPE_GET_ANALOG_VALUE 2
#define TYPE_SET_POSITION_CALLBACK_PERIOD 3
#define TYPE_GET_POSITION_CALLBACK_PERIOD 4
#define TYPE_SET_ANALOG_VALUE_CALLBACK_PERIOD 5
#define TYPE_GET_ANALOG_VALUE_CALLBACK_PERIOD 6
#define TYPE_SET_POSITION_CALLBACK_THRESHOLD 7
#define TYPE_GET_POSITION_CALLBACK_THRESHOLD 8
#define TYPE_SET_ANALOG_VALUE_CALLBACK_THRESHOLD 9
#define TYPE_GET_ANALOG_VALUE_CALLBACK_THRESHOLD 10
#define TYPE_SET_DEBOUNCE_PERIOD 11
#define TYPE_GET_DEBOUNCE_PERIOD 12
#define TYPE_POSITION 13
#define TYPE_ANALOG_VALUE 14
#define TYPE_POSITION_REACHED 15
#define TYPE_ANALOG_VALUE_REACHED 16

typedef void (*position_func_t)(uint16_t);
typedef void (*analog_value_func_t)(uint16_t);
typedef void (*position_reached_func_t)(uint16_t);
typedef void (*analog_value_reached_func_t)(uint16_t);

#ifdef _MSC_VER
	#pragma pack(push)
	#pragma pack(1)

	#define PACKED
#else
	#define PACKED __attribute__((packed))
#endif

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetPosition;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t position;
} PACKED GetPositionReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetAnalogValue;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t value;
} PACKED GetAnalogValueReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t period;
} PACKED SetPositionCallbackPeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetPositionCallbackPeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t period;
} PACKED GetPositionCallbackPeriodReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t period;
} PACKED SetAnalogValueCallbackPeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetAnalogValueCallbackPeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t period;
} PACKED GetAnalogValueCallbackPeriodReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char option;
	int16_t min;
	int16_t max;
} PACKED SetPositionCallbackThreshold;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetPositionCallbackThreshold;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char option;
	int16_t min;
	int16_t max;
} PACKED GetPositionCallbackThresholdReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char option;
	uint16_t min;
	uint16_t max;
} PACKED SetAnalogValueCallbackThreshold;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetAnalogValueCallbackThreshold;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char option;
	uint16_t min;
	uint16_t max;
} PACKED GetAnalogValueCallbackThresholdReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t debounce;
} PACKED SetDebouncePeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} PACKED GetDebouncePeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t debounce;
} PACKED GetDebouncePeriodReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t position;
} PACKED PositionCallback;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t value;
} PACKED AnalogValueCallback;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t position;
} PACKED PositionReachedCallback;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t value;
} PACKED AnalogValueReachedCallback;

#ifdef _MSC_VER
	#pragma pack(pop)
#endif

int linear_poti_get_position(LinearPoti *linear_poti, uint16_t *ret_position) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_POSITION;
	linear_poti->answer.length = sizeof(GetPositionReturn);
	GetPosition gp;
	gp.stack_id = linear_poti->stack_id;
	gp.type = TYPE_GET_POSITION;
	gp.length = sizeof(GetPosition);

	ipcon_device_write(linear_poti, (char *)&gp, sizeof(GetPosition));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetPositionReturn *gpr = (GetPositionReturn *)linear_poti->answer.buffer;
	*ret_position = gpr->position;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_analog_value(LinearPoti *linear_poti, uint16_t *ret_value) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_ANALOG_VALUE;
	linear_poti->answer.length = sizeof(GetAnalogValueReturn);
	GetAnalogValue gav;
	gav.stack_id = linear_poti->stack_id;
	gav.type = TYPE_GET_ANALOG_VALUE;
	gav.length = sizeof(GetAnalogValue);

	ipcon_device_write(linear_poti, (char *)&gav, sizeof(GetAnalogValue));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetAnalogValueReturn *gavr = (GetAnalogValueReturn *)linear_poti->answer.buffer;
	*ret_value = gavr->value;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_set_position_callback_period(LinearPoti *linear_poti, uint32_t period) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	SetPositionCallbackPeriod spcp;
	spcp.stack_id = linear_poti->stack_id;
	spcp.type = TYPE_SET_POSITION_CALLBACK_PERIOD;
	spcp.length = sizeof(SetPositionCallbackPeriod);
	spcp.period = period;

	ipcon_device_write(linear_poti, (char *)&spcp, sizeof(SetPositionCallbackPeriod));

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_position_callback_period(LinearPoti *linear_poti, uint32_t *ret_period) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_POSITION_CALLBACK_PERIOD;
	linear_poti->answer.length = sizeof(GetPositionCallbackPeriodReturn);
	GetPositionCallbackPeriod gpcp;
	gpcp.stack_id = linear_poti->stack_id;
	gpcp.type = TYPE_GET_POSITION_CALLBACK_PERIOD;
	gpcp.length = sizeof(GetPositionCallbackPeriod);

	ipcon_device_write(linear_poti, (char *)&gpcp, sizeof(GetPositionCallbackPeriod));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetPositionCallbackPeriodReturn *gpcpr = (GetPositionCallbackPeriodReturn *)linear_poti->answer.buffer;
	*ret_period = gpcpr->period;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_set_analog_value_callback_period(LinearPoti *linear_poti, uint32_t period) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	SetAnalogValueCallbackPeriod savcp;
	savcp.stack_id = linear_poti->stack_id;
	savcp.type = TYPE_SET_ANALOG_VALUE_CALLBACK_PERIOD;
	savcp.length = sizeof(SetAnalogValueCallbackPeriod);
	savcp.period = period;

	ipcon_device_write(linear_poti, (char *)&savcp, sizeof(SetAnalogValueCallbackPeriod));

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_analog_value_callback_period(LinearPoti *linear_poti, uint32_t *ret_period) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_ANALOG_VALUE_CALLBACK_PERIOD;
	linear_poti->answer.length = sizeof(GetAnalogValueCallbackPeriodReturn);
	GetAnalogValueCallbackPeriod gavcp;
	gavcp.stack_id = linear_poti->stack_id;
	gavcp.type = TYPE_GET_ANALOG_VALUE_CALLBACK_PERIOD;
	gavcp.length = sizeof(GetAnalogValueCallbackPeriod);

	ipcon_device_write(linear_poti, (char *)&gavcp, sizeof(GetAnalogValueCallbackPeriod));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetAnalogValueCallbackPeriodReturn *gavcpr = (GetAnalogValueCallbackPeriodReturn *)linear_poti->answer.buffer;
	*ret_period = gavcpr->period;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_set_position_callback_threshold(LinearPoti *linear_poti, char option, int16_t min, int16_t max) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	SetPositionCallbackThreshold spct;
	spct.stack_id = linear_poti->stack_id;
	spct.type = TYPE_SET_POSITION_CALLBACK_THRESHOLD;
	spct.length = sizeof(SetPositionCallbackThreshold);
	spct.option = option;
	spct.min = min;
	spct.max = max;

	ipcon_device_write(linear_poti, (char *)&spct, sizeof(SetPositionCallbackThreshold));

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_position_callback_threshold(LinearPoti *linear_poti, char *ret_option, int16_t *ret_min, int16_t *ret_max) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_POSITION_CALLBACK_THRESHOLD;
	linear_poti->answer.length = sizeof(GetPositionCallbackThresholdReturn);
	GetPositionCallbackThreshold gpct;
	gpct.stack_id = linear_poti->stack_id;
	gpct.type = TYPE_GET_POSITION_CALLBACK_THRESHOLD;
	gpct.length = sizeof(GetPositionCallbackThreshold);

	ipcon_device_write(linear_poti, (char *)&gpct, sizeof(GetPositionCallbackThreshold));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetPositionCallbackThresholdReturn *gpctr = (GetPositionCallbackThresholdReturn *)linear_poti->answer.buffer;
	*ret_option = gpctr->option;
	*ret_min = gpctr->min;
	*ret_max = gpctr->max;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_set_analog_value_callback_threshold(LinearPoti *linear_poti, char option, uint16_t min, uint16_t max) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	SetAnalogValueCallbackThreshold savct;
	savct.stack_id = linear_poti->stack_id;
	savct.type = TYPE_SET_ANALOG_VALUE_CALLBACK_THRESHOLD;
	savct.length = sizeof(SetAnalogValueCallbackThreshold);
	savct.option = option;
	savct.min = min;
	savct.max = max;

	ipcon_device_write(linear_poti, (char *)&savct, sizeof(SetAnalogValueCallbackThreshold));

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_analog_value_callback_threshold(LinearPoti *linear_poti, char *ret_option, uint16_t *ret_min, uint16_t *ret_max) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_ANALOG_VALUE_CALLBACK_THRESHOLD;
	linear_poti->answer.length = sizeof(GetAnalogValueCallbackThresholdReturn);
	GetAnalogValueCallbackThreshold gavct;
	gavct.stack_id = linear_poti->stack_id;
	gavct.type = TYPE_GET_ANALOG_VALUE_CALLBACK_THRESHOLD;
	gavct.length = sizeof(GetAnalogValueCallbackThreshold);

	ipcon_device_write(linear_poti, (char *)&gavct, sizeof(GetAnalogValueCallbackThreshold));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetAnalogValueCallbackThresholdReturn *gavctr = (GetAnalogValueCallbackThresholdReturn *)linear_poti->answer.buffer;
	*ret_option = gavctr->option;
	*ret_min = gavctr->min;
	*ret_max = gavctr->max;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_set_debounce_period(LinearPoti *linear_poti, uint32_t debounce) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	SetDebouncePeriod sdp;
	sdp.stack_id = linear_poti->stack_id;
	sdp.type = TYPE_SET_DEBOUNCE_PERIOD;
	sdp.length = sizeof(SetDebouncePeriod);
	sdp.debounce = debounce;

	ipcon_device_write(linear_poti, (char *)&sdp, sizeof(SetDebouncePeriod));

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_get_debounce_period(LinearPoti *linear_poti, uint32_t *ret_debounce) {
	if(linear_poti->ipcon == NULL) {
		return E_NOT_ADDED;
	}

	ipcon_sem_wait_write(linear_poti);

	linear_poti->answer.type = TYPE_GET_DEBOUNCE_PERIOD;
	linear_poti->answer.length = sizeof(GetDebouncePeriodReturn);
	GetDebouncePeriod gdp;
	gdp.stack_id = linear_poti->stack_id;
	gdp.type = TYPE_GET_DEBOUNCE_PERIOD;
	gdp.length = sizeof(GetDebouncePeriod);

	ipcon_device_write(linear_poti, (char *)&gdp, sizeof(GetDebouncePeriod));

	if(ipcon_answer_sem_wait_timeout(linear_poti) != 0) {
		ipcon_sem_post_write(linear_poti);
		return E_TIMEOUT;
	}

	GetDebouncePeriodReturn *gdpr = (GetDebouncePeriodReturn *)linear_poti->answer.buffer;
	*ret_debounce = gdpr->debounce;

	ipcon_sem_post_write(linear_poti);

	return E_OK;
}

int linear_poti_callback_position(LinearPoti *linear_poti, const unsigned char *buffer) {
	PositionCallback *pc = (PositionCallback *)buffer;
	((position_func_t)linear_poti->callbacks[pc->type])(pc->position);
	return sizeof(PositionCallback);
}

int linear_poti_callback_analog_value(LinearPoti *linear_poti, const unsigned char *buffer) {
	AnalogValueCallback *avc = (AnalogValueCallback *)buffer;
	((analog_value_func_t)linear_poti->callbacks[avc->type])(avc->value);
	return sizeof(AnalogValueCallback);
}

int linear_poti_callback_position_reached(LinearPoti *linear_poti, const unsigned char *buffer) {
	PositionReachedCallback *prc = (PositionReachedCallback *)buffer;
	((position_reached_func_t)linear_poti->callbacks[prc->type])(prc->position);
	return sizeof(PositionReachedCallback);
}

int linear_poti_callback_analog_value_reached(LinearPoti *linear_poti, const unsigned char *buffer) {
	AnalogValueReachedCallback *avrc = (AnalogValueReachedCallback *)buffer;
	((analog_value_reached_func_t)linear_poti->callbacks[avrc->type])(avrc->value);
	return sizeof(AnalogValueReachedCallback);
}

void linear_poti_register_callback(LinearPoti *linear_poti, uint8_t cb, void *func) {
    linear_poti->callbacks[cb] = func;
}

void linear_poti_create(LinearPoti *linear_poti, const char *uid) {
	ipcon_device_create(linear_poti, uid);

	linear_poti->device_callbacks[TYPE_POSITION] = linear_poti_callback_position;
	linear_poti->device_callbacks[TYPE_ANALOG_VALUE] = linear_poti_callback_analog_value;
	linear_poti->device_callbacks[TYPE_POSITION_REACHED] = linear_poti_callback_position_reached;
	linear_poti->device_callbacks[TYPE_ANALOG_VALUE_REACHED] = linear_poti_callback_analog_value_reached;
}
