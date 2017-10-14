import QtQuick 2.0


Item {
    width: 300
    height: 300
    Rectangle {
        id: r

        width: 200
        height: 90
        border.width: 2
        border.color: "black"
        Rectangle {
            border.color: width > parent.width / 3 ? "lightgreen" : "darkred"
            border.width: 3
            id: sr
            height: parent.height
            SequentialAnimation on width {
                id: anim
                running: false
                NumberAnimation {
                    from: 0
                    to: r.width
                    duration: 3000
                }
                ScriptAction {
                    script: sr.width = 0
                }
            }
        }
    }

    Rectangle {
        id: r2

        x: r.width / 3
        y: r.height + 45

        width: 200
        height: 90
        border.width: 2
        border.color: "black"
        Rectangle {
            property bool active: width < (2/3) * parent.width && width > 0
            border.color: active ? "lightgreen" : "darkred"
            border.width: 3
            id: sr2
            height: parent.height
            SequentialAnimation on width {
                id: anim2
                running: false
                NumberAnimation { duration: 1000 }
                NumberAnimation {
                    from: 0
                    to: r2.width
                    duration: 3000
                }
                ScriptAction {
                    script: sr2.width = 0
                }
            }
        }
    }

    Rectangle { id: packet;
        radius: 50; height: 5; width: 5;
        border.color: "black"
        border.width: 2
        x: 90; y: 90
        visible: sr2.active

        PathAnimation {
            target: packet
            running: sr2.active
            duration: 500
            loops: Animation.Infinite
            path: Path {
                startX: 90
                startY: 90
                PathLine { x: 90; y: 90+45 }
            }
        }
    }

    Rectangle { id: packet2;
        radius: 50; height: 5; width: 5;
        border.color: "black"
        border.width: 2
        x: 90; y: 2*90+45
        visible: sr2.active

        PathAnimation {
            target: packet2
            running: sr2.active
            duration: 500
            loops: Animation.Infinite
            path: Path {
                startX: 90; startY: 2*90+45
                PathLine { x: 90; y: 3*90 }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onPressed: {

            anim.running = pressedButtons & Qt.LeftButton
            anim2.running = pressedButtons & Qt.LeftButton
        }
    }
}
