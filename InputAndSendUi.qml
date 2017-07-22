import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
Item {
    signal	clicked
    id:root
    Row {
        anchors.fill: parent

        TextField {
            width: parent.width/6*5
            id: textField
        }

        Button {
            width: parent.width/6
            id: button
            text: qsTr("发送")
            onClicked:{
                if(textField.text.length>0){
                root.clicked()
                tool.sendMessage(textField.text)
                  textField.clear()
                }
            }
        }
    }

}
