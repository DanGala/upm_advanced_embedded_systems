Exercise 7 - Code-protected alarm system

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

Concurrently, another FSM manages the alarm system, checking the presence signal and the shared variable 'code_entered' 
to do so. A transition to the state INTRUSO happens when the alarm system is armed and presence is detected.
At this state, a PWM signal is generated feeding a buzzer conected to the development platform. It's relevant to say 
that the system may change from the states ARMADA and DESARMADA and viceversa by correctly entering the code.
This behaviour is represented in the image "alarm.png".

At last, another extended FSM is in charge of managing the code entry depending on the shared variable 'cbutton'.
When the code is entered correctly, the shared variable 'code_entered' is asserted. It's important to notice that
in this model it is necessary to enter 3 digits to return to the idle state. Thus, an error entering the first digit
will force the user to enter another 2 random digits before trying again. 
This behaviour is represented in the image "decoder.png"

The complete system has been implemented using FreeRTOS, developed and tested with the cross-development tools
"arm-none-eabi-gcc" and "arm-none-eabi-gdb", as well as a Makefile file developed by UPM-Professor A. Gutiérrez Martín.
At last, the implementation has been tested on the prototyping board STM32NUCELO-L476RG.
