Exercise 6.1 - Basic alarm system

En el subdirectorio ./model se encuentran los ficheros que describen el modelado del sistema.

The subdirectory ./model contains the files decribing the implemented system's model.

The system has been modeled as a hierarchical finite-state-machine (FSM) with interruptions,
where the transition from inactive state to active state is conditioned by the pushing of any switch.
This behaviour is represented in the image "interrupt_fsm.png".

At the active state, one FSM handles the interruption, executing the debouncing algorithm and notifying
the push event to the FSM that is in charge of controlling the lights via shared variable. 
This behaviour is represented in the image "debounce.png".

At the inactive, another FSM switches on the lights depending on the value of said shared variable, and switches
the lights off once 60 seconds have transcurred.
This behaviour is represented in the image "lights.png".

Concurrently, another FSM manages the alarm system, checking the presence and arming signals to do so. A transition to 
the state INTRUSO happens when the alarm system is armed and presence is detected. At this state, a PWM signal is generated
feeding a buzzer conected to the development platform. It's relevant to say that, once the INTRUSO state has been reached, 
the system may return to the DESARMADA state if the arming signal is deasserted.
This behaviour is represented in the image "alarm.png".

The complete system has been implemented using FreeRTOS, developed and tested with the cross-development tools
"arm-none-eabi-gcc" and "arm-none-eabi-gdb", as well as a Makefile file developed by UPM-Professor A. Gutiérrez Martín.
At last, the implementation has been tested on the prototyping board STM32NUCELO-L476RG.
