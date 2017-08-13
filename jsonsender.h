#ifndef JSONSENDER_H
#define JSONSENDER_H
#include<QObject>
#include<QJsonObject>
#include<QJsonDocument>
#include"udpsender.h"

class JsonSender: public QObject
{
    Q_OBJECT
private:
    UdpSender sender;

public:
    explicit JsonSender(QObject *parent = 0){}
    ~JsonSender(){}
    void sendJson(QJsonObject json){
        qDebug()<<"I send json<<"<<json;
        QJsonDocument document;
        document.setObject(json);
        QByteArray byte_array =document.toJson(QJsonDocument::Compact);
        QString json_str(byte_array);
        sender.sendMessage(json_str);
        emit sendOver();

    }

signals:
    void sendOver();
};

#endif // JSONSENDER_H
