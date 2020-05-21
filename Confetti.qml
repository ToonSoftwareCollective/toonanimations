//Confetti
import QtQuick 2.1

Item {
    id: confetti

    width: 120
    height: 120
    x : ((Math.random() * parent.width)-10);
    y : -50;

    Item {
        id: sprite
        anchors.centerIn: parent
	height: parent.height
        width: parent.width
        clip: true
	property variant coloritem: ["blue", "red", "yellow", "green", "white", "pink"]

	function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    	}

	property string spritecolor: coloritem[randomNumber(1,6)]

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
		color: sprite.spritecolor		
		width: 20
		height: 20
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
            confetti.y += speed;
            if (isNxt && confetti.y > 650) {
               confetti.destroy();
            }
            if (!isNxt && confetti.y > 530) {
               confetti.destroy();
            }

        }
    }

}
