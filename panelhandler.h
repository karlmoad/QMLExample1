#ifndef PANELHANDLER_H
#define PANELHANDLER_H

#include <QObject>
#include <QString>
#include <QDebug>

class PanelHandler : public QObject
{
    Q_OBJECT
public:
    explicit PanelHandler(QObject *parent = nullptr);
    Q_INVOKABLE void runCommand(QString name);
signals:
    void signalCommandRun(QString name);
public slots:
};

#endif // PANELHANDLER_H
