#ifndef UDPRECEIVER_H
#define UDPRECEIVER_H
#include<QObject>
#include<QUdpSocket>
class UdpReceiver: public QObject
{
    Q_OBJECT

public:
    QByteArray datagram; //拥于存放接收的数据报
    QHostAddress host;
    QUdpSocket *receiver;
    UdpReceiver();
    ~UdpReceiver();
signals:
    void readyRead();
public slots:
    void  handleUdpData();
};

#endif // UDPRECEIVER_H
