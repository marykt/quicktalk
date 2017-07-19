#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"usertool.h"
#include"talkinformation.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<UserTool>("org.example",	1,	0,	"UserTools");
  // qmlRegisterType<Message>("org.example",	1,	0,	"sss");
     qmlRegisterType<TalkInformation>("org.example",	1,	0,	"TalkInformation");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
