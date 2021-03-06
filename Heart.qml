//heart by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: heart

    property bool destroyed: false
	property int yesno:  randomNumber(0, 1)
    

    width:250
    height:250
    y: randomNumber(100, 300)

	property bool righttoleft: (yesno==1)? true:false
    x: righttoleft?  (parent.width + 140) :-140

    Item {
        id: sprite
        anchors.centerIn: parent
        height: isNxt? 250 : 125
        width: isNxt? 250 : 125
        clip: true
        y: parent.height
        property int framex: 0

		ParallelAnimation {
            id: walk
             NumberAnimation { target: heart; property: "x"; to: righttoleft? (x-(5*speed)): (x+(5*speed)); duration: 100 }
        }

        Timer {
            running: true
            repeat: true
            interval:  75
            onTriggered: {
				walk.restart();
				sprite.framex++;
				if (sprite.framex >= 12) {
					  sprite.framex = 0
				}
			}
		}

        Image {
            id: spriteImage
            source:  isNxt? "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/heart4.png" : "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/heart5.png"
            height: isNxt? 250 : 125
            y:0
            x: isNxt? -250*sprite.framex-3 : -125*sprite.framex-3
        }
    }

    function randomNumber(from, to) {
           return Math.floor(Math.random() * (to - from + 1) + from);
    }

    property int speed: isNxt? randomNumber(3, 6) : 3

    Timer {
        interval: 400
        running: true
        repeat: true
        onTriggered: {
			if (!isNxt && (heart.x - heart.width > 800)) {
				   heart.destroy();
				}

			if (isNxt && (heart.x - heart.width > 1024)) {
				   heart.destroy();
			}
			
			if (heart.x + heart.width < -140) {
									   heart.destroy();
			}		
        }
    }

}
