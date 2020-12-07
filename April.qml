//April by Oepi-Loepi for Toon

import QtQuick 2.1

Item {
    id: april

    property bool destroyed: false

    width: 1
    height: 1
    x : 1
    y : 1

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: {
               april.destroy();
        }
    }
}
