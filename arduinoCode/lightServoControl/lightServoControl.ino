/*
  Author: corvin
  1: rosserial Subscriber,function: leds.setPixelColor(i,y) can be used to let number i of your led turn on with color of y
  and you can draw your idea easily with this function but never forget function: led.show()
  2:
*/

#include <ros.h>
#include <std_msgs/Int32.h>
#include <Adafruit_NeoPixel.h>

ros::NodeHandle  nh;
#define PIN         6     //The signal pin connected with Arduino    
#define LED_COUNT   60    //the amount of the leds of your strip
String moveTimeStr = " T500";  //move target position need 500ms
String upDownServoStr = "#11 P";
String leftRightSErvoStr = "#15 P";

Adafruit_NeoPixel leds = Adafruit_NeoPixel(LED_COUNT, PIN, NEO_GRB + NEO_KHZ800);

//show wakeup light effect
void showWakeupLight()
{
  for (int i = 0; i < LED_COUNT; i++)
  {
    rainbow(i);
    delay(20);  // Delay between rainbow slides
  }
  clearLEDs();
}

void servo_callback(const std_msgs::Int32& cmd_msg)
{
  switch (cmd_msg.data)
  {
    case 0: //wave arm, greet
      Serial.println("PL0 SQ0 SM100 ONCE");
      break;

    case 1: //hug move
      Serial.println("PL0 SQ1 SM100 ONCE");
      break;

    case 2: //dance1
      Serial.println("PL0 SQ2 SM100 ONCE");
      break;

    case 3: //dance2
      Serial.println("PL0 SQ3 SM100 ONCE");
      break;

    case 4: //only show wakeup light
      showWakeupLight(); //show wakeup light
      break;

    case 5: //wave arm and show light
      Serial.println("PL0 SQ0 SM100 ONCE");
      showWakeupLight(); //show wakeup light
      break;

    default:
      //Serial.println("PL0"); //stop Operate
      moveHeadServo(cmd_msg.data);
      break;
  }
}

ros::Subscriber<std_msgs::Int32> sub("/sensor/lightServoControl", &servo_callback );

void setup()
{
  leds.begin();  // Call this to start up the LED strip.
  clearLEDs();   // This function, defined below, turns all LEDs off...

  nh.initNode();
  nh.subscribe(sub);
  Serial.begin(115200);
}

void loop()
{
  nh.spinOnce();
  delay(1);
}

void moveHeadServo(int input)
{
  int pose = 0;
  String cmdStr;
  if ((input >= 1000) && (input <= 1180)) //up or down move ---11 pin servo control board
  {
    pose = getServoPose(input - 1000);
    cmdStr = upDownServoStr + pose + moveTimeStr;
  }
  else if ((input >= 2000) && (input <= 2180)) //left or right move --15 pin servo control borad
  {
    pose = getServoPose(input - 2000);
    cmdStr = leftRightSErvoStr + pose + moveTimeStr;
  }
  else
  {

  }
  Serial.println(cmdStr);
}

int getServoPose(int degree)
{
  int pos = map(degree, 0, 180, 500, 2500);
  return pos;
}


// Sets all LEDs to off, but DOES NOT update the display;
// call leds.show() to actually turn them off after this.
void clearLEDs()
{
  for (int i = 0; i < LED_COUNT; i++)
  {
    leds.setPixelColor(i, 0);
  }
  leds.show(); //but the LEDs don't actually update until you call this.
}

// Prints a rainbow on the ENTIRE LED strip.
//  The rainbow begins at a specified position.
// ROY G BIV!
void rainbow(byte startPosition)
{
  // Need to scale our rainbow. We want a variety of colors, even if there
  // are just 10 or so pixels.
  int rainbowScale = 192 / LED_COUNT;

  // Next we setup each pixel with the right color
  for (int i = 0; i < LED_COUNT; i++)
  {
    // There are 192 total colors we can get out of the rainbowOrder function.
    // It'll return a color between red->orange->green->...->violet for 0-191.
    leds.setPixelColor(i, rainbowOrder((rainbowScale * (i + startPosition)) % 192));
  }
  // Finally, actually turn the LEDs on:
  leds.show();
}

// Input a value 0 to 191 to get a color value.
// The colors are a transition red->yellow->green->aqua->blue->fuchsia->red...
//  Adapted from Wheel function in the Adafruit_NeoPixel library example sketch
uint32_t rainbowOrder(byte position)
{
  // 6 total zones of color change:
  if (position < 31)  // Red -> Yellow (Red = FF, blue = 0, green goes 00-FF)
  {
    return leds.Color(0xFF, position * 8, 0);
  }
  else if (position < 63)  // Yellow -> Green (Green = FF, blue = 0, red goes FF->00)
  {
    position -= 31;
    return leds.Color(0xFF - position * 8, 0xFF, 0);
  }
  else if (position < 95)  // Green->Aqua (Green = FF, red = 0, blue goes 00->FF)
  {
    position -= 63;
    return leds.Color(0, 0xFF, position * 8);
  }
  else if (position < 127)  // Aqua->Blue (Blue = FF, red = 0, green goes FF->00)
  {
    position -= 95;
    return leds.Color(0, 0xFF - position * 8, 0xFF);
  }
  else if (position < 159)  // Blue->Fuchsia (Blue = FF, green = 0, red goes 00->FF)
  {
    position -= 127;
    return leds.Color(position * 8, 0, 0xFF);
  }
  else  //160 <position< 191   Fuchsia->Red (Red = FF, green = 0, blue goes FF->00)
  {
    position -= 159;
    return leds.Color(0xFF, 0x00, 0xFF - position * 8);
  }
}

