import QtQuick 2.0
Item {
    id: leaf

    property bool destroyed: false

    width: 160
    height: 160
    x :((Math.random() * parent.width)-60)
    y : -300

    Item {
        id: sprite
        property int framex: randomNumber(0, 6)
        property int framey: randomNumber(0, 5)
        property string pngname : "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/leaf-" + randomNumber(1, 10) + ".png"

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
             angle: 180
        }
        ParallelAnimation {
        //SequentialAnimation {
            id: shake
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: rotator.angle+randomNumber(-30, 30) }
            NumberAnimation { target: leaf; property: "y"; to: (leaf.y + leaf.speed*Math.floor(10*Math.sin((rotator.angle-90)*Math.PI/180))); duration: 400 }
            NumberAnimation { target: leaf; property: "x"; to: (leaf.x + leaf.speed*Math.floor(10*Math.cos((rotator.angle-90)*Math.PI/180))); duration: 400 }
        }

        Timer {
            running: true
            repeat: true
            interval: 400

            onTriggered: {
                shake.restart();
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

    property int speed: isNxt? randomNumber(3, 6) : randomNumber(5, 8)

    Timer {
        interval: 75
        running: true
        repeat: true

        onTriggered: {

            sprite.framex++;
            if (sprite.framex >= 6) {
                  sprite.framex = 0
                  sprite.framey++
            }
            if (sprite.framey >= 5) {
               sprite.framey=0
            }


            if (isNxt && (leaf.y  >  600)) {
               leaf.destroy();
            }

            if (!isNxt && (leaf.y > 480)) {
               leaf.destroy();
            }

            if (isNxt && (leaf.x - leaf.width > 1024)) {
               leaf.destroy();
            }

            if (!isNxt && (leaf.x - leaf.width > 600)) {
               leaf.destroy();
            }

            if (leaf.x + leaf.width < -30) {
               leaf.destroy();
            }
        }
    }

}
