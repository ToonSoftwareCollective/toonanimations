//witch by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: witch
    property int witchsize: randomNumber(3, 6)
    property bool destroyed: false
    width: witchsize *21 *2
    height: witchsize *29 *2
    property int yesno:  randomNumber(0, 1)
    property bool righttoleft: (yesno==1)? true:false
    x: righttoleft?  (parent.width + 200) :-300
    y :(Math.random()*(parent.height-200))
    property int angle:  randomNumber(-1, 1)



    Item {
        id: sprite
        anchors.centerIn: parent
        height: parent.height
        width: parent.height
        clip: true
        y: parent.height
        property int framex: randomNumber(0, 9)


        ParallelAnimation {
            id: fly
            NumberAnimation { target: witch; property: "x"; to: righttoleft? (x-(5*speed)):(x+(5*speed)) ; duration: 100 }
            NumberAnimation { target: witch; property: "y"; to: (y+(speed*angle)); duration: 100 }
        }

        Timer {
            running: true
            repeat: true
            interval: 50
            onTriggered: {
                fly.restart();
                sprite.framex++;
                if (sprite.framex >= 12) {
                      sprite.framex = 0
                }
            }
        }

        Image {
        id: spriteImage
        source: righttoleft? "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Witch2.png": "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/Witch.png"
        x:-300 * witchsize/5 * sprite.framex
        width: 3588 *  witchsize/5
        height:212 * witchsize/5
        }
    }

    function randomNumber(from, to) {
           return Math.floor(Math.random() * (to - from + 1) + from);
        }

    property int speed: randomNumber(3, 6)

    Timer {
        interval: 400
        running: true
        repeat: true
        onTriggered: {

            if (witch.y + witch.height < -30) {
               witch.destroy();
            }

            if (isNxt && (witch.y - witch.height -20 >  600)) {
               witch.destroy();
            }

            if (!isNxt && (witch.y - witch.height -20 > 480)) {
               witch.destroy();
            }

            if (isNxt && (witch.x - witch.width > 1024)) {
               witch.destroy();
            }

            if (!isNxt && (witch.x - witch.width > 600)) {
               witch.destroy();
            }

            if (witch.x + witch.width < -30) {
               witch.destroy();
            }

        }
    }

}
