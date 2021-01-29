import QtQuick 2.0
 

Item {
	id: present
	property int speed: isNxt? randomNumber(2, 3) : randomNumber(6, 9)
	property int rotation: randomNumber(3, 10) //maximum rotoation of the presents
	property int presentsize: isNxt? randomNumber(4,10) : randomNumber(4,10) //size of dropping presents
	width: presentsize * 267/10
	height: presentsize * 152/10
	x :((Math.random() * parent.width)-60)
	y : -220;

	Item {
		id: sprite
		property int framex: randomNumber(0, 2)
		property int framey: randomNumber(0, 2)
		
		anchors.centerIn: parent

		width: presentsize * 267/10
		height: presentsize * 152/10
		clip: true

		transform: Rotation {
			id: rotator

			origin {
				x: 60
				y: 110
			 }
			 angle: 0
		}

		SequentialAnimation {
			id: shake
			PropertyAnimation { easing.type: Easing.InQuad; duration: 1100; target: rotator; property: "angle"; to: rotation }
			PropertyAnimation { easing.type: Easing.InQuad; duration: 1100; target: rotator; property: "angle"; to: -1* rotation}
		}

		Timer {
			running: true
			repeat: true
			interval: 2200

			onTriggered: {
				shake.restart();
			}
		}

		Image {
			id: spriteImage
			source: "https://raw.githubusercontent.com/ToonSoftwareCollective/toonanimations/main/Present.png"

			x:-267 * presentsize/10*sprite.framex
			y:-152 * presentsize/10*sprite.framey
			width: 800 *  presentsize/10
			height:471 * presentsize/10
		}
	}

	function randomNumber(from, to) {
	   return Math.floor(Math.random() * (to - from + 1) + from);
	}
	
	Timer {
		interval: 50
		running: true
		repeat: true
		onTriggered: {
			present.y += speed;
			if (isNxt && (present.y - present.height)> 700) {
			   present.destroy();
			}

			if (!isNxt && (present.y - present.height) > 550) {
			   present.destroy();
			}
		}
	}
}


