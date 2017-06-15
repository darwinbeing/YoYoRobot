#include "ros/ros.h"
#include <unistd.h>
#include "ros_arduino_msgs/AnalogFloat.h"
#include "ros_arduino_msgs/DigitalWrite.h"

#define  POWEROFF  0
#define  POWERON   1

ros::ServiceClient client;
static int alarmFlag = 0;
static int motorPin = 0;
static int alarmPin = 0;
static double maxCurrent = 0.0;
static int delayTime = 0;

void currentCallback(const ros_arduino_msgs::AnalogFloat::ConstPtr& msg)
{
    //ROS_INFO("Get motors current:[%f]", msg->value);
    if(msg->value > maxCurrent)
    {
        alarmFlag = POWERON;
        ROS_ERROR("detect motor current dangerous! maxCurrent=[%f]", maxCurrent);
        ros_arduino_msgs::DigitalWrite srv;
        srv.request.pin = motorPin;
        srv.request.value = POWEROFF;
        if(client.call(srv))
        {
            ROS_WARN("now poweroff mobilebase motors!");
            srv.request.pin = alarmPin;
            srv.request.value = POWERON;
            if(client.call(srv))
            {
                ROS_WARN("Now poweron alarm light!");
            }
        }
    }
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "proctect_motors");
    ros::NodeHandle nh;
    ros_arduino_msgs::DigitalWrite srv;
    ros::Rate r(10);

    /*get param*/
    ros::param::get("~motor_power_pin", motorPin);
    ros::param::get("~alarm_power_pin", alarmPin);
    ros::param::get("~max_current", maxCurrent);
    ros::param::get("~delay_time", delayTime);

    ros::Subscriber sub = nh.subscribe("/mobileBase_arduino/sensor/motors_current", 10, currentCallback);
    client = nh.serviceClient<ros_arduino_msgs::DigitalWrite>("/mobileBase_arduino/digital_write");
    

    while(ros::ok())
    {
        if(alarmFlag)
        {
            sleep(delayTime);
            alarmFlag = POWEROFF;
            srv.request.pin = motorPin;
            srv.request.value = POWERON;
            if(client.call(srv))
            {
                srv.request.pin = alarmPin;
                srv.request.value = POWEROFF;
                if(client.call(srv))
                {
                    ROS_WARN("Now poweron motor voltage and close alram light !");
                }
            }

        }
        ros::spinOnce();
        r.sleep();
    }

    return 0;
}
