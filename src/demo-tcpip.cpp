#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include "sender.h"
#include <sailfishapp.h>
#include <QQmlEngine>

int main(int argc, char *argv[])
{
    const char* uri = "demo.tcpip";
    qmlRegisterType<Sender>(uri, 1, 0, "Sender");
    return SailfishApp::main(argc, argv);
}
