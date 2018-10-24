Exercise 8 - YDS Scheduling

This exercise has been done based on the code developed for Exercise 7.

Firstly, to be able to schedule a discrete system using the YDS algorithm it is necessary to know the activation time, deadlines and compute time of every task beforehand. As there are no stipulated restrictions, periods have been set equal to deadlines and every task has the same deadline/period (200ms). Moreover, since we seek to analyze the worst case scenario, we'll supose that at the beginning of the execution, all the tasks are activated.

Secondly, we need to measure the maximum compute time for each of the tasks. In order to do so, FreeRTOS's xTaskGetTickCount() function has been used, storing the timing value before and after a call to the fsm_fire() function, and averaging all the measurements. Regrettably, since FreeRTOS maximum resolution is 1ms, we will be doing a conservative calculation and assume every task's compute time is equal to 1ms (it surely is lesser than that, but there's no way to measure it with this method).

Therefore, being every task active at the beginning of the execution and having every task the same period and deadline, there is only one 
activity interval, where the intensity of this interval is calculated as:

  G([0,200]) = roof( (C_lights + C_alarm + C_decoder) / T ) = roof( ( 1 + 1 + 1 ) / 200 ) = 1

In conclusion, the cyclic executive built after using this algorithm will consist on the sequential triggering of the 3 FSMs, at a frequency greater or equal to the activity interval's intensity, that is, at nominal frequency. In the code, a function called os_update_cpu_frequency() has been written to simulate the frequency 'change' during the execution time.
