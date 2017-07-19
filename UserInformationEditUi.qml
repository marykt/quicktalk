import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
Rectangle {
    signal backtoroot
    id: rectangle
    visible: false
    Button {
        id: button
        x: 0
        y: 0
        text: qsTr("<<")
        onClicked: rectangle.backtoroot()
    }

    Text {
        id: text1
        width: 116
        height: 40
        x:button.x+button.width
        text: qsTr("个人信息")
        //anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Tahoma"
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 26
    }

    ColumnLayout {
        x: 138
        y: 68

        Image {
            id: image
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            source: "qrc:图片1.jpg"
        }

        TextField {
            id: textField
            text: qsTr("Text Field")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 217
        }

        TextArea {
            id: textArea
            text: qsTr("Text Area")
            Layout.preferredHeight: 232
            Layout.preferredWidth: 217
        }
    }

    ColumnLayout {
        x: 0
        y: 79

        Text {
            id: text5
            text: qsTr("　　头像：")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 26
            font.family: "Tahoma"
            Layout.preferredHeight: 40
            Layout.preferredWidth: 127
        }

        Text {
            id: text4
            text: qsTr("　　昵称：")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 26
            font.family: "Tahoma"
            Layout.preferredHeight: 40
            Layout.preferredWidth: 127
        }

        Text {
            id: text3
            text: qsTr("个性签名：")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 127
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 26
            font.family: "Tahoma"
        }
    }

    Column {
    }

    RowLayout {
        x: 0
        y: 414
        width: 360
        height: 40

        Button {
            id: button1
            width: 175
            text: qsTr("取消")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 180
             onClicked: rectangle.backtoroot()
        }

        Button {
            id: button2
            width: 175
            text: qsTr("保存")
            Layout.preferredHeight: 40
            Layout.preferredWidth: 180
             onClicked: {rectangle.backtoroot()}
        }
    }
}
