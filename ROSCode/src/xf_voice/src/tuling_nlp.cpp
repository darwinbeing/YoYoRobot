/*
 * nlp node
 * author:corvin
 *
*/

#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sstream>
#include <jsoncpp/json/json.h>
#include <curl/curl.h>
#include <string>
#include <exception>

using namespace std;

#define BUFERSIZE 1024

int flag = 0;
string result;

int writer(char *data, size_t size, size_t nmemb, string *writerData)
{
     if (writerData == NULL)
     {
         return 0;
     }
     int len = size*nmemb;
     writerData->append(data, len);

     return len;
}


int parseJsonResonse(string input)
{
    Json::Value root;
    Json::Reader reader;
    bool parsingSuccessful = reader.parse(input, root);

    if(!parsingSuccessful)
    {
        cout << "!!! Failed to parse the response data" <<endl;
        return 1;
    }
    const Json::Value code = root["code"];
    const Json::Value text = root["text"];
    result = text.asString();
    cout << "response code:" << code << endl;
    cout << "response text:" << result <<endl;
}


int HttpPostRequest(string input)
{
    char* str = (char*)malloc(BUFERSIZE);
    string buffer;
    result = "";
    memset(str, 0, BUFERSIZE);

    std::string strJson = "{";
    strJson += "\"key\" : \"175418b0747f4c50b15843fe0849067e\",";
    strJson += "\"info\" : ";
    strJson += "\"";
    strJson += input;
    strJson += "\"";
    strJson += "}";

    strcpy(str, strJson.c_str());
    cout<< "post json string:" << str <<endl;
    try
    {
        CURL *pCurl = NULL;
        CURLcode res;
        curl_global_init(CURL_GLOBAL_ALL);

        // get a curl handle
        pCurl = curl_easy_init();
        if (NULL != pCurl)
        {
            // 设置超时时间为8秒
            curl_easy_setopt(pCurl, CURLOPT_TIMEOUT, 8);

            // First set the URL that is about to receive our POST.
            curl_easy_setopt(pCurl, CURLOPT_URL, "http://www.tuling123.com/openapi/api");

            // 设置http发送的内容类型为JSON
            curl_slist *plist = curl_slist_append(NULL,"Content-Type:application/json; charset=UTF-8");
            curl_easy_setopt(pCurl, CURLOPT_HTTPHEADER, plist);

            // 设置要POST的JSON数据
            curl_easy_setopt(pCurl, CURLOPT_POSTFIELDS, str);

            curl_easy_setopt(pCurl, CURLOPT_WRITEFUNCTION, writer);
            curl_easy_setopt(pCurl, CURLOPT_WRITEDATA, &buffer);

            // Perform the request, res will get the return code
            res = curl_easy_perform(pCurl);

            // Check for errors
            if (res != CURLE_OK)
            {
                printf("curl_easy_perform() failed:%s\n", curl_easy_strerror(res));
            }
            // always cleanup
            curl_easy_cleanup(pCurl);
        }
        curl_global_cleanup();
    }
    catch (std::exception &ex)
    {
        printf("!!! curl exception %s.\n", ex.what());
    }

    free(str);
    if(buffer.empty())
    {
        cout << "!!! ERROR The TuLing server response NULL" <<endl;
    }
    else
    {
        flag = 1;
        parseJsonResonse(buffer);
    }

    return 0;
}



/**
*   when nlp node get input,will auto send http post request to tuling server
**/
void nlpCallback(const std_msgs::String::ConstPtr& msg)
{
    std::cout<<"your question is:" << msg->data << std::endl;
    HttpPostRequest(msg->data);
}

/**
 * main function
 */
int main(int argc, char **argv)
{
    ros::init(argc, argv, "tuling_nlp");
    ros::NodeHandle ndHandle;

    ros::Subscriber sub = ndHandle.subscribe("/voice/tuling_nlp", 10, nlpCallback);
    ros::Publisher pub = ndHandle.advertise<std_msgs::String>("/voice/xf_tts", 10);
    ros::Rate loop_rate(10);

    while(ros::ok())
    {
        if(flag)
        {
           std_msgs::String msg;
           msg.data = result;
           pub.publish(msg);
           flag = 0;
        }
        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}


