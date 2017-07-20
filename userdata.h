#ifndef USERDATA_H
#define USERDATA_H
//未完成
#include <QObject>
#include<QImage>
class UserData : public QObject
{
    Q_OBJECT
    Q_PROPERTY( QString	username    WRITE  setUsername   READ	getUsername NOTIFY usernameChanged)
    Q_PROPERTY( QString	userProfile WRITE  setUserProfile 	READ	getUserProfile NOTIFY userProfileChanged)
    Q_PROPERTY( QString	userPicUrl    WRITE  setUserPicUrl    READ	getUserPicUrl NOTIFY userPicUrlChanged)
private:
    QString username;
    QString userProfile;
    QString userPicUrl;
public:

    explicit UserData(QObject *parent = 0);
    void setUserPicUrl(QString dir);
    void setUserProfile(QString userProfile);
    void setUsername(QString username);
    QString getUserPicUrl();
    QString getUsername();
    QString getUserProfile();
signals:
    void usernameChanged();
    void userProfileChanged();
    void userPicUrlChanged();
    void userDataChanged();
public slots:
};

#endif // USERDATA_H
