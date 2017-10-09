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
        title: "General problem: fusion of temporal and dataflow model"
        content: [
            // séquenceurs

            // ableton: max4live
            // bitwig: dataflow (abandonné ?)
            // logic pro: environment
        ]
    }

    //currentSlide: 4
    Frame {
        title: "Temporal model"
        Rectangle {
            anchors.fill: parent
            color: "white"
            border.color: "black"
            radius: 15
            Image {
                width: parent.width - 5
                height: parent.height - 5
                anchors.centerIn: parent
                source: "file:images/score.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
    Frame {
        title: "Implemented in..."
        Rectangle {
            anchors.fill: parent
            color: "white"
            border.color: "black"
            radius: 15
            Image {
                width: parent.width - 5
                height: parent.height - 5
                anchors.centerIn: parent
                source: "file:images/screenshot.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Frame {
        title: "Problem"
        content: [
            "Interdependent input-output in processes",
            "Easy: automation -> sound effect",
            "Easy: cumulated audio effects",
            "Harder: general computations"
        ]
    }
    Frame {
        title: "Problem"
        Fun3 { }
    }

    Frame {
        title: "Data model"
        content: [
            "'Your Traditional Node Graph'",
            "But: Add addresses to ports",
            "Add implicit attributes to nodes: execution date, on/off",
            "Special connection types",
            "At each tick: a concrete graph built on-the-fly from the running nodes"
        ]
    }

    Frame {
        id: frm
        title: "Segregation in high-level components"
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            Rectangle {
                width: 0.6* parent.width
                height: 0.6 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                color: "white"
                border.color: "black"
                radius: 15
                PdObj {
                    content: Image {
                        source: "file:images/minipd.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
            Text {
                font.family: frm.fontFamily
                color: frm.textColor
            }
        }
    }


    Frame {
        title: "Details"
        content: [
            "Port types: audio, midi, osc"
        ]
    }


    Frame {
        title: "Connection type: strict"
        content: [

        ]
    }
    Frame {
        title: "Connection type: glutton"
        content: [

        ]
    }
    Frame {
        title: "Connection type: delayed"
        content: [

        ]
    }

    CodeFrame
    {
        title: "QML"
        code: ""
    }

    Frame {
        title: "Overall process"

    }

    Frame {
        title: "Use as a library"
        content: [
            "Many parameters discussed here parametrizable in library",
            "But specific constraining choices made in GUI software for clarity",
            "Ex.: merge algorithms, default ordering"
        ]
    }
    CodeFrame
    {
        title: "C++ API example"
        code: '
graph g;
auto param = device.create_node("/foo").create_parameter(val_type::FLOAT);
auto param = device.create_node("/bar").create_parameter(val_type::FLOAT);
auto n1_in = make_inlet<value_port>(param);
auto n1_out = make_outlet<value_port>(param);
auto n1 = std::make_shared<node_mock>(
    inlets{n1_in}
  , outlets{n1_out}
  , [=] {
    auto elt = pop_front(n1_in->data.target<value_port>()->data);
    elt.apply([] (auto ){ })
});
g.add_node(n1);
'
    }

    Frame {
        title: "PureData example"
        Rectangle {
            anchors.fill: parent
            color: "white"
            border.color: "black"
            radius: 15
            PdObj {
                content: PdImages {
                    //parent: rect
                    //anchors.centerIn: rect
                }
            }
        }
    }

    Frame {
        title: "OSC synth example"
        content: [
            // with temporal evolution
            // Circular looper ?
        ]
    }

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
            "Live-coding : WIP",
            "Inspiration: jamoma for audio"

        ]
    }


}
