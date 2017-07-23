#include "talkinformation.h"
#include<QDebug>
#include<QJsonObject>
#include<QPixmap>
#include<QBuffer>
#include"usertool.h"
TalkInformation::TalkInformation(UserpicProvider *provider,UserTool *tool,QObject *parent )//:(QObject *parent = 0)
{
    this->provider=provider;
    this->receiver=new JsonReceiver();
    this->tool=tool;
    connect(receiver,SIGNAL(readyRead()),this,SLOT(receiveMessage()));
}

TalkInformation::~TalkInformation()
{
    delete this->receiver;
}

int TalkInformation::getMessageBoxSize()
{
    return messageBox.size();
}

QString TalkInformation::getMessageBoxContentat(int value)
{
    return messageBox.at(value).messageContent;
}

QString TalkInformation::getMessageBoxUsernameat(int value)
{
    return messageBox.at(value).username;
}

QString TalkInformation::getMessageBoxUserPicUrlat(int value)
{
    return messageBox.at(value).userPicUrl;
}

QString TalkInformation::getMessageBoxIpat(int value)
{
    return messageBox.at(value).host.toString();
}



QList <Message> TalkInformation::getMessageBox()
{
    return messageBox;
}

void TalkInformation::addMessage(Message message)
{
    this->messageBox.append(message);

    qDebug()<<"messageadded!"<<endl;
    emit messageBoxadded();
    emit messageBoxChanged();
}

void TalkInformation::receiveMessage()
{
       // qDebug()<<"There is a message:"<<receiver->json;
            //  qDebug()<<   receiver->json.take("type").toString()<<endl;

      if(!receiver->json.contains("type"))
                return;
       QString type=receiver->json.take("type").toString();
      if(type=="message"){
           Message message;
           UserInformation info;

           info=othersUsersInformation.getInformationFromIP(receiver->host);

           message.userPicUrl=info.userPicUrl;
           message.username=info.username;

            if (receiver->json.contains("content")){
                QJsonValue content=receiver->json.take("content");
                if(content.toString().size()>0){
                    if(content.isString()){
                        message.messageContent=content.toString();
                    }
                    else
                        return;
                }
                else
                    return;
            }
            if (receiver->json.contains("username")){
                QJsonValue content=receiver->json.take("username");
                if(content.isString()){
                    message.username=content.toString();
                }
                else return;
            }

            else{
                return;
            }
            //其他数据


            message.host=receiver->host;
            message.userPicUrl;
            message.time;

            addMessage(message);
      }

      if(type=="getInformation"){
       //   UserTool tool;
      //    qDebug()<<"is my ip?:"<<tool.istMyIp(receiver->json.take("aim").toString());
            if(tool->istMyIp(receiver->json.take("aim").toString())){
                qDebug()<<"i will send my message!";
               QJsonObject json;
               //　json.insert("username", userdata->getUsername());
               tool->userdata->getUserPicUrl();//?死在这一步

               QPixmap pix;
               qDebug()<<tool->userdata->getUserPicUrl().remove(0,7);
        //       qDebug()<<tool->userdata->getUserPicUrl().remove(0,7);

               pix.load( tool->userdata->getUserPicUrl().remove(0,7));
            //   painter.drawPixmap(0,0,100,100,pix);

             //  qreal width = pix.width(); //获得以前图片的宽和高
             //  qreal height = pix.height();

               pix = pix.scaled(50,50);

               QBuffer buffer;
               pix.save(&buffer,"bmp");
               // QJsonValue value();

               QString s=buffer.data().toBase64();
               json.insert("pic",s);

               json.insert("app","quicktalk");
               json.insert("type","sendInformation");
                tool->sender.sendJson(json);

            }

      }
      if(type=="sendInformation"){
           //图片数据
        qDebug()<<"receive userInformation :";
          QByteArray Ret_bytearray;
           QByteArray bytearray=receiver->json.take("pic").toString().toLocal8Bit();
           Ret_bytearray = QByteArray::fromBase64(bytearray);
           QBuffer buffer(&Ret_bytearray);
           buffer.open(QIODevice::WriteOnly);
           QPixmap imageresult;

           imageresult.loadFromData(Ret_bytearray);
           qDebug()<<"insert to map"<<receiver->host.toString();
            provider->data.insert(receiver->host.toString(),imageresult);
           //其他数据
//           if (receiver->json.contains("content")){
//               QJsonValue content=receiver->json.take("content");
//               if(content.toString().size()>0){
//                   if(content.isString()){
//                       message.messageContent=content.toString();
//                   }
//                   else
//                       return;
//               }
//               else
//                   return;
//           }
//           if (receiver->json.contains("content")){
//               QJsonValue content=receiver->json.take("content");
//               if(content.toString().size()>0){
//                   if(content.isString()){
//                       message.messageContent=content.toString();
//                   }
//                   else
//                       return;
//               }
//               else
//                   return;
//           }
      }

}

