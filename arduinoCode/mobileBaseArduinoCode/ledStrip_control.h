#ifndef _LEDSTRIP_CONTROL_H_
#define _LEDSTRIP_CONTROL_H_

#define  LEDSTRIP_PIN    24
#define  LED_COUNT       59    //the amount of the leds of your strip

#define  CLEAR_LIGHT       0
#define  STOPSTART_LIGHT   1
#define  ENABLESTART_LIGHT 2

#define  RAINBOW_LIGHT    11
#define  WIPE_RED         12
#define  WIPE_GREEN       13
#define  WIPE_BLUE        14
#define  CHASE_WHITE      15
#define  CHASE_RED        16
#define  CHASE_GREEN      17
#define  CHASE_BLUE       18

void initLedStrip();
void rainbowLight();
void clearLEDs();

#endif

