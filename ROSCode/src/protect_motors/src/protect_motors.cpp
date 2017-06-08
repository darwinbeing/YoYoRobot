#include "ros/ros.h"
#include <unistd.h>
#include "ros_arduino_msgs/AnalogFloat.h"
#include "ros_arduino_msgs/DigitalWrite.h"

ros::ServiceClient client;
int alarmFlag = 0;

void currentCallback(const ros_arduino_msgs::AnalogFloat::ConstPtr& msg)
{
    ROS_INFO("Get motors current:[%f]", msg->value);
    if(msg->value > 1.8)
    {
        alarmFlag = 1;
        ROS_ERROR("detect motor current dangerous!");
        ros_arduino_msgs::DigitalWrite srv;
        srv.request.pin = 52;
        srv.request.value = 0;
        if(client.call(srv))
        {
            ROS_WARN("now poweroff mobilebase motors!");
            srv.request.pin = 51;
            srv.request.value = 1;
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

    ros::Subscriber sub = nh.subscribe("/mobileBase_arduino/sensor/motors_current", 10, currentCallback);
    client = nh.serviceClient<ros_arduino_msgs::DigitalWrite>("/mobileBase_arduino/digital_write");

    while(ros::ok())
    {
        if(alarmFlag)
        {
            sleep(8);
            alarmFlag = 0;
            srv.request.pin = 52;
            srv.request.value = 1;
            if(client.call(srv))
            {
                srv.request.pin = 51;
                srv.request.value = 0;
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
