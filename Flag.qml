//flag by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: flag
    property bool destroyed: false
    property bool righttoleft: (yesno==1)? true:false
    property int yesno:  randomNumber(0, 1)
    x: righttoleft?  (parent.width + 140) :-140

    width:160
    height:160
    y: parent.height - 158

    Item {
        id: sprite
        anchors.centerIn: parent
        height: 160
        width: 160
        clip: true
        y: parent.height
        property int framex: righttoleft? 0:9

    ParallelAnimation {
            id: walk
            NumberAnimation { target: flag; property: "x"; to: righttoleft? (x-(5*speed)): (x+(5*speed)); duration: 100 }
        }

        Timer {
            running: true
            repeat: true
            interval: 50
            onTriggered:
            {   if (righttoleft){
                    walk.restart();
                    sprite.framex++;
                    if (sprite.framex >= 10) {
                      sprite.framex = 0
                    }
                 }else{
                    walk.restart();
                    sprite.framex--;
                    if (sprite.framex <= 0) {
                      sprite.framex = 9
                    }

                 }
                }
}

        Image {
            id: spriteImage
            source: righttoleft? "flag1.png":"flag2.png"
            height:160
            y:0
            x:-160*sprite.framex-3
        }
    }

    function randomNumber(from, to) {
           return Math.floor(Math.random() * (to - from + 1) + from);
        }

    property int speed: 3
    Timer {
        interval: 400
        running: true
        repeat: true
        onTriggered: {

        if (!isNxt && (flag.x - flag.width > 810)) {
               flag.destroy();
            }

        if (isNxt && (flag.x - flag.width > 1024)) {
               flag.destroy();
            }

        if (flag.x + flag.width < -140) {
                                   flag.destroy();
                    }

        }
    }

}
