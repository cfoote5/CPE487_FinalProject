# Cpe 487 Final Project: Digital Clock
## Summary
For our project, we decided to work on creating a digital clock that owuld be displayed on the display of the Nexys A7 100T. The hope was for the clock to count up from 0 and go for 24 hours. To actually get started, we used a base code for 
a digital clock, found [here](https://www.instructables.com/Digital-Clock-in-VHDL/). The makers give good descriptions of how all of the submodules support the main module, counter. The way the base code was given, it only used 6 segments
of the display showing tens of hours, signles of hours, tens of minutes, singles of minutes, tens of seconds and singles of seconds. Our end goal was to make changes so that we used all 8 segments of the display, added milliseconds at the end of the display,
and separated hours, minutes, seconds and milliseconds with decimal points.

## Description of the Program
![](https://content.instructables.com/F9P/ULZB/LDHE8OLN/F9PULZBLDHE8OLN.png?auto=webp&frame=1&width=1024&fit=bounds&md=MjAyMy0wMS0zMCAwNDo0ODo0OS4w)
### ***counter***
Counter is the main module where all of the sub-modules will run through in order to get to other sub-modules. This is also wwhere we can initialize our buttons for the hour and minute adders, the inner clock for the clock cycles, the switches for reset and the alarm, and lastly the LED's for the alarm.

### ***clk_1hz***
This sub-module creates a 1 Hz clock from the inner clock that we input from the counter module. This clock will be referred to as clk1, and drives the "seconds" variable in clock_counter

### ***clk_1khz***
This sub-module creates a 1 kHz clock from the inner clock we iput from the counter module. This clock will be referred to as clk2. It is referenced in mod6counter for how fast each anode turns on as well as clock_counter to drive the milliseconds.

### ***clock_counter***
This sub-module pretty much drives both the milliseconds and seconds to count up, as well as create the minutes and hours. Each digit (1-8) is is given their number respectively (tens of milliseconds, hundreds of milliseconds, singles of seconds, tens of seconds, singles of
minutes, tens of minutes, singles of hours, and tens of hours). This is also where we would implement our alarm, as it makes most sense because the houradder and minuteadder buttons are also used in this module to increase seconds. The digit's use division and modulo based on
the seconds to figure out what will be displayed in eavch segment (i.e. singles of minutes).

### ***mod6counter***
This sub-module simply adds 1 to the counter, WhichDisplay, when an event occurs on the 1kHz clock. Then when the counter reaches "111" (7) it will revert back to 0.

### ***anode_picker***
This sub-module actually chooses what segments are connected to ground. It does this through the WhichDisplay variable we used in the mod6counter module.

### ***decoder***
This sub-module works by seeing which digit needs to be displayed on which anode using the WhichDisplay counter. It is actually choosing what segments turn on depending on the digits needed. This is also where we will be able to determine whether or not we want a decimal point after a digit.

## Modifications
### Adding Milliseconds
Because we wanted to add milliseconds to the display, we needed to first start out by moving the original code from a 6-segment display, to an 8-segment display. To do this, we started in the sub-module "anode_picker". Here we changed the case statement for WhichDisplay (a variable that is used as a counter to decide which segment is displayed) to go up to 8 segments instead of 6. In addition, we also needed to 
modify "mod6counter," so that instead of going to 0 after 6 digits, it went to 0 after 8 digits. We also edited "decoder" so that the "digit" inputs would go from digit8 down to digit1 instead of digit6 downto 1, these are then transported to "clock_counter" as outputs and loaded with their respective value for hours, minutes, seconds, milliseconds. Lastly, to actually implement the milliseconds function, we had to work in the "clock_counter," module. We started by making a process that used a 1 kHz clock instead of the 1 Hz clock that was used to drive the rest of the digital clock, which is used in another process in this same module. You can see the process we created here for milliseconds:
![Milliseconds Process](https://drive.google.com/file/d/17tfaxlwK1XZZ6ODJDv1w4KVdZU5BoMVQ/view?usp=sharing)
