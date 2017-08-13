#include "udpsender.h"
#include"global.h"
#include<QHostInfo>
UdpSender::UdpSender()
{
    sender = new QUdpSocket(this);

}
void UdpSender:: sendMessage(QString message){
    QByteArray datagram = message.toUtf8();

    sender->writeDatagram(datagram.data(),datagram.size(),
                          QHostAddress::Broadcast,45454);
    emit sendOver();
}
UdpSender::~UdpSender(){
    delete sender;

}
