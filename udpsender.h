#ifndef UDPSENDER_H
#define UDPSENDER_H
#include<QObject>
#include<QUdpSocket>
class UdpSender: public QObject
{
    Q_OBJECT
public:
    QUdpSocket *sender;
    UdpSender();
    ~UdpSender();
    void sendMessage(QString message);
signals:
    void sendOver();
};

#endif // UDPSENDER_H
