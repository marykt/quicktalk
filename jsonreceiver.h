#ifndef JSONRECEIVER_H
#define JSONRECEIVER_H
#include<QObject>
#include<QJsonObject>
#include"udpreceiver.h"
#include<QDebug>
#include<QJsonParseError>
#include<QJsonDocument>
class JsonReceiver: public QObject
{
    Q_OBJECT
 private:
    UdpReceiver receiver;

public:
    QJsonObject json;
    QHostAddress host;
    explicit JsonReceiver(QObject *parent = 0);
    ~JsonReceiver(){}
signals:
    void readyRead();
public slots:
    void receiveJson(){

        QJsonParseError json_error;
        QJsonDocument parse_doucment =QJsonDocument::fromJson(receiver.datagram,&json_error);
        if(json_error.error ==QJsonParseError::NoError)
        {
            if(parse_doucment.isObject())
            {
                json=parse_doucment.object();
               // qDebug()<<"json<<"<<json<<endl;
                host=receiver.host;
                if(json.contains("app")&&json.take("app").toString()=="quicktalk")
                    emit readyRead();
            }
        }

    }
};

#endif // JSONRECEIVER_H
