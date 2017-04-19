/* *************************************************************
   Encoder definitions

   ************************************************************ */

volatile long A_enc_pos = 0L;
volatile long B_enc_pos = 0L;
volatile long C_enc_pos = 0L;

/*init encoder connect pin*/
void initEncoders()
{
  pinMode(ENC_A_PIN_A, INPUT);
  pinMode(ENC_A_PIN_B, INPUT);
  attachInterrupt(4, encoderA_ISR, CHANGE);
  attachInterrupt(5, encoderA_ISR, CHANGE);

  pinMode(ENC_B_PIN_A, INPUT);
  pinMode(ENC_B_PIN_B, INPUT);
  attachInterrupt(2, encoderB_ISR, CHANGE);
  attachInterrupt(3, encoderB_ISR, CHANGE);

  pinMode(ENC_C_PIN_A, INPUT);
  pinMode(ENC_C_PIN_B, INPUT);
  attachInterrupt(0, encoderC_ISR, CHANGE);
  attachInterrupt(1, encoderC_ISR, CHANGE);
}

/* Interrupt routine for A encoder, taking care of actual counting */
void encoderA_ISR ()
{
  if (directionWheel(A_WHEEL) == BACKWARDS)
  {
    A_enc_pos--;
  }
  else 
  {
    A_enc_pos++;
  }
}

/* Interrupt routine for B encoder, taking care of actual counting */
void encoderB_ISR () 
{
  if (directionWheel(B_WHEEL) == BACKWARDS)
  {
    B_enc_pos--;
  }
  else 
  {
    B_enc_pos++;
  }
}

/* Interrupt routine for C encoder, taking care of actual counting */
void encoderC_ISR () 
{
  if (directionWheel(C_WHEEL) == BACKWARDS)
  {
    C_enc_pos--;
  }
  else 
  {
    C_enc_pos++;
  }
}

/* Wrap the encoder reading function */
long readEncoder(int i) 
{
  if (i == A_WHEEL)
  {
    return A_enc_pos;
  }
  else if (i == B_WHEEL)
  {
    return B_enc_pos;
  }
  else
  {
    return C_enc_pos;
  }
}

/* Wrap the encoder reset function */
void resetEncoder(int i) 
{
  if (i == A_WHEEL)
  {
    A_enc_pos = 0L;
    return;
  }
  else if (i == B_WHEEL)
  {
    B_enc_pos = 0L;
    return;
  }
  else
  {
    C_enc_pos = 0L;
    return;
  }
}

/* Wrap the encoder reset function */
void resetEncoders() {
  resetEncoder(A_WHEEL);
  resetEncoder(B_WHEEL);
  resetEncoder(C_WHEEL);
}


