
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
    	}

  
    SequentialAnimation {
        running: true
        loops: -1

        PropertyAnimation { properties: "y";
                            easing.type: Easing.InOutSine;
                            easing.amplitude: 2.0;
                            easing.period: 1.5 }
        PathAnimation {
            id: pathAnim

            duration: 15000

            target: carImage
            orientation: PathAnimation.RightFirst
            anchorPoint: Qt.point(carImage.width/2, carImage.height/2)
            path: Path {
                startX: carImage.height;
                startY: carImage.height

               PathCubic {
                    x: parent.width-carImage.height
                    y: carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: parent.width -carImage.height
                    y: parent.height-carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: 2* parent.width/3
                    y: parent.height-carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: 2* parent.width/3
                    y: 300
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: parent.width/3+20
                    y: 300
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: parent.width/3+20
                    y: parent.height-carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: carImage.height
                    y: parent.height-carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

               PathCubic {
                    x: carImage.height
                    y: carImage.height
                    control1X: x; control1Y: y
                    control2X: x; control2Y: y
                }

                onChanged: canvas.requestPaint()
            }
        }

    }

        Image {
            id: carImage
            source: "f1car.png"
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
    }
