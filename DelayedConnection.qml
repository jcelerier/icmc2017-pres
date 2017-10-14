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
            border.color: "lightgreen"
            border.width: 3
            height: parent.height
            id: sr
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

            border.color: "lightgreen"
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
    PathView {
        model: 10
        NumberAnimation on offset {
            duration: 1000
            loops: Animation.Infinite
            running: true
            from: 0
            to: 1
        }

        delegate: Rectangle {
            id: packet2;
            radius: 50; height: 5; width: 5;
            border.color: "black"
            border.width: 2
            x: 90; y: 2*90+45
            visible: ((sr.width > 0 && sr2.width == 0) && (index / 10 < (3 * sr.width) / r.width))
                     || (sr.width > 0 && sr2.width > 0)
                     || (sr.width == 0 && sr2.width > 0 &&  (index >  10  * (sr2.width - 0.66 * r2.width) / (r2.width- 0.66 * r2.width)))
        }
        path: Path {
            startX: 90
            startY: 90
            PathLine { x: 90; y: 90 + 45 / 2 }
            PathPercent { value: 0.1 }
            PathLine { x: 180; y: 90 + 45 / 2 }
            PathPercent { value: 0.8 }
            PathLine { x: 180; y: 90 + 45 }
            PathPercent { value: 1 }
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
