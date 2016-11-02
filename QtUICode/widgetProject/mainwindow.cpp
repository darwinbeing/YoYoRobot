#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QLabel>
#include <QMovie>
#include <QTimer>
#include <QString>


int flag = 0;
QString normalPath = "/home/corvin/Pictures/main/normal.gif";
QString shyPath = "/home/corvin/Pictures/main/shy.gif";

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->showMaximized();
    this->setWindowFlags(Qt::FramelessWindowHint);
    this->setWindowFlags(Qt::WindowCloseButtonHint);
    //窗体最大 300*300
    //this->setMaximumSize(1024,600);
    //窗体最小 300*300
    //this->setMinimumSize(1024,600);
    this->move(0,0);


    QMovie *normalMovie = new QMovie(normalPath);
    ui->label->setMovie(normalMovie);
    normalMovie->start();
}

//获取鼠标点定位窗体位置
void MainWindow::mousePressEvent(QMouseEvent *e)
{
    //last = e->globalPos();
//    if(0 ==flag)
//    {
//        QMovie *shyMovie = new QMovie();
//        ui->label->setMovie(shyMovie);
//        shyMovie->start();
//    }
//    else
//    {
//        flag = 1;
//        QMovie *normalMovie = new QMovie("/home/corvin/Pictures/faceGIF/main/normal.gif");
//        ui->label->setMovie(normalMovie);
//        normalMovie->start();
//    }
}
void MainWindow::mouseMoveEvent(QMouseEvent *e)
{
//    int dx = e->globalX() - last.x();
//    int dy = e->globalY() - last.y();
//    last = e->globalPos();
    //move(x()+dx,y()+dy); //移动窗口
}
void MainWindow::mouseReleaseEvent(QMouseEvent *e)
{
//    int dx = e->globalX() - last.x();
//    int dy = e->globalY() - last.y();
    //move(x()+dx, y()+dy);

    //normalMovie->stop(); //pause old movie
    if(1 ==flag)
    {
        QMovie *shyMovie = new QMovie(normalPath);
        ui->label->setMovie(shyMovie);
        shyMovie->start();
         flag = 0;
    }
    else
    {
        flag = 1;
        QMovie *shyMovie = new QMovie(shyPath);
        ui->label->setMovie(shyMovie);
        shyMovie->start();
    }
//    n2 = QDateTime::currentDateTime();
//    do{
//        now=QDateTime::currentDateTime();
//    } while (n2.secsTo(now)<=6);//6为需要延时的秒数
//    QThread::sleep (6);
//    ui->label->setMovie(normalMovie);
//    normalMovie->start();
}


MainWindow::~MainWindow()
{
    delete ui;
}
