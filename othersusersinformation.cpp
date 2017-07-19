#include "othersusersinformation.h"

OthersUsersInformation::OthersUsersInformation(QObject *parent) : QObject(parent)
{

}

UserInformation OthersUsersInformation::getInformationFromIP(QHostAddress host)
{
    if(this->otherUsersinfo.contains( host.toString())){

        return otherUsersinfo.take(host.toString());
    }
    else{
        UserInformation info;
        info.host=host;
        info.messageContent="";
        info.username="waiting";
        info.userPicUrl="qrc:/图片1.jpg";
        return info;
        //后期应该发送一个信号
        //通过向源用户请求详细信息来标识
        //用户在进入时就应该先介绍自己一遍
        //离开时应该说再见＠—＠

    }

}
