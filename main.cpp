#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "panelhandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Method 1
    //QScopedPointer<PanelHandler> panelHandler(new PanelHandler);

    qmlRegisterType<PanelHandler>("io.koad.panelhandler",1,0,"PanelHandler");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/sample2.qml")));

    //Method 1
    //engine.rootContext()->setContextProperty("PanelHanlder",panelHandler.data());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
