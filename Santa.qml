//Santa by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: santa
    property bool destroyed: false
    property int yesno:  randomNumber(0, 1)
    property bool righttoleft: (yesno==1)? true:false
    x: righttoleft?  (parent.width + 60) :-60

    width: 120
    height: 120
    y: parent.height - 108

    Item {
        id: sprite
        property int frame: 1
        anchors.centerIn: parent
		height: parent.height
        width: parent.height
        clip: true
        y: parent.height

        ParallelAnimation {
                id: walk
                NumberAnimation { target: santa; property: "x"; to: righttoleft? (x-50): (x+50); duration: 200 }
        }

        Timer {
            running: true
            repeat: true
            interval: 200
            onTriggered: {
                walk.restart();
                if (sprite.frame == 11) {
                    sprite.frame = 0
                 }
                 sprite.frame++;
            }
        }

        Image {
            id: spriteImage
            source: righttoleft? "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/SantaSprites1.png" : "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/SantaSprites2.png"
            y:0
            x:-parent.width*sprite.frame
        }
    }
    
    function randomNumber(from, to) {
        return Math.floor(Math.random() * (to - from + 1) + from);
    }

    Timer {
        interval: 400
        running: true
        repeat: true
        onTriggered: {
            if (!isNxt && (santa.y - santa.height > 480)) {
                   santa.destroy();
            }

            if (isNxt && (santa.x - santa.width > 1024)) {
               santa.destroy();
            }

            if (santa.x + santa.width < -80) {
                           santa.destroy();
            }
        }
    }

}

