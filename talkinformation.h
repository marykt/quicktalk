#ifndef TALKINFORMATION_H
#define TALKINFORMATION_H
#include"global.h"
#include"jsonreceiver.h"
#include <QObject>
#include<QVector>
#include<QHostAddress>

class TalkInformation : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QList<Message>	messageBox	READ	getMessageBox NOTIFY messageBoxChanged)
public:
    explicit TalkInformation(QObject *parent = 0);
    ~TalkInformation();
    QList <Message>messageBox;//聊天信息
   Q_INVOKABLE int getMessageBoxSize();
//    struct Message{
//        QString userPicUrl;
//        QString username;
//        QString messageContent;
//        QHostAddress host;
//        QTime time;
//    };
  Q_INVOKABLE  QString getMessageBoxContentat(int value);
      Q_INVOKABLE  QString getMessageBoxUsernameat(int value);
    Q_INVOKABLE  QString getMessageBoxUserPicUrlat(int value);
     Q_INVOKABLE  QString getMessageBoxIpat(int value);

private:
    QList <Message> getMessageBox();
    JsonReceiver *receiver;
    void addMessage(Message message);
signals:
    void messageBoxadded();
    void messageBoxChanged();

public slots:
    void receiveMessage();

};

#endif // TALKINFORMATION_H
