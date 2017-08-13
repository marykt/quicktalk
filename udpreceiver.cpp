#include "udpreceiver.h"
#include<QDebug>
UdpReceiver::UdpReceiver()
{
    receiver = new QUdpSocket(this);
    receiver->bind(45454,QUdpSocket::ShareAddress);
    connect(receiver,SIGNAL(readyRead()),this,SLOT(handleUdpData()));
    /*我们在构造函数中将receiver绑定到45454端口，这个端口就是上面发送端设置的端口，二者必须一样才能保证接收到数据报。
                 我们这里使用了绑定模式QUdpSocket::ShareAddress，它表明其他服务也可以绑定到这个端口上。因为当receiver发现有数据
                 报到达时就会发出readyRead()信号，所以我们将其和我们的数据报处理函数相关联。
    数据报处理槽函数实现如下：  */

}
UdpReceiver::~UdpReceiver(){
    delete receiver;
}

void UdpReceiver::handleUdpData()
{
    while(receiver->hasPendingDatagrams())  //拥有等待的数据报
    {

        quint16 port;

        datagram.resize(receiver->pendingDatagramSize());
        //让datagram的大小为等待处理的数据报的大小，这样才能接收到完整的数据
        receiver->readDatagram(datagram.data(),datagram.size(),&host,&port);
        //接收数据报，将其存放到datagram中
        // qDebug()<<"receive data<<"<<datagram<<endl<<host<<port<<endl;
        //将数据报内容显示出来
        emit readyRead();
    }
}
