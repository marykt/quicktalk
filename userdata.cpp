#include "userdata.h"
#include<QSettings>
#include<QDebug>
#include<QTextCodec>
#include<QDir>
void createFile(QString filePath,QString fileName)
{
    QDir tempDir;
    //临时保存程序当前路径
    QString currentDir = tempDir.currentPath();
    //如果filePath路径不存在，创建它
    if(!tempDir.exists(filePath))
    {
        qDebug()<<"不存在该路径"<<endl;
        tempDir.mkpath(filePath);
    }
    QFile *tempFile = new QFile;
    //将程序的执行路径设置到filePath下
    tempDir.setCurrent(filePath);
    qDebug()<<tempDir.currentPath();
    //检查filePath路径下是否存在文件fileName,如果停止操作。
    if(tempFile->exists(fileName))
    {
        qDebug()<<"文件存在";
        return ;
    }
    //此时，路径下没有fileName文件，使用下面代码在当前路径下创建文件
    tempFile->setFileName(fileName);
    if(!tempFile->open(QIODevice::WriteOnly|QIODevice::Text))
    {
        qDebug()<<"打开失败";
    }
    tempFile->close();
    //将程序当前路径设置为原来的路径
    tempDir.setCurrent(currentDir);
    qDebug()<<tempDir.currentPath();
}
QString readini(QString key){


     QSettings *configIniRead = new QSettings("data.ini", QSettings::IniFormat);
    QByteArray myArray = configIniRead->value(key).toByteArray();
    QTextCodec *codec=QTextCodec ::codecForName("utf8"); //设定字符集为GBK（大小写均可，还可用GB18030代替）
    QString outStr = codec->toUnicode(myArray); //这里就好解释了，通过译码器将字节数组中的值转化为UNICODE的QSTRING就O了
     delete configIniRead;
   return outStr;
}
void writeini(QString key,QString value){
    //Qt中使用QSettings类读写ini文件
    //QSettings构造函数的第一个参数是ini文件的路径,第二个参数表示针对ini文件,第三个参数可以缺省
    QSettings *configIniWrite = new QSettings(":/data.ini", QSettings::IniFormat);
    //向ini文件中写入内容,setValue函数的两个参数是键值对
    //向ini文件的第一个节写入内容,ip节下的第一个参数
    configIniWrite->setValue(key,  value    );
    //写入完成后删除指针
    delete configIniWrite;
}
UserData::UserData(QObject *parent) : QObject(parent)
{
    QFile *tempFile = new QFile;
    if(tempFile->exists("data.ini"))
    {
        qDebug()<<"文件存在";

    }
    else{

     createFile("","data.ini");
     QSettings *configIniWrite = new QSettings("data.ini", QSettings::IniFormat);
         qDebug()<<configIniWrite->allKeys()<< configIniWrite->isWritable();
         configIniWrite->setIniCodec("utf-8");
             configIniWrite->beginGroup("userData");
             configIniWrite->setValue("userPicUrl","qrc:/图片1.jpg");
             configIniWrite->setValue("username","");
             configIniWrite->setValue("userProfile", "这个人有点懒，什么都没有留下哦！");
         configIniWrite->endGroup();

         delete configIniWrite;

    }


    //将读取到的ini文件保存在QString中，先取值，然后通过toString()函数转换成QString类型
   //qDebug()<< configIniRead->allKeys();
    this->userPicUrl=readini("/userData/userPicUrl");
    this->username = readini("/userData/username");
    this->userProfile=readini("/userData/userProfile");
    //打印得到的结果
    //读入入完成后删除指针

   connect(this,SIGNAL(userDataChanged()),this,SLOT(savedatachange()));
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

void UserData::savedatachange()
{
//qDebug()<<"saveUserData"<<userPicUrl<<username<<userProfile;
QSettings *configIniWrite = new QSettings("data.ini", QSettings::IniFormat);
  //  qDebug()<<configIniWrite->allKeys()<< configIniWrite->isWritable();
   // configIniWrite->setIniCodec("utf-8");
        configIniWrite->beginGroup("userData");
        configIniWrite->setValue("userPicUrl", userPicUrl.toUtf8());
        configIniWrite->setValue("username",username.toUtf8());
        configIniWrite->setValue("userProfile", userProfile.toUtf8());
    configIniWrite->endGroup();

    delete configIniWrite;
//        writeini("/userData/userPicUrl", userPicUrl);
//        //向ini文件的第一个节写入内容,ip节下的第二个参数
//        writeini("/userData/username", username);
//        //向ini文件的第二个节写入内容,port节下的第一个参数
//        writeini("/userData/userProfile", userProfile);

}
