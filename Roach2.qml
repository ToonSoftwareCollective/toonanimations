//Roach by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: roach

    property bool destroyed: false

    width: 120
    height: 120
    x : ((Math.random() * parent.width)-60);
    y : parent.height;

    Item {
        id: sprite
        property int frame: randomNumber(1, 9)
        anchors.centerIn: parent
		height: parent.height
        width: parent.height
        clip: true
	y: parent.height

    	function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    	}

        transform: Rotation {
            id: rotator
            origin{
                x: 60
                y: 100
             }
             angle:  randomNumber(-10, 10)
        
	}
  
	ParallelAnimation {
            id: walk
            PropertyAnimation { easing.type: Easing.InQuad; duration: 400; target: rotator; property: "angle"; to: rotator.angle+randomNumber(-20, 20)}
	    NumberAnimation { target: roach; property: "y"; to: (roach.y + roach.speed*Math.floor(20*Math.sin((rotator.angle-90)*Math.PI/180))); duration: 400 }
            NumberAnimation { target: roach; property: "x"; to: (roach.x + roach.speed*Math.floor(20*Math.cos((rotator.angle-90)*Math.PI/180))); duration: 400 }
        }

        Timer {
            running: !roach.destroyed
            repeat: true
            interval: 1200
            onTriggered: {
                walk.restart();
        }
}

        Image {
			id: spriteImage
            source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/RoachSprites.png"
			y:0
			x:-parent.width*sprite.frame
            MouseArea{
                id: roachMouseArea
                anchors.fill: parent
                onClicked: { spriteImage.source = "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/RoachDeath1.png";sprite.frame = 1;roach.destroyed = true;}
            }
        }
    }


    function randomNumber(from, to) {
		return Math.floor(Math.random() * (to - from + 1) + from);
    }

    Timer {
         id: destroy;
         repeat: true;
         interval: 300;
         running: roach.destroyed
         onTriggered: {
             if (sprite.frame >= 3) {
                sprite.destroy();
             }
             sprite.frame++;
             roach.y += 100;
         }
     }

    property int speed: randomNumber(1, 4)

    Timer {
        interval: 300
        running: !roach.destroyed
        repeat: true
        onTriggered: {
        if (!destroyed) {
            if (sprite.frame == 7) {
            sprite.frame = 0
                }
                sprite.frame++;
        }

            if (roach.y + roach.height < -30) {
               roach.destroy();
            }

            if (roach.y - roach.height > 600) {
               roach.destroy();
            }

            if (roach.x - roach.width > 1024) {
               roach.destroy();
            }

            if (roach.x + roach.width < -30) {
               roach.destroy();
            }

        }
    }

}
