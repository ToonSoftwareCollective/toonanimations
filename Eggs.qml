//eggs
import QtQuick 2.1


Item{
        width: parent.width
        height: parent.height

        Image {
            id: bottomImage
            source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/eggs2.png"
            width: parent.width; height: parent.height
            anchors {
                bottom: parent.bottom
            }
        }
        Item {
            id: egg

            width: 161
            height: 200
            x : ((Math.random() * parent.width)-40);
            y : -200;

            Item {
                id: sprite
                property int framex: randomNumber(0, 3)
                property int framey: randomNumber(0, 1)
                anchors.centerIn: parent
                height: parent.height
                width: parent.width
                clip: true

                function randomNumber(from, to) {
                    return Math.floor(Math.random() * (to - from + 1) + from);
                }

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
                source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/eggs.png"
                y: -parent.height*sprite.framey
                x:-parent.width*sprite.framex
                }
            }

            function randomNumber(from, to) {
                return Math.floor(Math.random() * (to - from + 1) + from);
            }



}

        property int speed: randomNumber(1, 4)


        Timer {
            interval: 50
            running: true
            repeat: true
            onTriggered: {
                egg.y += speed;
                if (isNxt && (egg.y - egg.height)> 700) {
                   egg.destroy();
                }

                if (!isNxt && (egg.y - egg.height) > 550) {
                   egg.destroy();
                }
          }
        }
}
