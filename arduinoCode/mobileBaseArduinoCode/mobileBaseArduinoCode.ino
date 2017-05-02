/*********************************************************************
    ROSArduinoBridge

    A set of simple serial commands to control a differential drive
    robot and receive back sensor and odometry data. Default
    configuration assumes use of an Arduino Mega + Pololu motor
    controller shield + Robogaia Mega Encoder shield.  Edit the
    readEncoder() and setMotorSpeed() wrapper functions if using
    different motor controller or encoder method.
 *********************************************************************/
/* Serial port baud rate */
#define BAUDRATE     57600

/* Maximum PWM signal */
#define MAX_PWM      255

/* Include definition of serial commands */
#include "commands.h"
/* Sensor functions */
#include "sensors.h"
/* Motor driver function definitions */
#include "motor_driver.h"
/* Encoder driver function definitions */
#include "encoder_driver.h"
/* PID parameters and functions */
#include "omniWheel_controller.h"

/* Run the PID loop at 30 times per second */
#define PID_RATE     30     // Hz

/* Convert the rate into an interval */
const int PID_INTERVAL = 1000 / PID_RATE;

/* Track the next time we make a PID calculation */
unsigned long nextPID = PID_INTERVAL;

/* Stop the robot if it hasn't received a movement command
  in this number of milliseconds */
#define  AUTO_STOP_INTERVAL  200
long lastMotorCommand = AUTO_STOP_INTERVAL;

/* Variable initialization */
// A pair of varibles to help parse serial commands (thanks Fergs)
int arg = 0;
int index = 0;

// Variable to hold an input character
char chr;

// Variable to hold the current single-character command
char cmd;

// Character arrays to hold the first,second,third arguments
char argv1[32];
char argv2[32];
char argv3[32];

// The arguments converted to integers
long arg1 = 0;
long arg2 = 0;
long arg3 = 0;

/* Clear the current command parameters */
void resetCommand() 
{
  cmd = NULL;
  memset(argv1, 0, sizeof(argv1));
  memset(argv2, 0, sizeof(argv2));
  memset(argv3, 0, sizeof(argv3));
  
  arg1  = 0;
  arg2  = 0;
  arg3  = 0;
  arg   = 0;
  index = 0;
}

