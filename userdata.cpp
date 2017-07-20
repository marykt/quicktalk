#include "userdata.h"

UserData::UserData(QObject *parent) : QObject(parent)
{
    this->userPicUrl="qrc:图片1.jpg";
    this->username="";
    this->userProfile="这个人有点懒，什么都没留下。";
}

void UserData::setUserPicUrl(QString dir)
{
    userPicUrl=dir;
    emit userPicUrlChanged();
    emit userDataChanged();
}

void UserData::setUserProfile(QString userProfile)
{
    this->userProfile=userProfile;
    emit userProfileChanged();
     emit userDataChanged();
}

void UserData::setUsername(QString username)
{
    this->username=username;
    emit usernameChanged();
     emit userDataChanged();
}

QString UserData::getUserPicUrl()
{
    return userPicUrl;
}

QString UserData::getUsername()
{
    return this->username;
}

QString UserData::getUserProfile()
{
    return userProfile;
}
