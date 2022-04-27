//flag by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: flag
    property bool destroyed: false
    property bool righttoleft: (yesno==1)? true:false
    property int yesno:  randomNumber(0, 1)
    x: righttoleft?  (parent.width + 140) :-140

    width:isNxt? 160:120
    height:isNxt? 160:120
    y: isNxt? (parent.height - 158):(parent.height - 118)

    Item {
        id: sprite
        anchors.centerIn: parent
        height: isNxt? 160:120
        width: isNxt? 160:120
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
            interval: isNxt? 100:200
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
            source: righttoleft? isNxt? "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/flag1.png": "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/flag1_t1.png": isNxt? "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/flag2.png":"https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/flag2_t1.png"
            height: isNxt? 160:120
            y:0
            x: isNxt?(-160*sprite.framex-3):(-120*sprite.framex-3)
        }
    }

    function randomNumber(from, to) {
           return Math.floor(Math.random() * (to - from + 1) + from);
        }

    property int speed: 3

    //check if animation is out of screen
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
        console.log(righttoleft)

        if (!isNxt && (flag.x - flag.width > 830)) {
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

