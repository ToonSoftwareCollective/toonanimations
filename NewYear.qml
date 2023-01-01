//Textanimation
import QtQuick 2.1

Item {
    id: textanimation
    property bool dimState: screenStateController.dimmedColors

    width: 500
    height: 250
    x : (parent.width - textanimation.width)/2
    y : (parent.height- textanimation.height)/2


    Item {
        id: sprite
        anchors.centerIn: parent
	height: parent.height
        width: parent.width
        clip: true

        transform: Rotation {
           id: rotator
           origin{
               x: textanimation.width/2
               y: textanimation.height/2
            }
            angle: 0
        }


        SequentialAnimation {
            id: shake
            PropertyAnimation { easing.type: Easing.InQuad; duration: 1000; target: rotator; property: "angle"; to: 5 }
            PropertyAnimation { easing.type: Easing.InQuad; duration: 1000; target: rotator; property: "angle"; to: -5 }
        }


        Timer {
            running: true
            repeat: true
            interval: 2000
            onTriggered: {
                shake.restart();
            }
        }


	Rectangle {
		id: spriteImage
		color: "yellow"
		anchors.fill: parent 
		radius: 4 
     		Text{
         		id: buttonLabel
         		anchors {
					top: parent.top
					topMargin: isNxt ?  20:16
					horizontalCenter: parent.horizontalCenter	 		
				}
			width: parent.width
			font.pixelSize:  isNxt ? 30 : 22
			font.family: qfont.regular.name
			font.bold: true
			color:  "black" 
			wrapMode: Text.WordWrap
         		text: "Happy New Year!"
     		}

    		MouseArea{
         		id: buttonMouseArea
         		anchors.fill: parent 
         		onClicked: {animationscreen.animationRunning= false;textanimation.destroy();}
     		}
		
	}
    }

}
