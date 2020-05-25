import QtQuick 2.0
Item {
    id: butterfly

    property bool destroyed: false

    width: 120
    height: 120
    x :((Math.random() * parent.width)-60)
    y : parent.height+140



    Item {
        id: sprite
        property int framex: randomNumber(0, 9)
        property int framey: randomNumber(1, 3)
        property string pngname : "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Butterfly" + randomNumber(1, 4) + ".png"

        anchors.centerIn: parent

        height: parent.height
        width: parent.height
        clip: true

        transform: Rotation {
            id: rotator

            origin {
                x: 60
                y: 150
             }
             angle: 0
        }
        ParallelAnimation {
            id: fly
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: rotator.angle+randomNumber(-20, 20) }
            NumberAnimation { target: butterfly; property: "y"; to: (butterfly.y + butterfly.speed*Math.floor(10*Math.sin((rotator.angle-90)*Math.PI/180))); duration: 400 }
            NumberAnimation { target: butterfly; property: "x"; to: (butterfly.x + butterfly.speed*Math.floor(10*Math.cos((rotator.angle-90)*Math.PI/180))); duration: 400 }
        }

        Timer {
            running: true
            repeat: true
            interval: 400

            onTriggered: {
                fly.restart();
            }
        }

        Image {
            id: spriteImage
            source: sprite.pngname
            y:-parent.height*sprite.framey
            x:-parent.width*sprite.framex
        }
    }

    function randomNumber(from, to) {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: randomNumber(1, 4)

    Timer {
        interval: 150
        running: true
        repeat: true

        onTriggered: {

            sprite.framex++;
            if (sprite.framex >= 10) {
                  sprite.framex = 0
                  sprite.framey++
            }
            if (sprite.framey >= 4) {
               sprite.framey=1
            }


            if (butterfly.y + butterfly.height < -30) {
               butterfly.destroy();
            }

            if (isNxt && (butterfly.y - butterfly.height >  600)) {
               butterfly.destroy();
            }

            if (!isNxt && (butterfly.y - butterfly.height > 480)) {
               butterfly.destroy();
            }

            if (isNxt && (butterfly.x - butterfly.width > 1024)) {
               butterfly.destroy();
            }

            if (!isNxt && (butterfly.x - butterfly.width > 600)) {
               butterfly.destroy();
            }

            if (butterfly.x + butterfly.width < -30) {
               butterfly.destroy();
            }
        }
    }

}
