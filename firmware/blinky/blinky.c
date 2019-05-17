/*
 * Copyright 2010 - 2012 Michael Ossmann
 *
 * This file is part of HackRF.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#include "hackrf_core.h"
#include "gpio_lpc.h"

static struct gpio_t gpio_led[] = {
	GPIO(3,  7),
	GPIO(2,  2),
	GPIO(2,  8),
#ifdef RAD1O
	GPIO(5,  26),
#endif
};

int main(void)
{
	gpio_init();
	gpio_output(&gpio_led[0]);

	/* Blink LED1/2/3 on the board. */
	while (1) 
	{
		gpio_set(&gpio_led[0]);

		delay(2000000);
		
		gpio_clear(&gpio_led[0]);
		
		delay(2000000);
	}

	return 0;
}
