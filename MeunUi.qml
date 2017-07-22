import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.0
Rectangle{
    id: item1
    signal createWindow(string s);
    signal showUserImgSelectWindow();
    Image {
        id: image
        x: 15
        y: 8
        width: 50
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        source: userdata.userPicUrl

    }

    Button {
        id: button
        x: 15
        y: 80
        width: parent.width
        height: 43
        text: qsTr("Edit your information")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:{
           item1.createWindow("UserInformationEditUi.qml")


    }
    }

    Row {
        id: row
        x: 8
        y: 430
        width: parent.width
        height: 42
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        transformOrigin: Item.Center

        Button {
            id: button1
            width:parent.width/2
            text: qsTr("Button")
        }

        Button {
            id: button2
              width:parent.width/2
            text: qsTr("quit")
        }
    }

    Button {
        id: button3
        x: 15
        y: 124
        width: parent.width
        height: 43
        text: qsTr("Settings")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }


}
