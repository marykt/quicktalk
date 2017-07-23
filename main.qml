import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
import "Global.js"   as  Helper
ApplicationWindow {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        id :mainRect
        anchors.fill: parent
        ToolBar{
            width: parent.width
            id:toolbar1

            ToolButton{
                width: parent.width/7
                text:qsTr("三")
                onClicked: {
                    if(usermenus.x==0){

                        usermenuhide.start()
                    }
                    else{
                        usermenushow.start()
                    }
                }
            }
            ToolButton{
                x:parent.width/7*2
                width: parent.width/7
                text:qsTr("music")
                onClicked: swipeView.currentIndex=1
            }

        }

        SwipeView {
            y:toolbar1.height
            height: parent.height-toolbar1.height
            width: parent.width
            id: swipeView
            // currentIndex: tabBar.currentIndex

            Page{
                Rectangle{
                    id :messageRec
                    width: parent.width
                    height: parent.height-inputarea.height
                    Flickable{
                        id:flickarea
                        contentWidth: parent.width
                        contentHeight: messageColumn.height
                        clip:true

                        anchors.fill: parent
                        Column{
                            id:messageColumn
                            width: parent.width
                          //  height:0
//                            UserTools{
//                                id:tool
//                            }



                            //
                        }
                    }}

            }
            Page {
                Label {
                    text: qsTr("Second page")
                    anchors.centerIn: parent

                }
            }

        }
        InputAndSendUi{
            id :inputarea
            y:parent.height-height
            height: parent.height/9
            width: parent.width
            //  anchors.margins: 20
            //onClicked: //flickarea.contentY=messageColumn.height
        }
        MeunUi{
            id :usermenus
            width: parent.width/2
            height: parent.height
            x:-width

            onCreateWindow: {
                mainRect.visible=false
                console.log(s)
                var w=Helper.createxx(s,root)//c创建失败
                w.visible=true;
                var back=function()  {
                    if(usermenus.x==0){
                        usermenuhide.start()
                    }
                    else{
                        usermenushow.start()
                    }
                    mainRect.visible=true;
                    w.destroy();

                }

                w.backtoroot.connect(back)

            }

            NumberAnimation{
                id :usermenushow
                target: usermenus
                properties: "x"
                to :0
                duration: 500

            }
            NumberAnimation{
                id :usermenuhide
                target: usermenus
                properties: "x"
                to :-usermenus.width
                duration: 500

            }


        }
    }
    Component.onCompleted: {
        var c=function(){
            if(!tool.istMyIp(talkinformation.getMessageBoxIpat(talkinformation.getMessageBoxSize()-1))){
                var say=Helper.createxx("SayUi.qml",messageColumn);
                // say.usernameText=qsTr(getMessageBoxUsernameat(getMessageBoxSize()-1));
                say.usernametext=qsTr(talkinformation.getMessageBoxUsernameat(talkinformation.getMessageBoxSize()-1)+":");
                say.img=talkinformation.getMessageBoxUserPicUrlat(talkinformation.getMessageBoxSize()-1);

            }

            else{
                var say=Helper.createxx("ISayUi.qml",messageColumn);
                say.img=userdata.userPicUrl
                }
            say.text=qsTr(talkinformation.getMessageBoxContentat(talkinformation.getMessageBoxSize()-1))//.messageContent)
            // say.te.0xt=qsTr(getMessageBoxIpat(getMessageBoxSize()-1))
            console.log(flickarea.contentY)
            console.log(messageColumn.height)
            console.log(messageColumn)
            if(flickarea.contentY==messageColumn.height-messageRec.height){
                messageColumn.height=messageColumn.height+say.height
                flickarea.contentY=messageColumn.height-messageRec.height
            }
            else{
                messageColumn.height=messageColumn.height+say.height
                // flickarea.contentY=messageColumn.height
            }
            console.log("a sayui.qml added")

        }
         //w.ok.connect(setv)
        talkinformation.messageBoxChanged.connect(c)
        }



}

