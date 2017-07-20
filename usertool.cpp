#include "usertool.h"
#include<QDebug>
#include<QHostAddress>
#include<QHostInfo>
#include<exception>
#include<QNetworkInterface>
UserTool::UserTool(QObject *parent) : QObject(parent)
{

}

UserTool::UserTool(UserData *userdata, QObject *parent)
{
    this->userdata=userdata;
}

void UserTool::sendMessage(QString message)
{
    QJsonObject json;
    json.insert("content", message);
    json.insert("username", userdata->getUsername());
    json.insert("app","quicktalk");
    json.insert("type","message");
    qDebug()<<"send message success!";
    sender.sendJson(json);
}

bool UserTool::istMyIp(QString ipaddr)
{
    //QHostInfo类作用，获取主机名，也可以通过主机名来查找IP地址，或者通过IP地址来反向查找主机名。
  //  QString localHostName = QHostInfo::localHostName();
  //  qDebug() << "LocalHostName:" << localHostName;

    //获取IP地址
 //   QHostInfo info = QHostInfo::fromName(localHostName);
     QNetworkInterface iface;
     qDebug()<<ipaddr;
          iface.humanReadableName();
    for ( int i=0;i<QNetworkInterface().allAddresses().size();i++){
            qDebug()<<QNetworkInterface().allAddresses().at(i).toString();
            if(ipaddr.contains(QNetworkInterface().allAddresses().at(i).toString())){

                return true;
}
    }
   return false;
}
