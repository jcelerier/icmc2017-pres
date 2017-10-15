import QtQuick.Controls 2.2 as QC
import Qt.labs.presentation 1.0
import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtMultimedia 5.5

Presentation
{
    id: presentation
    mouseNavigation: false
    width: 1280
    height: 720

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
        title: "General question: convergence of temporal and dataflow model"
        Image {
            source: "file:images/logic-environment.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    Frame {
        title: "General question: convergence of temporal and dataflow model"
        Image {
            source: "file:images/max4live.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    Frame {
        title: "Temporal model we work with"
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 0.8 * parent.width
            height: 0.93 * parent.height
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
        Caption {
            text: "Described in [1]"
        }

    }
    Frame {
        title: "Implemented in..."
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 0.8 * parent.width
            height: 0.93 * parent.height
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

        Caption {
            text: "Ossia Score: www.ossia.io"
        }
    }
    /*
    Frame {
        title: "Problem"
        content: [
            "Interdependent input-output in processes",
            "Easy: automation → sound effect",
            "Easy: cumulated audio effects",
            "Harder: general computations"
        ]
    }
    */

    Frame {
        title: "Problem"
        id: probFrame

        Fun3 { anchors.horizontalCenter: parent.horizontalCenter; height: 0.8*parent.height; width: 0.8*parent.width; }

        Caption {
            text: "Nodes may not always be active at the same time.
OK for [sfplay~] & [+~], not so much for deeper functional dependencies"
        }
    }

    Frame {
        id: frm
        title: "Segregation in high-level components"
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            Rectangle {
                width: 0.6* parent.width
                height: 0.7 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                color: "white"
                border.color: "black"
                radius: 15
                PdObj {
                    content: Image {
                        source: "file:images/minipd.png"
                        height: 0.95 * parent.height
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }

    Frame {
        title: "Proposed data model"
        content: [
            "An usual node graph",
            "Global & local environment",
            "Extend ports with addresses in these environments",
            "Extend nodes with attributes: execution date, on/off",
            "Special connection types",
            "At each tick: actual execution graph built on-the-fly from the running nodes"
        ]
    }

    CodeFrame {
        title: "Environment"
        codeFontSize: baseFontSize
        code: "max:/foo/bar : float  = 1.34
modul8:/fov  : string = \"hello world\"
audio:/in/0  : audio  = [0.1, -0.1, ...]
midi:/in     : midi   = note on(64, 127)
..."
    }
    Frame {
        title: "Environment"
        content: [
            "Graph nodes can read and write to the environment addresses",
            "Three scopes considered: \n
➡ Connection scope: only read-write to edges (patch cords)\n
➡ Local environment: write to a data store without influencing the outside world\n
➡ Global environment: write messages to the outside world directly"
        ]
    }

    Frame {
        title: "Node"
        Image {
            source: "file:images/node-ex2.png"
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
            width: 0.7 * parent.width
            height: 0.7 * parent.height
        }
    }

    Frame {
        title: "Connection types"
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 1000
            spacing: 30
            Column {
                spacing: 30
                width: 300
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Strict"
                    font.pointSize: 30
                }
                StrictConnection { width: 200; height: 500; anchors.horizontalCenter: parent.horizontalCenter }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "If an end is disabled, the other end is, too"
                    font.pointSize: 24
                }
            }
            Column {
                spacing: 30
                width: 300
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Glutton"
                    font.pointSize: 30
                }
                GluttonConnection { width: 200; height: 500; anchors.horizontalCenter: parent.horizontalCenter }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Nodes are always enabled and will read and write in the environment if the other side is disabled"
                    font.pointSize: 24
                }
            }
            Column {
                spacing: 30
                width: 300
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Delayed"
                    font.pointSize: 30
                }
                DelayedConnection { width: 200; height: 500; anchors.horizontalCenter: parent.horizontalCenter }
            }
        }
    }

    Frame {
        title: "Ordering"
        Column {
            width: parent.width
            Image {
                source: "file:images/conflict.png"
                anchors.horizontalCenter: parent.horizontalCenter
                width: 400
                fillMode: Image.PreserveAspectFit
            }
            Text {
                font.family: frm.fontFamily
                color: frm.textColor
                font.pointSize: frm.fontSize
                text: "Resolutions:<br/>
➡ Random order, creation order, etc.<br/>
➡ Give an explicit order: add a dependency edge between nodes.<br/>
➡ Temporal ordering: <i>f</i> started before <i>g</i> ? <i>g ∘ f</i> : <i>f ∘ g</i>.<br/>
➡ Hierarchical ordering (the order of the processes in score[3]).<br/>
➡ If someone can devise correct semantics: map & fold ?<br/>"
            }
        }
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
        codeFontSize: baseFontSize * 0.5;
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
            "Inspiration: jamoma for audio",

            "🌐: www.ossia.io ➡ Download ➡ score-icmc2017.zip",
            "(Mac release; works on linux if compiled)",
            "Source code: \n\t
➡ Library: github.com/OSSIA/libossia (branch v3)\n\t
➡ Software: github.com/OSSIA/score (branch feature/dataflow)\n\t"
        ]
    }
    Frame {
        title: "References"
        content: [
            "[1]: libpd",
            "[2]: OSSIA: ...",
            "[3]: iscore-addon-audio"
        ]
    }


}
