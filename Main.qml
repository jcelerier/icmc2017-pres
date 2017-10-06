import QtQuick.Controls 2.2 as QC
import Qt.labs.presentation 1.0
import QtQuick 2.5
import QtMultimedia 5.5

Presentation
{
    id: presentation
    mouseNavigation: false
    width: 1440
    height: 900

    Rectangle {
        anchors.fill: parent
        color: "#EEEEEE"
    }

    SlideCounter {}
    Clock {}

    Frame {
        centeredText: "Extending dataflows with temporal graphs"
    }

    Frame {
        title: "Table of contents"
        content: [
            "Context",
            "Problem",
            "Temporal model",
            "Data model",
            "Example with PureData",
            "Simple OSC synth",
            "Demo",
            "Conclusion"
        ]
    }

    Frame {
        title: "Problem: fusion of temporal and dataflow model"
        content: [
            // séquenceurs

            // ableton: max4live
            // bitwig: dataflow
            // logic pro
        ]
    }

    Frame {
        title: "Practical problem"
        content: [
            // ex. avec deux temps qui s'opposent
        ]
    }

    Frame {
        title: "Temporal model"
        content: [
            // image i-score
        ]
    }
    Frame {
        title: "Data model"
        content: [
            "Add addresses to ports",
            "Inspiration: jamoma for audio",
            "Port types: audio, midi, osc"
        ]
    }
    Frame {
        title: "Connection types: strict"
        content: [

        ]
    }
    Frame {
        title: "Connection types: glutton"
        content: [

        ]
    }
    Frame {
        title: "Connection types: delayed"
        content: [

        ]
    }
    CodeFrame
    {
        title: "QML"
        code: ""
    }
    Frame {
        title: "OSC synth example"
        content: [
            // with temporal evolution
        ]
    }
    Frame {
        title: "PureData example"
        Rectangle {
            anchors.fill: parent
            color: "white"
            border.color: "black"
            radius: 15
            PdObj {

            }
        }

    }

    currentSlide: 11

    Frame {
        title: "What's next"
        content: [
            // general distributed meta-sequencer
            // fusion ohm-studio, max, ableton
            // timeline -> mettre répartition
        ]
    }

    Frame {
        title: "Conclusion"
        content: [
            "Live-coding : WIP"

        ]
    }


}
