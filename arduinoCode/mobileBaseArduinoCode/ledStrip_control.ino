#include <Adafruit_NeoPixel.h>

Adafruit_NeoPixel leds = Adafruit_NeoPixel(LED_COUNT, LEDSTRIP_PIN, NEO_GRB + NEO_KHZ800);

void initLedStrip()
{
  leds.begin();  // Call this to start up the LED strip.
  clearLEDs();   // This function, defined below, turns all LEDs off...
}

void startShow(int i)
{
  switch (i)
  {
    case WIPE_RED:
      colorWipe(leds.Color(255, 0, 0), 20);  // Red
      break;
    case WIPE_GREEN:
      colorWipe(leds.Color(0, 255, 0), 20);  // Green
      break;
    case WIPE_BLUE:
      colorWipe(leds.Color(0, 0, 255), 20);  // Blue
      break;
    case CHASE_WHITE:
      theaterChase(leds.Color(127, 127, 127), 20); // White
      break;
    case CHASE_RED:
      theaterChase(leds.Color(127,   0,   0), 20); // Red
      break;
    case CHASE_GREEN:
      theaterChase(leds.Color(0,   255,   0), 20); // Green
      break;
    case CHASE_BLUE:
      theaterChase(leds.Color(  0,   0, 127), 20); // Blue
      break;
    case RAINBOW_LIGHT:
      rainbowLight();
      break;
    default:
      clearLEDs();
      break;
  }
}

//show rainbow light effect
void rainbowLight()
{
  for (int i = 0; i < LED_COUNT; i++)
  {
    rainbow(i);
    delay(20);  // Delay between rainbow slides
  }
  clearLEDs();
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
  if (position < 10)  // Red -> Yellow (Red = FF, blue = 0, green goes 00-FF)
  {
    return leds.Color(0xFF, position * 8, 0);
  }
  else if (position < 20)  // Yellow -> Green (Green = FF, blue = 0, red goes FF->00)
  {
    position -= 10;
    return leds.Color(0xFF - position * 8, 0xFF, 0);
  }
  else if (position < 30)  // Green->Aqua (Green = FF, red = 0, blue goes 00->FF)
  {
    position -= 20;
    return leds.Color(0, 0xFF, position * 8);
  }
  else if (position < 40)  // Aqua->Blue (Blue = FF, red = 0, green goes FF->00)
  {
    position -= 30;
    return leds.Color(0, 0xFF - position * 8, 0xFF);
  }
  else if (position < 50)  // Blue->Fuchsia (Blue = FF, green = 0, red goes 00->FF)
  {
    position -= 40;
    return leds.Color(position * 8, 0, 0xFF);
  }
  else  //160 <position< 191   Fuchsia->Red (Red = FF, green = 0, blue goes FF->00)
  {
    position -= 50;
    return leds.Color(0xFF, 0x00, 0xFF - position * 8);
  }
}

// Fill the dots one after the other with a color
void colorWipe(uint32_t c, uint8_t wait)
{
  for (uint16_t i = 0; i < leds.numPixels(); i++)
  {
    leds.setPixelColor(i, c);
    leds.show();
    delay(wait);
  }
  clearLEDs();
}

//Theatre-style crawling lights.
void theaterChase(uint32_t c, uint8_t wait)
{
  for (int j = 0; j < 10; j++) //do 10 cycles of chasing
  {
    for (int q = 0; q < 3; q++)
    {
      for (int i = 0; i < leds.numPixels(); i = i + 3)
      {
        leds.setPixelColor(i + q, c);  //turn every third pixel on
      }
      leds.show();
      delay(wait);

      for (int i = 0; i < leds.numPixels(); i = i + 3)
      {
        leds.setPixelColor(i + q, 0); //turn every third pixel off
      }
    }
  }
  clearLEDs();
}


