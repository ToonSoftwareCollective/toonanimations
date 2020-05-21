//Whine
import QtQuick 2.1

Item {
    id: whine

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
		source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Whine.png"
		y:0
		x:-parent.width*sprite.frame        
	}
    }

    function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: randomNumber(3, 6)

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            whine.y += whine.speed;

            if (isNxt &&  (whine.y - whine.height)> 600) {
                whine.destroy();
            }
            if (isNxt &&  (whine.y - whine.height) > 480) {
                whine.destroy();
            }      
	  }
    }

}
