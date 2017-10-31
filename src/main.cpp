#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fastslider.h"
#include "standardpagecontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<FastSlider>("qmlcontrol.fastslider", 1, 0, "FastSlider");
    qmlRegisterType<StandardPageController>("qmlcontrol.standardpagecontroller", 1, 0, "StandardPageController");


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));


    return app.exec();
}
