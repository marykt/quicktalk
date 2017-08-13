import QtQuick 2.7
import QtQuick.Dialogs 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
import "Global.js"   as  Helper
StackView {
    id:stackView
    // visible: false
    signal back()
    initialItem: personalData
    Rectangle{
        id:personalData
        Text {
            id: text1
            width: 116
            height: 40

            text: qsTr("个人信息:")
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
                source: userdata.userPicUrl
                MouseArea{
                    anchors.fill: parent

                    //                MFileDialog{
                    //                    id:fileDlg
                    //                visible: false
                    //                onSelected: {
                    //                    userdata.userPicUrl=path;
                    //                }

                    //   }
                    onClicked: {
                        stackView.push("MFileDialog.qml")
                        var w=stackView.get(stackView.depth-1)
                        var setv=function(){
                            userdata.userPicUrl=w.selectedFile;// This is available in all editors.
                            console.log("ok")


                        }
                        var back=function(){
                        stackView.pop()
                        }
                        console.log(w)
                        w.ok.connect(setv)
                        w.back.connect(back)

                    }
                }
            }
            //Thanks https://stackoverflow.com/questions/15079406/qt-necessitas-reasonable-qfiledialog-replacement-skin
            //           MouseArea{
            //            anchors.fill:parent

            //            FileDialog {
            //                id: fileDialog
            //                width: rectangle.width
            //                height: rectangle.height

            //                selectMultiple: false
            //                    //    selectExisting: true
            //                   //     selectFolder: true
            //                        sidebarVisible: false
            //                 //nameFilters: [ "Image files (*.png *.jpg *.gif *.jpeg *.tiff *.pbm *.bmp)" ]

            //                title: "Please choose a picture"
            //                onAccepted: {
            //                    userdata.userPicUrl=fileDialog.fileUrls[0]
            //                  //  console.log( fileDialog.fileUrls[0])
            //                   // Qt.quit()
            //                }
            //                onRejected: {
            //                    console.log("Canceled")
            //                    //Qt.quit()
            //                }
            //               // Component.onCompleted: visible = true
            //            }
            //            onClicked: {
            //            fileDialog.visible=true

            //            }
            //           }

            //  }

            TextField {
                id: textField
                text: qsTr(userdata.username)
                Layout.preferredHeight: 40
                Layout.preferredWidth: 217
            }

            TextArea {
                id: textArea
                text: qsTr(userdata.userProfile)
                wrapMode: Text.WrapAnywhere
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
            y: parent.height-height
            width: 360
            height: 40

            Button {
                id: button1
                width: 175
                text: qsTr("取消")
                Layout.preferredHeight: 40
                Layout.preferredWidth: 180
                onClicked: back()
            }

            Button {
                id: button2
                width: 175
                text: qsTr("保存")
                Layout.preferredHeight: 40
                Layout.preferredWidth: 180
                onClicked: {
                    userdata.username=textField.text;
                    // userData.userPicUrl
                    userdata.userProfile=textArea.text;
                    back()
                }
            }
        }
    }
}

