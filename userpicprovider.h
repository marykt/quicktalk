#ifndef USERPICPROVIDER_H
#define USERPICPROVIDER_H
#include<QMap>
#include<QPixmap>
#include <QObject>
#include<QDebug>
#include<QQuickImageProvider>
class UserpicProvider :public QQuickImageProvider
{

    //signals:
    //    void dataChanged();
public:
    QMap<QString ,QPixmap> data;
    UserpicProvider(): QQuickImageProvider(QQuickImageProvider::Pixmap)
    {

    }
    //    void addValueToData(QString key,QPixmap value){
    //        data.insert(key,value);
    //        emit dataChanged();
    //    }
    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
    {
        int width = 50;
        int height = 50;

        if (size)
            *size = QSize(width, height);
        QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                       requestedSize.height() > 0 ? requestedSize.height() : height);
        qDebug()<<"find key:"<<id;
        if(data.contains(id)){
            return  data.find(id).value();
            //  return data.take(id);


        }

        //  QEventLoop eventLoop;
        //  QObject::connect(this, SIGNAL(dataChanged()), &eventLoop, SLOT(quit()));
        // eventLoop.exec();

        //        if(data.contains(id)){
        //          return  data.find(id).value();
        //          //  return data.take(id);


        //        }
        else{
            pixmap.fill(QColor("white").rgba());
            //如果有信息则返回
            //没有就返回默认的hhh
            return pixmap;

        }
    }

};

#endif // USERPICPROVIDER_H
