#ifndef OTHERSUSERSINFORMATION_H
#define OTHERSUSERSINFORMATION_H
#include"global.h"
#include <QObject>
#include<QMap>
class OthersUsersInformation : public QObject
{
    Q_OBJECT
    QMap<QString,UserInformation> otherUsersinfo;
public:
    explicit OthersUsersInformation(QObject *parent = 0);
    UserInformation getInformationFromIP(QHostAddress host);

signals:

public slots:
};

#endif // OTHERSUSERSINFORMATION_H
