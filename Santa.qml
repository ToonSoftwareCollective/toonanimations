//Santa by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: santa

    property bool destroyed: false

    width: 120
    height: 120
    x: -60
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
            NumberAnimation { target: santa; property: "x"; to: (x+50); duration: 200 }
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
		source: "SantaSprites2.png"
		y:0
		x:-parent.width*sprite.frame
        }
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

        }
    }

}
