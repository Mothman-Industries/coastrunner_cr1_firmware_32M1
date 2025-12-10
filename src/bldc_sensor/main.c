#include "grBLDC.h"

FUSES = { //set 32M1's fuses.  //Requires avr/io.h
	.low      = 0xFF,
	.high     = 0xD7,
	.extended = 0xFF
};

int main(void)
{
  psc_init();
  adc_init();
  motor_init();
  hall_init();
  a4910_init(); //configure pin to digital output
  timing_timer0_init();
  timing_timer1_init();
  interface_init();

  Start_pll_64_mega(); // Start the 64 MHz PLL
  Wait_pll_ready();
  
  a4910_enable(); //enable MOSFET driver

  sei(); //enable interrupts

  while(1)
  {	  	  
    if (timing_runControlLoop_get() == TRUE) //controlled by Timer0 interrupt
      {	
        timing_runControlLoop_set(FALSE); //prevent control loop from running again until next Timer0 interrupt occurs
        interface_handler(); // Look at inputs
        pid_scheduler(); // Adjust PWM duty cycle
        // Phase switching is determined directly from Hall Effect state with targets set by interface_handler()
      }
	
    if((timing_measuredRPM_get() < MIN_ALLOWED_RPM) && (motor_state_get() == RUNNING) ) //motor isn't spinning, but should be
      {	
        //psc_commutateOutputWaveforms(PID_KICKSTART_DUTY);
        motor_kickstart(); //kickstart motor
      }
   }
}
