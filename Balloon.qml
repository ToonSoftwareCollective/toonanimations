//Balloon by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: balloon

    property bool destroyed: false

    width: 120
    height: 120
    x : ((Math.random() * parent.width)-60);
    y : parent.height

    Item {
        id: sprite
        property int frame: randomNumber(1, 9)
        anchors.centerIn: parent
		height: parent.height
        width: parent.height
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
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: 10 }
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: -10 }
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
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Balloon4SpriteSheet.png"
			y:0
			x:-parent.width*sprite.frame
        }
    }

    function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: isNxt ? randomNumber(3, 6) : randomNumber(4, 7)
    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            balloon.y -= balloon.speed;
            if (balloon.y + balloon.height < -30) {
               balloon.destroy();
            }
        }
    }

}
