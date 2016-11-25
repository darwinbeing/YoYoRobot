//author:corvin
//date:2016.11.18
//description: connect all kinds of sensors in arduino sensor extens shield
//create /sensor/lightValue topic to publish light sensor data;
//create /sensor/temperature topic to publish temperature sensor data;
//create /sensor/humidity topic to publish humidity sensor data;
//create /sensor/gasSensor topic to publish gas sensor data
//create /sensor/bodyDetect topic to publish body sensor data
//create /sensor/IRValue topic to publish IR sensor data
//create /sensor/touchValue topic to publish touch sensor data
//create /sensor/topUltraSound topic to publish left ultraSound data
//create /sensor/downUltraSound topic to publish right ultraSound data
//How to check result in machine:
//(1)start "roscore" in host;
//(2)"rosrun rosserial_python serial_node.py /dev/ttyACM0 _baud:=57600"
//(3)"rostopic echo /sensor/lightValue" --show light sensor data
//(4)"rostopic echo /sensor/temperature" --show temperature sensor data
//(5)"rostopic echo /sensor/humidity" --show humidity sensor data
//(6)"rostopic echo /sensor/gasSensor" --show gas sensor data
//(7)"rostopic echo /sensor/bodyDetect" --show body sensor data,0:no detect body,
//                   --1:front detected,2:left detected,3:right detected
//(8)"rostopic echo /sensor/IRValue"  --show IR value
//(9)"rostopic echo /sensor/touchValue" --show touch pose



#include <ros.h>
#include <dht.h>
#include <std_msgs/String.h>
#include <std_msgs/Byte.h>
#include <std_msgs/Float32.h>
#include <sensor_msgs/Range.h>


#define DETECTBODY      1
#define lightSensorPin  6     //light pin is Analog A6
#define gasSensorPin    7     //gas sensor in Analog pin A7
#define FontIRPin       9     //front IR sensor pin
#define DHT22_PIN       53    //tempreture and humidity sensor pin
#define FBodySensorPin  14    //front body sensor
#define LBodySensorPin  15    //left body sensor
#define RBodySensorPin  16    //right body sensor
#define BBodySensorPin  17    //behind body sensor
#define LeftTouchPin    42    //left touch
#define RightTouchPin   41    //right touch
#define topTrigPin      8     //top ultraSonic trig pin
#define downTrigPin     9     //down ultraSonic trig pin
#define topEchoPin      29    //top ultraSonic echo pin
#define downEchoPin     28    //down ultraSonic echo pin
#define TOPULTRASONIC   0x11  //top ultraSonic index
#define DOWNULTRASONIC  0x22  //down ultrasonic index

dht DHT;

std_msgs::String light_msg;
std_msgs::String tempe_msg;
std_msgs::String humidity_msg;
std_msgs::String gas_msg;
std_msgs::Byte body_msg;
std_msgs::Float32 IR_msg;
std_msgs::Byte touch_msg;
sensor_msgs::Range top_range_msg;
sensor_msgs::Range down_range_msg;

ros::Publisher pub_light("/sensor/lightValue",   &light_msg);
ros::Publisher pub_temp("/sensor/temperature",   &tempe_msg);
ros::Publisher pub_humidity("/sensor/humidity",  &humidity_msg);
ros::Publisher pub_gas("/sensor/gasValue",       &gas_msg);
ros::Publisher pub_body("/sensor/bodyDetect",    &body_msg);
ros::Publisher pub_IR("/sensor/IRValue",         &IR_msg);
ros::Publisher pub_touch("/sensor/touchValue",   &touch_msg);
ros::Publisher pub_topRange("/sensor/topUltraSound",   &top_range_msg);
ros::Publisher pub_downRange("/sensor/downUltraSound", &down_range_msg);

ros::NodeHandle nh;

char temp[5];
char humi[5];
char lightStr[5];
char gasStr[6];
char ultraSonic_frameid[] = "/ultraSonic_ranger";

//init function
void setup() {
  setupPinMode();
  setupAdvertisePub();
  setupUltraSonicMsg();
}

void loop() {
  pubTempeHumiSensorData();
  pubIRData();
  pubLightSensorData();
  pubGasSensorData();
  pubBodyDetectData();
  pubTouchSensorData();
  pubUltraSonicData(TOPULTRASONIC);  //publish top UltraSonic value
  pubUltraSonicData(DOWNULTRASONIC); //publish down UltraSonic value

  nh.spinOnce();
}

void setupPinMode()
{
  pinMode(FBodySensorPin, INPUT);
  pinMode(LBodySensorPin, INPUT);
  pinMode(RBodySensorPin, INPUT);
  pinMode(BBodySensorPin, INPUT);
  pinMode(LeftTouchPin,   INPUT);
  pinMode(RightTouchPin,  INPUT);

  pinMode(topTrigPin,     OUTPUT);
  pinMode(topEchoPin,     INPUT);
  pinMode(downTrigPin,    OUTPUT);
  pinMode(downEchoPin,    INPUT);
}

