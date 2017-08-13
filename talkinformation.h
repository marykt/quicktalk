#ifndef TALKINFORMATION_H
#define TALKINFORMATION_H
#include"global.h"
#include"jsonreceiver.h"
#include <QObject>
#include<QVector>
#include<QHostAddress>
#include"othersusersinformation.h"
#include"userpicprovider.h"
#include"usertool.h"
class TalkInformation : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QList<Message>	messageBox	READ	getMessageBox NOTIFY messageBoxChanged)
public:
    explicit TalkInformation(QObject *parent = 0){

    }
    //explicit UserTool(UserData * userdata,QObject *parent = 0);
    explicit  TalkInformation(UserpicProvider *provider,UserTool *tool,QObject *parent = 0);
    ~TalkInformation();
    UserpicProvider* provider;
    UserTool *tool;
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
    OthersUsersInformation othersUsersInformation;
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
