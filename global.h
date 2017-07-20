#ifndef GLOBAL_H
#define GLOBAL_H
#include<QImage>
#include<QTime>
#include<QHostAddress>
#include<QDir>
struct Message{
    QString userPicUrl;
    QString username;
    QString messageContent;
    QHostAddress host;
    QTime time;
};
struct UserInformation{
    QString username;
    QHostAddress host;
    QString messageContent;
    QString userPicUrl;
};

#endif // GLOBAL_H
