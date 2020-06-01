
import QtQuick 2.0

Rectangle {
    id: f1car
    width: parent.width
    height: parent.height
    color:"transparent"

 Canvas {
        id: canvas
        opacity:0.5;
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var context = canvas.getContext("2d")
            context.clearRect(0, 0, width, height)
            context.lineWidth = 25
            context.globalAlpha = 0.1
            context.strokeStyle = "black"
            context.path = pathAnim.path
            context.stroke()
        }
    }
    
   SequentialAnimation {
        running: true
        loops: -1

        PathAnimation {
            id: pathAnim

            duration: 15000
           // easing.type: Easing.Linear

            target: carImage
            orientation: PathAnimation.RightFirst
            anchorPoint: Qt.point(carImage.width/2, carImage.height/2)
            path: Path {
                startX: 50; startY: 200

               PathCubic {
                    x: 500
                    y: 50
                    control1X: 10; control1Y: -10
                    control2X: 50; control2Y: 30
                }
               PathCubic {
                    x: 1000
                    y: 100
                    control1X: x; control1Y: y
                    control2X: 1000-2; control2Y: 100-30
                }

               PathCubic {
                    x: 700
                    y: 300
                    control1X: x; control1Y: y
                    control2X: 700-2; control2Y: 300-30
                }

               PathCubic {
                    x: 900
                    y: 400
                    control1X: x; control1Y: y
                    control2X: 910; control2Y: 300
                }

               PathCubic {
                    x: 500
                    y: 500
                    control1X: x; control1Y: y
                    control2X: 540; control2Y: 410
                }

               PathCubic {
                    x: 500
                    y: 650
                    control1X: x; control1Y: y
                    control2X: 540; control2Y: 600
                }

               PathCubic {
                    x: 400
                    y: 400
                    control1X: x-50; control1Y: y
                    control2X: 450; control2Y: 450
                }

               PathCubic {
                    x: 50
                    y: 200
                    control1X: x; control1Y: y
                    control2X: 50; control2Y: 230
                }

                onChanged: canvas.requestPaint()
            }
        }

    }

    Image {
        id: carImage
                source: "f1car.png"
                x: 25; y: 25
                width: 50; height: 25
                MouseArea{
                    id: carMouseArea
                    anchors.fill: parent
                    //onClicked: { animationscreen.animationRunning= false}
                }
            }

}
