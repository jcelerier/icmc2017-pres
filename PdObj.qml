import QtQuick 2.9
Rectangle {
    x: 5
    y: 5
    anchors.centerIn: parent
    width: parent.width - 10
    height: parent.height - 10
    clip: true

    PdImages {
        anchors.centerIn: parent
    }
    Rectangle { id: hint; x: 5; y: 5; width: 5; height: 5;  }
    Canvas {
        id: canvas
        anchors.fill: parent
        anchors.centerIn: parent
        antialiasing: true
        smooth: true
        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 5
            ctx.strokeStyle = area.colors[area.curColor]
            ctx.lineCap = "round"
            ctx.lineJoin = "round"
            if(area.lastx !== 0)
            {
                ctx.beginPath()
                ctx.moveTo(area.lastx, area.lasty)
                ctx.lineTo(area.mouseX, area.mouseY)
                ctx.stroke()
                ctx.closePath()
            }
            area.lastx = area.mouseX
            area.lasty = area.mouseY
        }
    }
    MouseArea {
        id: area
        property real lastx:0
        property real lasty:0
        anchors.fill: parent
        property var colors : [ "blue", "gold", "red" ]
        property int curColor: 0
        onWheel: {
            curColor = ++curColor % colors.length
            console.log(curColor + area.colors[area.curColor] )
            hint.color = area.colors[area.curColor]
        }

        acceptedButtons: Qt.AllButtons
        onPressed: {
            lastx = mouseX
            lasty = mouseY
            if(pressedButtons & Qt.RightButton) {
                canvas.getContext("2d").reset()
                canvas.requestPaint()
            }
        }

        onPositionChanged: {
            if(pressedButtons & Qt.LeftButton) {
                canvas.requestPaint()
            }
        }
    }
}
