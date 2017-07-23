import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle{
    property	alias	img:	userPic.source
    property alias text:containText.text
    property alias usernametext : usernameLable.text
    width: parent.width
    height:containText.height>70?containText.height:70
    Image {
        id: userPic
        x:	20;	y:10
        width: 50
        height: 50
        source: "qrc:/图片1.jpg"
        cache: false
    }
    Rectangle{
            x:userPic.x+userPic.width+userPic.x-15
            y:0
            width: parent.width
            Label{
                id:usernameLable
            text:qsTr("匿名：")
            }

    }
    Rectangle{
            x:userPic.x+userPic.width+userPic.x-15
            y:20
            width: parent.width

        Canvas	{
            width:	containText.width+30;	height:containText.height+20
            id:	kuang
            //	canvas	size

            //	handler	to	override	for	drawing
            onPaint:	{
                //	get	context	to	draw	with
                var	ctx	=	getContext("2d")
                //	setup	the	stroke
                ctx.lineWidth	=	2
                ctx.strokeStyle	=	"blue"
                //	setup	the	fill
                ctx.fillStyle	=	"steelblue"
                //	begin	a	new	path	to	draw
                ctx.beginPath()
                //	top-left	start	point
                ctx.moveTo(10,0)								//	upper	line
                ctx.lineTo(containText.width+30,0)
                //	right	line
                ctx.lineTo(containText.width+30,containText.height+5)
                //	bottom	line
                ctx.lineTo(10,containText.height+5)
                ctx.lineTo(10,20)
                ctx.lineTo(0,20)
                ctx.lineTo(10,6)
                //	lef t	line	through	path	closing
                ctx.closePath()
                //	fill	using	fill	style
                ctx.fill()
                //	stroke	using	line	width	and	stroke	style
                ctx.stroke()
            }

        }

        Label{
            y:3
            width:parent.width-userPic.width-userPic.x*8+15
            id:containText
            wrapMode: Text.WrapAnywhere
            anchors.horizontalCenter:	kuang.horizontalCenter
            anchors.horizontalCenterOffset:	5
            text: qsTr("mamfieojdiftegfsdf
sefsesvsd")
        }
    }

}
