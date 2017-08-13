import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.example 1.0
import "Global.js"   as  Helper
ApplicationWindow {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header:   ToolBar{
        width: parent.width
        id:toolbar1
        ToolButton{
            width: parent.width/7
            text:stackView.depth>1?qsTr("<-"):qsTr("三")
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()

                } else {
                    drawer.open()
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
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem:       SwipeView {
            //  y:toolbar1.height
            height: parent.height
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
                    }
                }

                InputAndSendUi{
                    y:messageRec.height
                    id :inputarea
                    height: toolbar1.height
                    //y:parent.height-height
                    width: parent.width
                    //  anchors.margins: 20
                    //onClicked: //flickarea.contentY=messageColumn.height
                }
            }
            //            Page {
            //                Label {
            //                    text: qsTr("Second page")
            //                    anchors.centerIn: parent

            //                }
            //            }


        }


    }


    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1
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
                drawer.close()
                stackView.push("qrc:/UserInformationEditUi.qml")
                 var f=function(){
                 stackView.pop()

                 }
                stackView.get(stackView.depth-1).back.connect(f)
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
                text: qsTr("hide")
                onClicked: item1.showOrClose();
            }

            Button {
                id: button2
                width:parent.width/2
                text: qsTr("quit")
                onClicked: Qt.quit()
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

        //        ListView {
        //            id: listView

        //            focus: true
        //            currentIndex: -1
        //            anchors.fill: parent

        //            delegate: ItemDelegate {
        //                width: parent.width
        //                text: model.title
        //                highlighted: ListView.isCurrentItem
        //                onClicked: {
        //                    listView.currentIndex = index
        //                    stackView.push(model.source)
        //                    drawer.close()
        //                }
        //            }

        //            model: ListModel {
        //                ListElement { title: "BusyIndicator"; source: "qrc:/pages/BusyIndicatorPage.qml" }
        //                ListElement { title: "Button"; source: "qrc:/pages/ButtonPage.qml" }
        //                ListElement { title: "CheckBox"; source: "qrc:/pages/CheckBoxPage.qml" }
        //                ListElement { title: "ComboBox"; source: "qrc:/pages/ComboBoxPage.qml" }
        //                ListElement { title: "DelayButton"; source: "qrc:/pages/DelayButtonPage.qml" }
        //                ListElement { title: "Dial"; source: "qrc:/pages/DialPage.qml" }
        //                ListElement { title: "Dialog"; source: "qrc:/pages/DialogPage.qml" }
        //                ListElement { title: "Delegates"; source: "qrc:/pages/DelegatePage.qml" }
        //                ListElement { title: "Frame"; source: "qrc:/pages/FramePage.qml" }
        //                ListElement { title: "GroupBox"; source: "qrc:/pages/GroupBoxPage.qml" }
        //                ListElement { title: "PageIndicator"; source: "qrc:/pages/PageIndicatorPage.qml" }
        //                ListElement { title: "ProgressBar"; source: "qrc:/pages/ProgressBarPage.qml" }
        //                ListElement { title: "RadioButton"; source: "qrc:/pages/RadioButtonPage.qml" }
        //                ListElement { title: "RangeSlider"; source: "qrc:/pages/RangeSliderPage.qml" }
        //                ListElement { title: "ScrollBar"; source: "qrc:/pages/ScrollBarPage.qml" }
        //                ListElement { title: "ScrollIndicator"; source: "qrc:/pages/ScrollIndicatorPage.qml" }
        //                ListElement { title: "Slider"; source: "qrc:/pages/SliderPage.qml" }
        //                ListElement { title: "SpinBox"; source: "qrc:/pages/SpinBoxPage.qml" }
        //                ListElement { title: "StackView"; source: "qrc:/pages/StackViewPage.qml" }
        //                ListElement { title: "SwipeView"; source: "qrc:/pages/SwipeViewPage.qml" }
        //                ListElement { title: "Switch"; source: "qrc:/pages/SwitchPage.qml" }
        //                ListElement { title: "TabBar"; source: "qrc:/pages/TabBarPage.qml" }
        //                ListElement { title: "TextArea"; source: "qrc:/pages/TextAreaPage.qml" }
        //                ListElement { title: "TextField"; source: "qrc:/pages/TextFieldPage.qml" }
        //                ListElement { title: "ToolTip"; source: "qrc:/pages/ToolTipPage.qml" }
        //                ListElement { title: "Tumbler"; source: "qrc:/pages/TumblerPage.qml" }
        //            }

        //            ScrollIndicator.vertical: ScrollIndicator { }
        //        }
    }
    //    Rectangle{
    //        id :mainRect
    //        anchors.fill: parent




    //        MeunUi{
    //            id :usermenus
    //            width: parent.width/2
    //            height: parent.height
    //            x:-width

    //            onCreateWindow: {
    //                mainRect.visible=false
    //                console.log(s)
    //                var w=Helper.createxx(s,root)//c创建失败
    //                w.visible=true;
    //                var back=function()  {
    //                    if(usermenus.x==0){
    //                        usermenuhide.start()
    //                    }
    //                    else{
    //                        usermenushow.start()
    //                    }
    //                    mainRect.visible=true;
    //                    w.destroy();

    //                }

    //                w.backtoroot.connect(back)

    //            }
    //            onShowOrClose:{
    //                if(usermenus.x==0){

    //                    usermenuhide.start()
    //                }
    //                else{
    //                    usermenushow.start()
    //                }
    //            }
    //            NumberAnimation{
    //                id :usermenushow
    //                target: usermenus
    //                properties: "x"
    //                to :0
    //                duration: 500

    //            }
    //            NumberAnimation{
    //                id :usermenuhide
    //                target: usermenus
    //                properties: "x"
    //                to :-usermenus.width
    //                duration: 500

    //            }


    //        }
    //    }
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

