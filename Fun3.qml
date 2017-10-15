import QtQuick 2.0

Item {
    Rectangle {
        id: r1
        x:0
        y:0
        width: 400
        height: 130
        border.width: 2
        border.color: "black"
        Rectangle {
            x: 0
            y: 0
            border.color: "lightgreen"
            border.width: 3
            height: parent.height
            NumberAnimation on width {
                id: anim1
                running: false
                from: 0
                to: r1.width
                duration: 3000
            }
        }
        Text {
            font.pointSize: 36
            anchors.centerIn: parent
            text: 'f1'
        }
        MouseArea {
            anchors.fill: parent
            drag.target: r1
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed: anim1.running = pressedButtons & Qt.LeftButton
        }
    }
    Rectangle {
        id: r2
        x: 180
        y: 150
        width: 400
        height: 130
        border.width: 2
        border.color: "black"
        Rectangle {
            x: 0
            y: 0
            border.color: "lightgreen"
            border.width: 3
            height: parent.height
            NumberAnimation on width {
                id: anim2
                running: false
                from: 0
                to: r2.width
                duration: 3000
            }
        }
        Text {
            font.pointSize: 36
            anchors.centerIn: parent
            text: "f2"
        }
        MouseArea {
            anchors.fill: parent
            drag.target: r2
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed: anim2.running = pressedButtons & Qt.LeftButton
        }
    }
    Rectangle {
        id: r3
        x: 300
        y: 300
        width: 400
        height: 130
        border.width: 2
        border.color: "black"

        Rectangle {
            x: 0
            y: 0
            border.color: "lightgreen"
            border.width: 3
            height: parent.height
            NumberAnimation on width {
                id: anim3
                running: false
                from: 0
                to: r3.width
                duration: 3000
            }
        }
        Text {
            font.pointSize: 36
            anchors.centerIn: parent
            text: "f3"
        }

        MouseArea {
            anchors.fill: parent
            drag.target: r3
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onPressed: anim3.running = pressedButtons & Qt.LeftButton
        }

    }
}
