#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
#include"usertool.h"
#include"talkinformation.h"
#include"userpicprovider.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<UserTool>("org.example",	1,	0,	"UserTools");
    qmlRegisterType<UserData>("org.example",	1,	0,	"UserData");
     qmlRegisterType<TalkInformation>("org.example",	1,	0,	"TalkInformation");
    UserData userdata;
    UserTool tool(&userdata);
    //信息管理
    UserpicProvider *userpicProvider=new UserpicProvider();//将直接声明改为new 一个解决下面的问题
    TalkInformation talkinformation(userpicProvider,&tool);


    engine.addImageProvider(QLatin1String("userpic"), userpicProvider);//这句话会导致程序不正常的退出
   engine.rootContext()->setContextProperty("userdata", &userdata);
    engine.rootContext()->setContextProperty("tool", &tool);
   engine.rootContext()->setContextProperty("talkinformation", &talkinformation);

    // qmlRegisterType<Message>("org.example",	1,	0,	"sss");

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
