//Textanimation
import QtQuick 2.1

Item {
    id: textanimation
    property bool dimState: screenStateController.dimmedColors

    width: 512
    height: 316
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
		Image {
			id: background
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/2023.png"
			anchors.fill: parent
			fillMode: Image.PreserveAspectCrop	
        	}
     		Text{
         		id: buttonLabel
         		anchors {
					verticalCenter: parent.verticalCenter
					horizontalCenter: parent.horizontalCenter	 		
				}
			font.pixelSize:  isNxt ? 40 : 32
			font.family: qfont.regular.name
			font.bold: true
			color:  "black" 
         		text: "Happy New Year!"
     		}

    		MouseArea{
         		id: buttonMouseArea
         		anchors.fill: parent 
         		onClicked: {animationscreen.animationRunning= false;textanimation.destroy();}
     		}
		
	}
    }
    
    	Timer {
		interval: 2500
		running: true
		repeat: true
		onTriggered: {
		if (animationscreen.animationRunning==false) {
					textanimation.destroy();
				}
	}
	}

}
