import QtQuick 2.0
import Sailfish.Silica 1.0
import demo.tcpip 1.0

Page {
    id: page
    property string defaultHttp: "https://sailfishos.org"

    function updateText() {
        reply.text = sender.contents
    }

    Sender {
        id: sender

        Component.onCompleted: {
            sendRequest(defaultHttp)
        }

        onContentsChanged: {
            updateText()
        }
    }

    SilicaFlickable
    {
        id: contents
        contentHeight: reply.contentHeight
        contentWidth: reply.contentWidth
        clip: true
        anchors {
            bottom: row.top
            top: parent.top
            left: parent.left
            right: parent.right
            margins: Theme.paddingMedium
        }

        Text {
            id: reply
            anchors.fill: parent
            color: "white"
        }

        ScrollDecorator {
            flickable: contents
        }
    }

    Row {
        id: row
        spacing: Theme.paddingSmall
        width: parent.width
        anchors {
            margins: Theme.paddingMedium
            bottom: sourceCode.top
            horizontalCenter: parent.horizontalCenter
        }

        TextField  {
            id: httpInput
            text: defaultHttp
            width: parent.width

            Keys.onReturnPressed: sender.sendRequest(text)
        }
    }

    Button {
       id: sourceCode
       text: "source code"
       anchors {
           horizontalCenter: parent.horizontalCenter
           bottom: parent.bottom
           margins: Theme.paddingMedium
       }
       onClicked: pageStack.push(Qt.resolvedUrl("Source.qml"));
    }
}
