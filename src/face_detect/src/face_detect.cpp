#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <std_msgs/String.h>
#include <cstdlib>

#include <face_detect/faces.h>
#include <face_detect/facebox.h>

using namespace std;
using namespace cv;

CascadeClassifier face_cascade;
bool showResult = true;
ros::Publisher pub;
int frame_id = 0;

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

    for (int i = 0; i<faces.size(); i++)
    {
       _facebox.top = faces[i].y;
       _facebox.left = faces[i].x;
       _facebox.width = faces[i].width;
       _facebox.height = faces[i].height;
       faces_msg.face_boxes.push_back(_facebox);
       rectangle(cvPtr->image, faces[i], CV_RGB(250, 100, 155), 2);
       //system("ekho \"你好呀\"");
       //sleep(1);
    } 
  
    frame_id++ ;
    pub.publish(faces_msg);
    if (showResult) {
       imshow("Live Feed", cvPtr->image);
       waitKey(3);
    }
}

int main(int argc, char **argv) {
   face_cascade.load("/usr/share/opencv/haarcascades/haarcascade_frontalface_alt.xml");
   ros::init(argc, argv, "face_detect");
   ros::NodeHandle nh;
   nh.param("/face_detect/showResult", showResult, true);
   pub = nh.advertise<face_detect::faces>("/faces", 5);
   ros::Subscriber sub = nh.subscribe("/usb_cam/image_raw", 1, imageCB);
   ros::spin();
}

