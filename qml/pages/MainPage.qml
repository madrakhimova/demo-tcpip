import QtQuick 2.0
import Sailfish.Silica 1.0
import demo.tcpip 1.0

Page {
    id: page
    property string defaultHttp: "http://kappa.cs.petrsu.ru"
    property string defaultSsh: "ssh://madrahim@kappa.cs.petrsu.ru"
    property string defaultSftp: "sftp://madrahim@kappa.cs.petrsu.ru"

    Sender {
        id: sender

        Component.onCompleted: {
            sendRequest(defaultHttp)
        }

        onContentsChanged: {
           updateText()
        }
    }

    TextInput  {
       id: httpInput
       text: defaultHttp
       Keys.onEnterPressed: sender.sendRequest(httpInput.text)
    }

    TextInput  {
       id: sshInput
       Keys.onEnterPressed: sender.sendRequest(sshInput.text)
    }

    TextInput  {
       id: sftpInput
       Keys.onEnterPressed: sender.sendRequest(sftpInput.text)
    }

    SilicaFlickable
    {
        id: flickable
        anchors {
            margins: Theme.paddingMedium
        }

        contentWidth: reply.width
        contentHeight: reply.contentHeight

        TextArea {
            id: reply
            anchors.top: sftpInput.bottom
        }

        ScrollDecorator {
            flickable: flickable
        }
    }

    function updateText()
    {
        reply.text = sender.contents
        flickable.width = reply.width
        flickable.height = reply.height
    }
}
