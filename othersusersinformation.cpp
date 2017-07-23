#include "othersusersinformation.h"
#include"jsonsender.h"
#include<QJsonObject>
OthersUsersInformation::OthersUsersInformation(QObject *parent) : QObject(parent)
{

}

UserInformation OthersUsersInformation::getInformationFromIP(QHostAddress host)
{
    if(this->otherUsersinfo.contains( host.toString())){
        // otherUsersinfo.
        return otherUsersinfo.find(host.toString()).value();
    }
    else{
        UserInformation info;
        info.host=host;
        info.messageContent="";
        info.username="waiting";
        info.userPicUrl="image://userpic/"+host.toString();
        //发送信号请求用户信息
        JsonSender s;
        QJsonObject json;
        // json.insert("username", userdata->getUsername());?
        json.insert("aim",host.toString());
        json.insert("app","quicktalk");
        json.insert("type","getInformation");
        s.sendJson(json);
        otherUsersinfo.insert(host.toString(),info);
        return info;
    }

}