void setupAdvertisePub()
{
  nh.initNode();
  nh.advertise(pub_light);
  nh.advertise(pub_temp);
  nh.advertise(pub_humidity);
  nh.advertise(pub_gas);
  nh.advertise(pub_body);
  nh.advertise(pub_IR);
  nh.advertise(pub_touch);
  nh.advertise(pub_topRange);
  nh.advertise(pub_downRange);
}

void setupUltraSonicMsg()
{
  top_range_msg.radiation_type = sensor_msgs::Range::ULTRASOUND;
  top_range_msg.header.frame_id = ultraSonic_frameid;
  top_range_msg.field_of_view = 0.1;
  top_range_msg.min_range = 0.25;
  top_range_msg.max_range = 4.5;

  down_range_msg.radiation_type = sensor_msgs::Range::ULTRASOUND;
  down_range_msg.header.frame_id = ultraSonic_frameid;
  down_range_msg.field_of_view = 0.1;
  down_range_msg.min_range = 0.25;
  down_range_msg.max_range = 4.5;
}

void pubTempeHumiSensorData()
{
  delay(1000);
  int chk = DHT.read22(DHT22_PIN);  //read sensor data

  tempe_msg.data =  dtostrf(DHT.temperature, 3, 1, temp);
  pub_temp.publish(&tempe_msg);

  humidity_msg.data =  dtostrf(DHT.humidity, 3, 1, humi);
  pub_humidity.publish(&humidity_msg);
}

void pubLightSensorData()
{
  int val = analogRead(lightSensorPin); //connect grayscale sensor to Analog
  light_msg.data = itostr(lightStr, val);
  pub_light.publish(&light_msg);
}

void pubGasSensorData()
{
  int data = analogRead(gasSensorPin);
  gas_msg.data = itostr(gasStr, data);
  pub_gas.publish(&gas_msg);
}

void pubTouchSensorData()
{
  //get touch position
  byte pose = 0;
  if (digitalRead(LeftTouchPin) && digitalRead(RightTouchPin))
  {
    pose = 3;
  }
  else if (digitalRead(RightTouchPin))
  {
    pose = 2;
  }
  else if (digitalRead(LeftTouchPin))
  {
    pose = 1;
  }
  else
  {
    pose = 0;
  }

  if (pose != 0)
  {
    //publish msg to topic,when detect touch will decrease delay
    touch_msg.data = pose;
    pub_touch.publish(&touch_msg);
  }
  if (pose == 0)
  {
    delay(1000);
  }
}

//publish body detect sensor data
void pubBodyDetectData()
{
  byte result = 0;
  byte Astate = digitalRead(FBodySensorPin);
  byte Bstate = digitalRead(LBodySensorPin);
  byte Cstate = digitalRead(RBodySensorPin);
  byte Dstate = digitalRead(BBodySensorPin);
  if (DETECTBODY == Astate) //detect front body
  {
    result = 1;
  }
  else if (DETECTBODY == Bstate) //detect left body
  {
    result = 2;
  }
  else if (DETECTBODY == Cstate) //detect right body
  {
    result = 3;
  }
  else if (DETECTBODY == Dstate) //detect behind body
  {
    result = 4;
  }
  else //no detect body
  {
    result = 0;
  }
  //publish msg to topic
  if (result != 0)
  {
    body_msg.data = result;
    pub_body.publish(&body_msg);
  }
}

//get IR value
void pubIRData()
{
  float volts = analogRead(FontIRPin) * 0.0048828125;
  float distance = 65 * pow(volts, -1.10);
  IR_msg.data = distance;
  pub_IR.publish(&IR_msg);
}

void pubUltraSonicData(int flag)
{
  if (flag == TOPULTRASONIC) //top ultraSonic
  {
    digitalWrite(topTrigPin, LOW);  // Set the trigger pin to low for 2uS
    delayMicroseconds(2);
    digitalWrite(topTrigPin, HIGH); // Send a 10uS high to trigger ranging
    delayMicroseconds(10);
    digitalWrite(topTrigPin, LOW);  // Send pin low again

    top_range_msg.range = getRange(topEchoPin);
    top_range_msg.header.stamp = nh.now();
    pub_topRange.publish(&top_range_msg);
  }
  else //down ultraSonic
  {
    digitalWrite(downTrigPin, LOW);  // Set the trigger pin to low for 2uS
    delayMicroseconds(2);
    digitalWrite(downTrigPin, HIGH); // Send a 10uS high to trigger ranging
    delayMicroseconds(10);
    digitalWrite(downTrigPin, LOW);  // Send pin low again

    down_range_msg.range = getRange(downEchoPin);
    down_range_msg.header.stamp = nh.now();
    pub_downRange.publish(&down_range_msg);
  }
}

float getRange(int pin_num)
{
  float distance;
  distance = pulseIn(pin_num, HIGH, 26000); // Read in times pulse
  distance = distance / 5800.00;
  return distance;
}

/*convert int to string*/
char* itostr(char *str, int i)
{
  sprintf(str, "%d", i);
  return str;
}


