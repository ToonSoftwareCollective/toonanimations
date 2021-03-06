//Wine
import QtQuick 2.1

Item {
    id: wine

    width: 120
    height: 200
    x : ((Math.random() * parent.width)-60);
    y : -250;

    Item {
	id: sprite
        property int frame: randomNumber(1, 8)
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

        Image {
		id: spriteImage
		source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/Wine.png"
		y:0
		x:-parent.width*sprite.frame        
	}
    }

    function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    }

	property int speed: isNxt ? randomNumber(3, 5) : randomNumber(4, 7)


    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            wine.y += wine.speed;

            if (isNxt &&  (wine.y - wine.height)> 600) {
                wine.destroy();
            }
            if (isNxt &&  (wine.y - wine.height) > 480) {
                wine.destroy();
            }      
	  }
    }

}
