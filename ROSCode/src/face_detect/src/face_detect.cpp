/**
 * author: corvin
 * description: detect face and follow face move head servo
 */

#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <cstdlib>

#include <face_detect/faces.h>
#include <face_detect/facebox.h>

using namespace std;
using namespace cv;


#define TAKEPICTURE_CMD  8002

CascadeClassifier face_cascade;
bool showResult = true;
ros::Publisher pub;
int frame_id = 0;
ros::Publisher pub_facePosition;
int flag = 0;

int faceCenter_x = 0;
int faceCenter_y = 0;
int imageCenter_x = 320;
int imageCenter_y = 240;
int upDownServoCenter = 1050;       //up and down servo center position
int leftRightServoCenter = 2090;    //left and right servo center postion

image_transport::Publisher pub_image;

/**
 * from image detect if have face
 *
 */
vector<Rect> detectFaces(Mat frame)
{
    vector<Rect> faces;
    Mat bufferMat;
    cvtColor(frame, bufferMat, COLOR_BGR2GRAY);
    equalizeHist(bufferMat, bufferMat);
    face_cascade.detectMultiScale(bufferMat, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30));

    return faces;
}

/**
 * get image from usb_cam,this is callback function,process the image
 */
void imageCB(const sensor_msgs::ImageConstPtr& msg)
{
    int center_x = 0; //check face center x
    int center_y = 0; //check face center y

    cv_bridge::CvImagePtr cvPtr;
    try {
        cvPtr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    } catch (cv_bridge::Exception& e) {
         ROS_ERROR("cv_bridge exception: %s", e.what());
         return;
    }

    vector<Rect> faces = detectFaces(cvPtr->image);
    face_detect::faces faces_msg;
    face_detect::facebox _facebox;
    faces_msg.image_width = cvPtr->image.cols;
    faces_msg.image_height = cvPtr->image.rows;
    // cout << "image cols :" << faces_msg.image_width << ", height :" << faces_msg.image_height << endl;
    // when get take picture cmd will send one picutre to topic
    if(flag)
    {
        flag = 0;
        cv::waitKey(30);
        sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", cvPtr->image).toImageMsg();

        pub_image.publish(msg);
        sleep(5); //when publish image msg over,then move headServo
    }

    for (int i = 0; i<faces.size(); i++)
    {
       _facebox.top    = faces[i].y;
       _facebox.left   = faces[i].x;
       _facebox.width  = faces[i].width;
       _facebox.height = faces[i].height;
       faces_msg.face_boxes.push_back(_facebox);
       rectangle(cvPtr->image, faces[i], CV_RGB(150, 150, 255), 2);

       center_y = faces[i].y + (faces[i].height)/2;
       center_x = faces[i].x + (faces[i].width/2);
       cout << "face center position:" << faces[i].x + (faces[i].width)/2 <<  ", "
                                       <<faces[i].y + (faces[i].height/2) << endl;
       usleep(3000);
    }

    //only check face will publish face msg
    if(faces.size() == 1)
    {
        frame_id++ ;

        //update up and down servo position
        int diffUpDown = (imageCenter_y - center_y)/10;
        std_msgs::Int32 upDownMsg;
        upDownMsg.data = upDownServoCenter + diffUpDown;
        cout << "publish upDown servo position :" << upDownMsg.data << endl;
        pub_facePosition.publish(upDownMsg);

        //update left and righ servo position
        int diffLeftRight = (imageCenter_x - center_x)/10;
        std_msgs::Int32 leftRightMsg;
        leftRightMsg.data = leftRightServoCenter + diffLeftRight;
        pub_facePosition.publish(leftRightMsg);
        cout << "publish leftRight servo position :" << leftRightMsg.data << endl;
        cout << "-----------------------------------------------------" << endl;

        pub.publish(faces_msg);
    }

    if (showResult)
    {
       imshow("Live Feed", cvPtr->image);
       waitKey(3);
    }
}

/**
 * when get take picture cmd will send topic one picture
 */
void cmdCallBack(const std_msgs::Int32::ConstPtr& msg)
{
    if(msg->data == TAKEPICTURE_CMD)
    {
        flag = 1;
    }
}

int main(int argc, char **argv) {
   face_cascade.load("/usr/share/opencv/haarcascades/haarcascade_frontalface_alt2.xml");
   ros::init(argc, argv, "face_detect");
   ros::NodeHandle nh;
   nh.param("/face_detect/showResult", showResult, true);

   pub = nh.advertise<face_detect::faces>("/faces", 1);
   ros::Subscriber sub = nh.subscribe("/usb_cam_node/image_raw", 1, imageCB);
   ros::Subscriber sub_cmd = nh.subscribe("/aiui/control", 3, cmdCallBack);

   image_transport::ImageTransport it(nh);
   pub_image = it.advertise("/camera/one_image_topic", 1);
   pub_facePosition = nh.advertise<std_msgs::Int32>("/sensor/lightServoControl", 3);

   ros::spin();
}

