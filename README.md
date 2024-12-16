# CPE 487 Final Project: Digital Clock
## Summary
For our project, we decided to work on creating a digital clock that would be displayed on the display of the Nexys A7 100T. The hope was for the clock to count up from 0 and go for 24 hours. To actually get started, we used a base code for 
a digital clock, found [here](https://www.instructables.com/Digital-Clock-in-VHDL/). The makers give good descriptions of how all of the submodules support the main module, counter. The way the base code was given, it only used 6 segments
of the display showing tens of hours, signles of hours, tens of minutes, singles of minutes, tens of seconds and singles of seconds. Our end goal was to make changes so that we used all 8 segments of the display, added milliseconds at the end of the display,
and separated hours, minutes, seconds and milliseconds with decimal points.

## Expected Behavior
![Demonstration](https://github.com/cfoote5/CPE487_FinalProject/blob/main/Images/Clock%20GIF%20(2).gif)
- The goal for our project is to create a digital clock on the Nexys A7 100T
- The clock will count up from 0 and go for 24 hours.
- **information on how the timer works** tbd
- The clock should pause when the timer is being set, and remember what time it was before the timer was set.
- When the timer goes off, the LEDs above the switches will flash.

## Requirements
- Nexys A7 100T Board
- Micro-USB to USB cable
- Computer with Vivado installed

## How to setup
### 1. Create new RTL project 24hr_clock in Vivado Quick Start
- Create seven new source files of file type VHDL called ***counter***, ***clk_1hz***, ***clk_1khz***, ***clock_counter***, ***mod6counter***, ***anode_picker***, and ***decoder***.

- Create a new constraint file of file type XDC called ***counter***.
- Choose Nexys A7-100T board for the project
- Click 'Finish'
- Click design sources and copy the VHDL code from the repo.
- Click contraints and copy the code from counter.xdc
- As an alternative, you can instead download files from Github and import them into your project when creating the project. The source file or files would still be imported during the Source step, and the constraint file or files would still be imported during the Constraints step.

### 2. Run synthesis
### 3. Run implementation
### 4. Generate bitstream, open hardware manager, and program device.
- Click 'Generate Bitstream'
- Click 'Open Hardware Manager' and click "Open Target' then 'Auto Connect'
- Click 'Program Device' to download counter.bit to the Nexys A7-100T board.
- Switch J15 is the reset switch, toggling on and off will restart clock.
- Switch L16 is the Alarm toggle switch, toggling on will allow you to set an alarm.
- BTNU adds 10 minutes to timer.
- BTND adds 1 minute to timer.
- BTNR adds 10 hours to timer.
- BTNL adds 1 hour to timer.


## Description of the Modules
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

![Milliseconds Process](https://github.com/cfoote5/CPE487_FinalProject/blob/main/Images/Screenshot%202024-12-15%20091829.png)

We created both a milliseconds and a next_seconds signal. The logic behind it is simple, if the milliseconds value meets 999, then the milliseconds will go back to 0 and next_seconds adds 1 for the addition of a second. The next_seconds is also used in the other process for adding seconds. If milliseconds is not equal to 999, the millisecond value will go up by 1 ms, this is all driven by the 1kHz, so that the millisecond value is truly valid as it is being tested/added every clock cycle. 
The last part of implementing milliseconds was to actually update digits 1 and 2 inside of the "clock_counter" module. inside digit1, we would take the milliseconds divide by 10 and modulate that value with 10 to achieve a remainder value. This would serve as the tens place of the milliseconds, the right most digit on our display. Inside digit 2, we would take milliseconds divide 100 and modulate that value with 10 to achieve the remainder value again. This serves as the hundreds place of the milliseconds, the second to last digit on our display (second in from the right. We would shift the other seconds, minutes, and hour values to the right two places. This is what it looks like on the code:

![Digit Values](https://github.com/cfoote5/CPE487_FinalProject/blob/main/Images/Screenshot%202024-12-15%20101411.png)

### Adding Decimal Points
We wanted to edit the display to separate the hours, minutes, seconds, and milliseconds as HH.MM.SS.MsMs . The only place we had to make changes was in the "decoder," module. We started by researching how to actually implement the decimal points. We would need to connect the DP cathode to ground for all of the places we wanted a decimal point, so grounded would be a "0" and non grounded would be a "1". 
When looking at the constraint file, we found the decimal point was already initialized as the eigth bit in the segment standard logic vector. Realizing this we made the display type (used to be loaded into temp, which is eventually loaded into segment at the end) to go from 6 down to 0 bits, instead of 7 down to 0. This would allow us to input a "0" instead of a "1" in any spots we want a decimal point to be in, and vice versa for when we do not want a decimal point to be shown in a segment. Inside of the cases, we used this logic to show whether or not a decimal point was shown:

![Decoder Cases](https://github.com/cfoote5/CPE487_FinalProject/blob/main/Images/Screenshot%202024-12-15%20103737.png)
