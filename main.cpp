#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "panelhandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QScopedPointer<PanelHandler> panelHandler(new PanelHandler);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/sample2.qml")));

    engine.rootContext()->setContextProperty("PanelHanlder",panelHandler.data());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
