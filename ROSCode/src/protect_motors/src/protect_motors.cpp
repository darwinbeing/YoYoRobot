#include "ros/ros.h"
#include "ros_arduino_msgs/AnalogFloat.h"
#include "ros_arduino_msgs/DigitalWrite.h"

ros::ServiceClient client;

void currentCallback(const ros_arduino_msgs::AnalogFloat::ConstPtr& msg)
{
    ROS_INFO("Get motors current:[%f]", msg->value);
    if(msg->value > 2.0)
    {
        ROS_ERROR("detect motor current dangerous!");
        ros_arduino_msgs::DigitalWrite srv;
        srv.request.pin = 52;
        srv.request.value = 0;
        if(client.call(srv))
        {
            ROS_WARN("now poweroff mobilebase motors!");
        }
    }
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "proctect_motors");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/mobileBase_arduino/sensor/motors_current", 10, currentCallback);
    client = nh.serviceClient<ros_arduino_msgs::DigitalWrite>("/mobileBase_arduino/digital_write");

    ros::spin();

    return 0;
}
