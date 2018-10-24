Exercise 4.1 - Lights with multiple switches

The subdirectory ./model contains the files decribing the implemented system's model.

The system has been modeled as a hierarchical finite-state-machine (FSM) with interruptions,
where the transition from inactive state to active state is conditioned by the pushing of any switch.
This behaviour is represented in the image "interrupt_fsm.png".

At the active state, one FSM handles the interruption, executing the debouncing algorithm and notifying
the push event to the FSM that is in charge of controlling the lights via shared variable. 
This behaviour is represented in the image "debounce.png".

At the inactive, another FSM switches on and off the lights depending on the value of said shared variable.
This behaviour is represented in the image "lights.png".

The complete system has been implemented using FreeRTOS, developed and tested with the cross-development tools
"arm-none-eabi-gcc" and "arm-none-eabi-gdb", as well as a Makefile file developed by UPM-Professor A. Gutiérrez Martín.
At last, the implementation has been tested on the prototyping board STM32NUCELO-L476RG.

