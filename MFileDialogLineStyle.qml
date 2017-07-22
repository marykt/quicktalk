import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
//text: "...";
//width: root.width;
//height: root.lineHeight;
//fontSize:40;
//selectable:false;
//source: "res/image/arrow-1-backward.png";
//onClicked: {
//    console.log("topLine  onClicked");
//    if (folderModel.parentFolder != ""){
//        root.folderPathName = folderModel.parentFolder;
//        //text = root.folderPathName.slice(8);
//    }
//    else{
//        //Fns.set_path_result(0);
//        root.state = "hidden";
//    }

//    console.log("topLine root.folderPathName:", root.folderPathName);
//    console.log("\n       folderModel.folder:", folderModel.folder,
//                "\n folderModel.parentFolder:", folderModel.parentFolder,
//                "\n   folderModel.rootFolder:", folderModel.rootFolder);
//}
 Rectangle{
    id:item1
    property alias text:text1.text
    property alias fontSize:text1.font.pixelSize
    property alias source: image.source
    property alias selectable: checkBox.checkable
    property alias isdir:mouseArea.isdir
    property alias checkBox: checkBox
    property alias mouseArea: mouseArea
  //  signal iclicked;
  //  signal iselectfile;


    Text {
        id: text1
        x: parent.height
        y: 0
        width: parent.width-50
        height: parent.height
        text: qsTr("Text")

    }

    Image {
        id: image
        x: 0
        y: 0
        width: parent.height
        height: parent.height
        source: "qrc:/folder-yellow-32.png"
    }
MouseArea{
    id :mouseArea
    anchors.fill: parent
    property bool clickable:isdir
   property bool isdir:true
//    onClicked: {

//        if(clickable)
//        {
//            console.log("clicked")

//            item1.iclicked
//        }


//    }

    CheckBox {
        id: checkBox
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        checked: false

//        onCheckedChanged:
//        {
//            console.log("checkchanged")
//            item1.iselectfile
//        }
    }
}
}
