import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    width: 1280
    height: 720

    Image {
        id: image5
        x: 706
        y: 232
        width: 391
        height: 425
        fillMode: Image.PreserveAspectFit
        source: "images/dessin.svg"

        cache: false
    }

    Column {
    }

    ColumnLayout {
        x: 796
        y: 28

        Text {
            id: text1
            text: qsTr("f1")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.preferredHeight: 37
            Layout.preferredWidth: 25
            font.bold: true
            font.pixelSize: 26
        }

        Image {
            id: image
            source: "images/pd-1.png"
        }
    }

    ColumnLayout {
        x: 1137
        y: 93

        Text {
            id: text2
            text: qsTr("f2")
            font.pixelSize: 26
            Layout.preferredHeight: 37
            Layout.preferredWidth: 25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.bold: true
        }

        Image {
            id: image1
            source: "images/pd-2.png"
        }


    }

    ColumnLayout {
        x: 562
        y: 310

        Text {
            id: text3
            text: qsTr("f3")
            font.pixelSize: 26
            Layout.preferredHeight: 37
            Layout.preferredWidth: 25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.bold: true
        }

        Image {
            id: image4
            source: "images/pd-5.png"
        }
    }

    ColumnLayout {
        x: 1114
        y: 404

        Text {
            id: text4
            text: qsTr("f4")
            font.pixelSize: 26
            Layout.preferredHeight: 37
            Layout.preferredWidth: 25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.bold: true
        }

        Image {
            id: image3
            source: "images/pd-4.png"
        }
    }

    ColumnLayout {
        x: 552
        y: 520

        Text {
            id: text5
            text: qsTr("f5")
            font.pixelSize: 26
            Layout.preferredHeight: 37
            Layout.preferredWidth: 25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.bold: true
        }

        Image {
            id: image2
            source: "images/pd-3.png"
        }
    }

    ColumnLayout {
        x: 18
        y: 36

        Text {
            id: text6
            text: qsTr("Temporal graph")
            font.bold: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 24
        }

        Image {
            id: image6
            Layout.preferredHeight: 602
            Layout.preferredWidth: 501
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 400
            sourceSize.height: 0
            source: "images/tflow.png"
        }
    }


}
