//TextAnimation
import QtQuick 2.1

Item {
    id: textanimation

    width: 400
    height: 200
    x : parent.width/2 - 100
    y : 0

    Item {
        id: sprite
        anchors.centerIn: parent
	height: parent.height
        width: parent.width
        clip: true

        transform: Rotation {
           id: rotator
           origin{
               x: 60
               y: 110
            }
            angle: 0
        }

        SequentialAnimation {
            id: shake
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: 5 }
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: -5 }
        }

        Timer {
            running: true
            repeat: true
            interval: 800
            onTriggered: {
                shake.restart();
            }
        }

	Rectangle {
		id: spriteImage
		color: color: !dimState? "white" : "black"	
		anchors.fill: parent 
		radius: 4
     		Text{
         		id: buttonLabel
         		anchors.centerIn: parent
			width: parent.width
			font.pixelSize:  isNxt ? 30 : 22
			font.family: qfont.regular.name
			font.bold: true
			color: !dimState? "black" : "white"
			wrapMode: Text.WordWrap
         		text: "Hello beta testers: click here to close"
     		}

    		MouseArea{
         		id: buttonMouseArea
         		anchors.fill: parent 
         		onClicked: {buttonLabel.text = "Clicked";textanimation.destroy();}
     		}
		
	}
    }

}
