import QtQuick 2.0
import QtQuick.Controls 2.1
//unused
Rectangle {
    // visible: false
   //  anchors.fill: parent
     id:fileDlgRoot;
     //state:"hidden";
   //  color: "#212126";

     property string folderPathName: "file://../";
    property bool rootPath:false;
     property string selectedFile: "";
    // signal message(string msg);

     property int lineHeight: 90;
     //signal selected(String path);
     signal backtoroot();
    Button {
        id: button
        y: 0
        width: parent.width/2
        height: parent.height
        text: qsTr("cancel")
        anchors.left: parent.left
        anchors.leftMargin: 0
        onClicked: fileDlgRoot.backtoroot
    }

    Button {
        id: button1
        x: parent.width/2
        y: 0
        width: parent.width/2
        height: parent.height
        text: qsTr("ok")
        anchors.right: parent.right
        anchors.rightMargin: 0
        onClicked:
        {
            fileDlgRoot.selected(fileDlgRoot.selectedFile)
            fileDlgRoot.backtoroot
        }

}

}
