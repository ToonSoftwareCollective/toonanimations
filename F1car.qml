
import QtQuick 2.1

Item {
    id: f1car

    width: 120
    height: 60

    Item {
        id: sprite
        property int frame: randomNumber(1, 9)
        anchors.centerIn: parent
        height: parent.height
        width: parent.height
        clip: true
        x: carImage.height+100
    }


    SequentialAnimation {
        running: true
        loops: -1

        PropertyAnimation { properties: "y";
                            easing.type: Easing.InOutQuad;
                            easing.amplitude: 0.5;
                            easing.period: 1.5 }
        PathAnimation {
            id: pathAnim

            duration: 15000

            target: carImage
            orientation: PathAnimation.RightFirst
            anchorPoint: Qt.point(carImage.width/2, carImage.height/2)
            path: Path {
                startX: carImage.height+100
                startY: carImage.height+50

                PathCurve  {
                    x: parent.width-carImage.height-100
                    y: carImage.height+50

                }

                PathCurve  {
                    x: parent.width -carImage.height
                    y: parent.height-carImage.height -100

                }
                PathCurve  {
                    x: 2* parent.width/3
                    y: parent.height-carImage.height-50

                }
                PathCurve  {
                    x: 2* parent.width/3
                    y: isNxt? 300 : 240

                }
                PathCurve  {
                    x: parent.width/3
                    y: isNxt? 300 : 240

                }
                PathCurve  {
                    x: parent.width/3
                    y:  parent.height-carImage.height-50

                }
                PathCurve  {
                    x: carImage.height
                    y:  parent.height-carImage.height-50

                }
                PathCurve  {
                    x: carImage.height+100
                    y: carImage.height+50

                }
                onChanged:    canvas.requestPaint()
            }
        }

    } 

        Image {
            id: carImage
            source: "f1rb.png"
	    y:0
            x:0
            height:60
            width: 120
            MouseArea{
                id: carMouseArea
                anchors.fill: parent
                onClicked: {animationscreen.animationRunning= false;f1car.destroy()}
            }
        }
	
	Timer {
        	interval: 2500
        	running: true
        	repeat: true
        	onTriggered: {
			if (animationscreen.animationRunning==false) {
                		f1car.destroy();
            		}
		}
	}

    }
