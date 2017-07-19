#include "talkinformation.h"
#include<QDebug>
TalkInformation::TalkInformation(QObject *parent) : QObject(parent)
{
    this->receiver=new JsonReceiver();
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
    Message message;

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

