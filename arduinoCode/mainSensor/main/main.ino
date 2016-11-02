//author:corvin
//date:2016.9.6
//description: create /sensor/lightValue topic to publish light sensor data;
//create /sensor/temperature topic to publish temperature sensor data;
//create /sensor/humidity topic to publish humidity sensor data;
//create /sensor/gasSensor topic to publish gas sensor data
//create /sensor/bodyDetect topic to publish body sensor data
//create /sensor/IRValue topic to publish IR sensor data
//How to check result in x86 machine:
//(1)start "roscore" in x86;
//(2)"rosrun rosserial_python serial_node.py /dev/ttyACM0 _baud:=57600"
//(3)"rostopic echo /sensor/lightValue" --show light sensor data
//(4)"rostopic echo /sensor/temperature" --show temperature sensor data
//(5)"rostopic echo /sensor/humidity" --show humidity sensor data
//(6)"rostopic echo /sensor/gasSensor" --show gas sensor data
//(7)"rostopic echo /sensor/bodyDetect" --show body sensor data,0:no detect body, 
//                                     --1:front detected,2:left detected,3:right detected
//(8)"rostopic echo /sensor/IRValue"  --show IR value

#include <ros.h>
#include <dht.h>
#include <std_msgs/String.h>
#include <std_msgs/Byte.h>
#include <std_msgs/Float32.h>

#define DETECTBODY      1
#define lightSensorPin  6   //light pin is Analog A6
#define gasSensorPin    7   //gas sensor in Analog pin A7
#define FontIRPin       9   //front IR sensor pin
#define DHT22_PIN       53  //tempreture and humidity sensor pin
#define FBodySensorPin  14  //front body sensor
#define LBodySensorPin  15  //left body sensor
#define RBodySensorPin  16  //right body sensor


dht DHT;

std_msgs::String light_msg;
std_msgs::String tempe_msg;
std_msgs::String humidity_msg;
std_msgs::String gas_msg;
std_msgs::Byte body_msg;
std_msgs::Float32 IR_msg;

ros::Publisher pub_light("/sensor/lightValue",   &light_msg);
ros::Publisher pub_temp("/sensor/temperature",   &tempe_msg);
ros::Publisher pub_humidity("/sensor/humidity",  &humidity_msg);
ros::Publisher pub_gas("/sensor/gasValue",       &gas_msg);
ros::Publisher pub_body("/sensor/bodyDetect",    &body_msg);
ros::Publisher pub_IR("/sensor/IRValue",         &IR_msg);
ros::NodeHandle nh;

char temp[5];
char humi[5];
char lightStr[5];
char gasStr[6];

//init function
void setup() {
  pinMode(FBodySensorPin, INPUT);
  pinMode(LBodySensorPin, INPUT);
  pinMode(RBodySensorPin, INPUT);
  
  nh.initNode();
  nh.advertise(pub_light);
  nh.advertise(pub_temp);
  nh.advertise(pub_humidity);
  nh.advertise(pub_gas);
  nh.advertise(pub_body);
  nh.advertise(pub_IR);
}

void loop() {
  delay(1000);
  int chk = DHT.read22(DHT22_PIN);  //read sensor data

  tempe_msg.data =  dtostrf(DHT.temperature, 3, 1, temp);
  pub_temp.publish(&tempe_msg);

  humidity_msg.data =  dtostrf(DHT.humidity, 3, 1, humi);
  pub_humidity.publish(&humidity_msg);

  int val = analogRead(lightSensorPin); //connect grayscale sensor to Analog
  light_msg.data = itostr(lightStr, val);
  pub_light.publish(&light_msg);

  int data = analogRead(gasSensorPin);
  gas_msg.data = itostr(gasStr, data);
  pub_gas.publish(&gas_msg);

  //body detect sensor
  byte result = 0;
  byte Astate = digitalRead(FBodySensorPin);
  byte Bstate = digitalRead(LBodySensorPin);
  byte Cstate = digitalRead(RBodySensorPin);
  if(DETECTBODY == Astate) //detect front body
  {
    result = 1;
  }
  else if(DETECTBODY == Bstate) //detect left body
  {
    result = 2;
  }
  else if(DETECTBODY == Cstate) //detect right body
  {
    result = 3;
  }
  else //no detect body
  {
    result = 0;
  }
  //publish msg to topic
  body_msg.data = result;
  pub_body.publish(&body_msg);

  //get IR value
  float volts = analogRead(FontIRPin)*0.0048828125;
  float distance = 65*pow(volts, -1.10);
  IR_msg.data = distance;
  pub_IR.publish(&IR_msg);
  
  delay(1000);
  nh.spinOnce();
}

/*convert int to string*/
char* itostr(char *str, int i)
{
  sprintf(str, "%d", i);
  return str;
}


