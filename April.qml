//April by Oepi-Loepi for Toon
import QtQuick 2.1

Item {
    id: april

    property bool destroyed: false

    width: isNxt? 200:160
    height: isNxt? 200:160
    x : isNxt? 600:470
    y : isNxt? 300:240

    Rectangle {
            id: textPlate
            color: "red"
            width: isNxt? 200:160
            height:isNxt? 50:40
            radius: 10
            Text{
                id: label1
                font.pixelSize:  isNxt ? 30 : 22
                font.family: qfont.regular.name
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                color:  "black"
                text: "1 April!"
            }
            Text{
                id: label2
                font.pixelSize:  isNxt ? 16 : 12
                font.family: qfont.regular.name
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                color:  "black"
                text: "Click to stop animation"
            }
            MouseArea{
               id: textPlateMouseArea
               anchors.fill: parent
               onClicked: {textPlate.visible = false;animationMouseArea.enabled=true;animationscreen.animationRunning= false;april.destroy()}
            }
            visible:false
    }

    MouseArea{
       id: animationMouseArea
       anchors.fill: parent
       onClicked: {textPlate.visible = true;hideTextTimer.running = true;animationMouseArea.enabled=false}
       enabled:true
   }

   Timer {
        id: hideTextTimer
        interval: 2500
        running: false
        repeat: true
        onTriggered: {
            textPlate.visible = false
            animationMouseArea.enabled=true
        }
    }
}
