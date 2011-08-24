/*************************************************************
 * This file was automatically generated on 23.08.2011.      *
 *                                                           *
 * If you have a bugfix for this file and want to commit it, *
 * please fix the bug in the generator. You can find a link  *
 * to the generator git on tinkerforge.com                   *
 *************************************************************/

#ifndef BRICKLET_LINEAR_POTI_H
#define BRICKLET_LINEAR_POTI_H

#include "ip_connection.h"

typedef Device LinearPoti;

#define LINEAR_POTI_CALLBACK_POSITION 13
#define LINEAR_POTI_CALLBACK_ANALOG_VALUE 14
#define LINEAR_POTI_CALLBACK_POSITION_REACHED 15
#define LINEAR_POTI_CALLBACK_ANALOG_VALUE_REACHED 16

void linear_poti_create(LinearPoti *linear_poti, const char *uid);

int linear_poti_get_position(LinearPoti *linear_poti, uint16_t *ret_position);
int linear_poti_get_analog_value(LinearPoti *linear_poti, uint16_t *ret_value);
int linear_poti_set_position_callback_period(LinearPoti *linear_poti, uint32_t period);
int linear_poti_get_position_callback_period(LinearPoti *linear_poti, uint32_t *ret_period);
int linear_poti_set_analog_value_callback_period(LinearPoti *linear_poti, uint32_t period);
int linear_poti_get_analog_value_callback_period(LinearPoti *linear_poti, uint32_t *ret_period);
int linear_poti_set_position_callback_threshold(LinearPoti *linear_poti, char option, int16_t min, int16_t max);
int linear_poti_get_position_callback_threshold(LinearPoti *linear_poti, char *ret_option, int16_t *ret_min, int16_t *ret_max);
int linear_poti_set_analog_value_callback_threshold(LinearPoti *linear_poti, char option, uint16_t min, uint16_t max);
int linear_poti_get_analog_value_callback_threshold(LinearPoti *linear_poti, char *ret_option, uint16_t *ret_min, uint16_t *ret_max);
int linear_poti_set_debounce_period(LinearPoti *linear_poti, uint32_t debounce);
int linear_poti_get_debounce_period(LinearPoti *linear_poti, uint32_t *ret_debounce);
int linear_poti_position(LinearPoti *linear_poti, uint16_t *ret_position);
int linear_poti_analog_value(LinearPoti *linear_poti, uint16_t *ret_value);
int linear_poti_position_reached(LinearPoti *linear_poti, uint16_t *ret_position);
int linear_poti_analog_value_reached(LinearPoti *linear_poti, uint16_t *ret_value);

void linear_poti_register_callback(LinearPoti *linear_poti, uint8_t cb, void *func);

#endif