#include "jsonreceiver.h"
#include<QDebug>
#include<QJsonParseError>
#include<QJsonDocument>

JsonReceiver::JsonReceiver(QObject *parent) : QObject(parent)

{connect(&receiver,SIGNAL(readyRead()),this,SLOT(receiveJson()));}





