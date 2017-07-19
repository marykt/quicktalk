#ifndef USERDATA_H
#define USERDATA_H
//未完成
#include <QObject>
#include<QImage>
class UserData : public QObject
{
    Q_OBJECT
private:
   QString username;
   QString userProfile;
  QString userPicUrl;
public:
    explicit UserData(QObject *parent = 0);
    void setUserPic(QString dir);
    void setUserProfile(QString userProfile);
    void setUsername(QString username);
    QString getUserPicUrl();

    QString getUsername();
    QString getUserProfile();
signals:
    void userDataChanged();
public slots:
};

#endif // USERDATA_H
