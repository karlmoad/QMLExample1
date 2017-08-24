#include "panelhandler.h"

PanelHandler::PanelHandler(QObject *parent) : QObject(parent)
{

}

void PanelHandler::runCommand(QString name){
    qDebug() << "Hit Run Command: " << name;
}
