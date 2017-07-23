import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Rectangle{

    ToolBar{

        ToolButton{
            width: parent.width/7
            text:qsTr("<<")
            onClicked: usermenuAnimation.restart()
        }
        ToolButton{

            x:parent.width/7*2
            width: parent.width/7*2
            text:qsTr("hhh")
            onClicked: swipeView.currentIndex=1
        }
    }

}
