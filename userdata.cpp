#include "userdata.h"

UserData::UserData(QObject *parent) : QObject(parent)
{

}

QString UserData::getUsername()
{
    return this->username;
}
