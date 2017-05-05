
void initSoundPin()
{
  pinMode(SOUND_PIN, OUTPUT);
}

void basePowerOnBeep()
{
  for (int i = 200; i <= 600; i++)
  {
    tone(SOUND_PIN, i); 
    delay(3);
  }
  noTone(SOUND_PIN);
}

void basePowerOffBeep()
{
  for (int i = 600; i >= 200; i--)
  {
    tone(SOUND_PIN, i); 
    delay(3);
  }
  noTone(SOUND_PIN);
}

