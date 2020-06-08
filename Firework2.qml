import QtQuick 2.0
Item {
    id: firework

    property bool destroyed: false

    width: 160
    height: 160
    x :((Math.random() * parent.width-77))
    y : parent.height

    Item {
        id: sprite
        property int frame: 0
        property string pngname : "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/fire" + randomNumber(1, 4) + ".png"

        anchors.centerIn: parent

        height: parent.height
        width: parent.height
        clip: true

        //property int newheight: 100 + (explodeheight*50)
        SequentialAnimation {
            id: move
            NumberAnimation { target: firework; property: "y"; to: 400 - (explodeheight*50); duration: 100 }
        }

        Timer {
            running: true
            repeat: true
            interval: 100

            onTriggered: {
                move.restart();
            }
        }

        Image {
            id: spriteImage
            source: sprite.pngname
            y: 0
            x: -154*sprite.frame
        }
    }

    Timer {
            interval:(75+explodespeed*50)
            running: true
            repeat: true

            onTriggered: {

                sprite.frame++;
                if (sprite.frame >= 8) {
                      firework.destroy()
                }
            }
    }

    function randomNumber(from, to) {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }
    property int explodeheight: randomNumber(3, 8)
    property int explodespeed: randomNumber(1, 4)

}
