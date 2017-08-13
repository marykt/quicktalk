
import QtQuick 2.3
import Qt.labs.folderlistmodel 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.1

Rectangle {
    // visible: false
    //  anchors.fill: parent
    id:fileDlgRoot;
    //state:"hidden";
    color: "#212126";
    property string folderPathName: "file://";
    property bool rootPath:false;
    property string selectedFile: "";
    //signal message(String msg);
    signal ok();
    property int lineHeight: parent.height/9;
    // signal chose(String path);
    signal back();
    //  signal selectedFolder(string folderPath);
    MFileDialogLineStyle{
        id:topLine;
        text: "...";
        width: fileDlgRoot.width;
        height: fileDlgRoot.lineHeight;
        fontSize:40;
        selectable:false;
        source: ""//"res/image/arrow-1-backward.png";
        mouseArea.onClicked:  {
            console.log("topLine  onClicked");
            if (folderModel.parentFolder != ""){
                fileDlgRoot.folderPathName = folderModel.parentFolder;
                //text = fileDlgRoot.folderPathName.slice(8);
            }
            else{
                //Fns.set_path_result(0);
                //  fileDlgRoot.state = "hidden";
            }

            console.log("topLine fileDlgRoot.folderPathName:", fileDlgRoot.folderPathName);
            console.log("\n       folderModel.folder:", folderModel.folder,
                        "\n folderModel.parentFolder:", folderModel.parentFolder,
                        "\n   folderModel.rootFolder:", folderModel.rootFolder);
        }
    }

    ListView{
        id:listFileView;
        anchors{
            bottom: rectangleButton.top;
            bottomMargin: 4;
            right: fileDlgRoot.right;
            rightMargin: 0;
            left: fileDlgRoot.left;
            leftMargin: 0;
            top: topLine.bottom;
            topMargin: 0;
        }
        clip:true;

        delegate: MFileDialogLineStyle{
            text: fileName;
            height:fileDlgRoot.lineHeight;
            width:fileDlgRoot.width;
            fontSize:35;
            source: folderModel.get(index, "fileIsDir")?"qrc:/folder-yellow-32.png":folderModel.get(index, "fileURL");
            selectable:folderModel.get(index, "fileIsDir")?false:true;
            isdir: folderModel.get(index, "fileIsDir")?true:false;
            mouseArea.onClicked:  {
                console.log("\nlistFileView  onClicked F:", folderModel.folder,
                            "\n folderModel.parentFolder:", folderModel.parentFolder,
                            "\n   folderModel.rootFolder:", folderModel.rootFolder,
                            "\n     folderModel.isFolder:", folderModel.isFolder(index));
                console.log("\n      fileName:",  folderModel.get(index, "fileName"),
                            "\n      filePath:",  folderModel.get(index, "filePath"),
                            "\n       fileURL:",  folderModel.get(index, "fileURL"),
                            "\n  fileBaseName:",  folderModel.get(index, "fileBaseName"),
                            "\n    fileSuffix:",  folderModel.get(index, "fileSuffix"),
                            "\n      fileSize:",  folderModel.get(index, "fileSize"),
                            "\n  fileModified:",  folderModel.get(index, "fileModified"),
                            "\n  fileAccessed:",  folderModel.get(index, "fileAccessed"),
                            "\n     fileIsDir:",  folderModel.get(index, "fileIsDir"));
                if(folderModel.isFolder(index)){
                    fileDlgRoot.folderPathName = folderModel.get(index, "fileURL");
                }
            }
            checkBox.onCheckedChanged: {
                //add_song_to_list!
                console.log("onSelectfile: ", folderModel.get(index, "fileURL"));
                fileDlgRoot.selectedFile=folderModel.get(index, "fileURL");
                console.log(fileDlgRoot.selectedFile);
            }
        }
        model: FolderListModel{
            id:folderModel;
            objectName: "folderModel";
            showDirs: true;
            showFiles: true;
            showDirsFirst: true;
            nameFilters: ["*.jpg", "*.jpeg","*.bmp","*.png","*.gif"];
            folder:fileDlgRoot.folderPathName;
            onFolderChanged: {
                console.log("onFolderChanged fileDlgRoot.folderPathName:", fileDlgRoot.folderPathName);
                console.log("\n               folderModel.folder:", folderModel.folder,
                            "\n         folderModel.parentFolder:", folderModel.parentFolder,
                            "\n           folderModel.rootFolder:", folderModel.rootFolder);
            }
        }
    }

    Rectangle {
        id: rectangleButton;
        height: fileDlgRoot.lineHeight;
        color: "#212126";
        anchors{
            left: fileDlgRoot.left;
            leftMargin: 0;
            right: fileDlgRoot.right;
            rightMargin: 0;
            bottom: fileDlgRoot.bottom;
            bottomMargin: 0;
        }

        Rectangle{
            id:rectWhiteLine;
            anchors{
                left:parent.left;
                right: parent.right;
                top:parent.top;
            }
            height: 2;
            color:"white";
        }

        Button {
            id: button
            y: 0
            width: parent.width/2
            height: parent.height
            text: qsTr("cancel")
            anchors.left: parent.left
            anchors.leftMargin: 0
            onClicked: fileDlgRoot.back()
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
                fileDlgRoot.ok()
                fileDlgRoot.back()
            }
        }
    }
}

