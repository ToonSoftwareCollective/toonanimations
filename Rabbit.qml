//rabbit by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: rabbit

    property bool destroyed: false

    width: 125
    height: 107
    x: -60
    y: parent.height - 107


    Item {
        id: sprite
        anchors.centerIn: parent
        height: parent.height
        width: parent.height
        clip: true
        y: parent.height
        property int framex: randomNumber(0, 9)
        property int framey: randomNumber(0, 1)

    ParallelAnimation {
            id: walk
            NumberAnimation { target: rabbit; property: "x"; to: (x+(5*speed)); duration: 100 }
        }

        Timer {
            running: true
            repeat: true
            interval: 50
            onTriggered: {
            walk.restart();
            sprite.framex++;
            if (sprite.framex >= 12) {
                  sprite.framex = 0
                  sprite.framey++
            }
            if (sprite.framey === 1 && sprite.framex >= 11 ) {
               sprite.framey= 0
                sprite.framex = 0
            }
        }
}

        Image {
        id: spriteImage
        source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/master/rabbit.png"
        y:-107 *sprite.framey
        x:-125*sprite.framex
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

        if (!isNxt && (rabbit.x - rabbit.width > 800)) {
               rabbit.destroy();
            }

        if (isNxt && (rabbit.x - rabbit.width > 1024)) {
               rabbit.destroy();
            }

        }
    }

}
