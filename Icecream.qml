import QtQuick 2.0
Item {
    id: ice

    property int icesize: randomNumber(5, 10)
    width: icesize *12 *2
    height: icesize *12 *2
    x :((Math.random() * parent.width)-60)
    y : -200;

    Item {
        id: sprite
        property int framex: randomNumber(0, 7)
        property int framey: randomNumber(0, 3)

        anchors.centerIn: parent

        height: parent.height
        width: parent.height
        clip: true

        transform: Rotation {
            id: rotator

            origin {
                x: 60
                y: 110
             }
             angle: 0
        }

        SequentialAnimation {
            id: shake
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: 3 }
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: -3 }
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
            source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/Icecream.png"
            y:-120 * icesize/5*sprite.framey
            x:-120 * icesize/5*sprite.framex
            width: 960 *  icesize/5
            height:360 * icesize/5
        }
    }

    function randomNumber(from, to) {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: isNxt ? randomNumber(2, 3) : randomNumber(7, 10)

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
            ice.y += speed;
            if (isNxt && (ice.y - ice.height)> 700) {
               ice.destroy();
            }

            if (!isNxt && (ice.y - ice.height) > 550) {
               ice.destroy();
            }
        }
    }
}
