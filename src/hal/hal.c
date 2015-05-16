/*! \file hw.c
    \brief HAL main control
 
*/
#include "hal.h"
// #include "pump.h"
// #include "moisture_sensor.h"
//#include "led.h"
// #include "uart.h"

// #include <libopencm3/stm32/timer.h>
// #include <libopencm3/stm32/rcc.h>
// #include <libopencm3/cm3/nvic.h>



/*! Call hw_init_state with all states to go trough 

	@todo Is this the best way of doing this? The @ref HW_PRE_INIT macro is basically this
*/
void hw_init() {
	hw_init_state(HW_INIT_RCC);
	hw_init_state(HW_INIT_GPIO);
	hw_init_state(HW_INIT_PRE_NVIC);
	hw_init_state(HW_INIT_NVIC);
	hw_init_state(HW_INIT_POST_INIT);
}

