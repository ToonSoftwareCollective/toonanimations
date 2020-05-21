//Snow
import QtQuick 2.1

Item {
    id: snow

    width: 75
    height: 75
    x : ((Math.random() * parent.width)-40);
    y : -80;

    Item {
        id: sprite
        anchors.centerIn: parent
	height: parent.height
        width: parent.width
        clip: true
	function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    	}

	property int spritecolor: randomNumber(1, 6)

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
		source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Snow.png"
		y:0
		x:0
        }
    }

    function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: randomNumber(1, 4)


    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            snow.y += speed;
            if (isNxt && snow.y > 700) {
               snow.destroy();
            }
            if (!isNxt && snow.y > 550) {
               snow.destroy();
            }      
	  }
    }

}
