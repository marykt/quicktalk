#ifndef USERTOOL_H
#define USERTOOL_H

#include <QObject>
#include"jsonsender.h"
#include"userdata.h"
class UserTool : public QObject
{
    Q_OBJECT

public:
    UserData *userdata;
    JsonSender sender;
    explicit UserTool(QObject *parent = 0);
    explicit UserTool(UserData * userdata,QObject *parent = 0);
    Q_INVOKABLE void sendMessage(QString message);
    Q_INVOKABLE bool istMyIp(QString ipaddr);

signals:

public slots:
};

#endif // USERTOOL_H