/* Run a command.  Commands are defined in commands.h */
int runCommand() 
{
  int i   = 0;
  char *p = argv1;
  char *str;
  int pid_args[12];

  arg1 = atoi(argv1);
  arg2 = atoi(argv2);
  arg3 = atoi(argv3);

  switch (cmd) 
  {
    case GET_BAUDRATE: //'b'
      Serial.println(BAUDRATE);
      break;
      
    case ANALOG_READ:  //'a'
      Serial.println(analogRead(arg1));
      break;
      
    case DIGITAL_READ: //'d'
      Serial.println(digitalRead(arg1));
      break;
      
    case ANALOG_WRITE:
      analogWrite(arg1, arg2);
      Serial.println("OK");
      break;
      
    case DIGITAL_WRITE:
      if (arg2 == 0)
      {
        digitalWrite(arg1, LOW);
      }
      else if (arg2 == 1)
      {
        digitalWrite(arg1, HIGH);
      }
      Serial.println("OK");
      break;
      
    case PIN_MODE:
      if (arg2 == 0) 
      {
        pinMode(arg1, INPUT);
      }
      else if (arg2 == 1) 
      {
        pinMode(arg1, OUTPUT);
      }
      Serial.println("OK");
      break;
      
    case PING:
      Serial.println(Ping(arg1));
      break;
      
    case READ_ENCODERS:  //'e'
      Serial.print(readEncoder(A_WHEEL));
      Serial.print(" ");
      Serial.print(readEncoder(B_WHEEL));
      Serial.print(" ");
      Serial.println(readEncoder(C_WHEEL));
      break;
      
    case RESET_ENCODERS:  //'r'
      resetEncoders();
      resetPID();
      Serial.println("OK");
      break;
      
    case MOTOR_SPEEDS: //'m'
      lastMotorCommand = millis();  /* Reset the auto stop timer */
      if (arg1 == 0 && arg2 == 0 && arg3 == 0) 
      {
        setMotorSpeeds(0, 0, 0);
        resetPID();
        moving = 0;
      }
      else 
      {
        Serial.print(arg1);
        Serial.print(" ");
        Serial.print(arg2);
        Serial.print(" ");
        Serial.println(arg3);
        moving = 1;
      }
      AWheelPID.TargetTicksPerFrame = arg1;
      BWheelPID.TargetTicksPerFrame = arg2;
      CWheelPID.TargetTicksPerFrame = arg3;
      Serial.println("OK");
      break;
      
    case UPDATE_PID: //'u'
      while ((str = strtok_r(p, ":", &p)) != '\0') 
      {
        pid_args[i] = atoi(str);
        i++;
      }
      AWheel_Kp = pid_args[0];
      AWheel_Kd = pid_args[1];
      AWheel_Ki = pid_args[2];
      AWheel_Ko = pid_args[3];
      
      BWheel_Kp = pid_args[0];
      BWheel_Kd = pid_args[1];
      BWheel_Ki = pid_args[2];
      BWheel_Ko = pid_args[3];
      
      CWheel_Kp = pid_args[0];
      CWheel_Kd = pid_args[1];
      CWheel_Ki = pid_args[2];
      CWheel_Ko = pid_args[3];
      Serial.println("OK");
      break;
      
    case READ_PIDIN:
      Serial.print(readPidIn(A_WHEEL));
      Serial.print(" ");
      Serial.print(readPidIn(B_WHEEL));
      Serial.print(" ");
      Serial.println(readPidIn(C_WHEEL));
      break;

    case READ_PIDOUT:
      Serial.print(readPidOut(A_WHEEL));
      Serial.print(" ");
      Serial.print(readPidOut(B_WHEEL));
      Serial.print(" ");
      Serial.println(readPidOut(C_WHEEL));
      break;
    
    default:
      Serial.println("Invalid Command");
      break;
  }
}

/* Setup function--runs once at startup. */
void setup() 
{
  Serial.begin(BAUDRATE);
  
  initEncoders();
  initMotorController();
  resetPID();
}

/* Enter the main loop.  Read and parse input from the serial port
   and run any valid commands. Run a PID calculation at the target
   interval and check for auto-stop conditions.
*/
void loop()
{
  while (Serial.available() > 0)
  {
    chr = Serial.read();  //Read the next character
    
    if (chr == 13)  //Terminate a command with a CR
    {
      if (arg == 1) 
      {
        argv1[index] = NULL;
      }
      else if (arg == 2) 
      {
        argv2[index] = NULL;
      }
      else if (arg == 3) 
      {
        argv3[index] = NULL;
      }
      runCommand();
      resetCommand();
    }
    else if (chr == ' ') // Use spaces to delimit parts of the command
    {
      // Step through the arguments
      if (arg == 0) 
      {
        arg = 1;
      }
      else if (arg == 1)  
      {
        argv1[index] = NULL;
        arg   = 2;
        index = 0;
      }
      else if (arg == 2)  
      {
        argv2[index] = NULL;
        arg   = 3;
        index = 0;
      }
      continue;
    }
    else
    {
      if (arg == 0) 
      {
        cmd = chr; // The first arg is the single-letter command
      }
      else if (arg == 1) 
      {
        // Subsequent arguments can be more than one character
        argv1[index] = chr;
        index++;
      }
      else if (arg == 2) 
      {
        argv2[index] = chr;
        index++;
      }
      else if (arg == 3) 
      {
        argv3[index] = chr;
        index++;
      }
    }
  }

  //run a PID calculation at the appropriate intervals
  if (millis() > nextPID)
  {
    updatePID();
    nextPID += PID_INTERVAL;
  }

  // Check to see if we have exceeded the auto-stop interval
  if ((millis() - lastMotorCommand) > AUTO_STOP_INTERVAL)
  {
    setMotorSpeeds(0, 0, 0);
    moving = 0;
  }
}

