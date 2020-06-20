import QtQuick 2.0
Item {
    id: leaf

    property bool destroyed: false
    property int leafsize: isNxt? randomNumber(5, 10) : randomNumber(5, 8)

    width: leafsize *16
    height: leafsize *16
    x :((Math.random() * parent.width)-60)
    y : -300



    Item {
        id: sprite
        property int framex: randomNumber(0, 6)
        property int framey: randomNumber(0, 5)
        //property string pngname : isNxt?  "leaf-" + randomNumber(1, 11) + ".png" : "leaf-" + randomNumber(1, 5) + ".png"
        property string pngname :  "leaf-" + randomNumber(1, 11) + ".png" 

        anchors.centerIn: parent

        height: leafsize *16
        width: leafsize *16
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
            y:-160 * leafsize/10*sprite.framey
            x:-160 * leafsize/10*sprite.framex
            width: 960 * leafsize/10
            height:800 * leafsize/10
        }
    }


    function randomNumber(from, to) {
       return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: isNxt?  randomNumber(4, 7) : randomNumber(4, 7)
    
    Timer {
        interval: speed*15
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


            if (isNxt && (leaf.y  <  -300)) {
               leaf.destroy();
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
