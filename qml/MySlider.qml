import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import qmlcontrol.fastslider 1.0

Grid {
    id: slider
    property int from:0
    property int to:100
    property int value: 50
    property int textSize: 20
    verticalItemAlignment: Grid.AlignVCenter
    property string leftLabel: "0%"
    property string rightLabel:"100%"

    onValueChanged: {
        sc.value=value;
    }

    MyText {
        text:  slider.leftLabel
        font.pixelSize: slider.textSize
    }

    Item {
        id: control
        //from: slider.from
        //to: slider.to
       // value: slider.value
        width: 200
        height: 30


        MyPanel {
            anchors.centerIn: parent
            width: parent.width-10
            height: 4
            radius: 2
            border.color: customColor.activeBorderColor
        }

        MyPanel {
            id: nubbel
            width: 30
            height: 30
            radius: 15
            x: sc.xPos
        }

        MouseArea {
            id: area
            anchors.fill: parent
            onPositionChanged: {
                sc.xPos=area.mouseX;
            }
            onPressedChanged: {
                nubbel.border.color = area.pressed ? customColor.activeBorderColor : customColor.borderColor
            }
        }

        FastSlider {
            id: sc
            width : control.width

            onValueChanged: {
                slider.value = value;
            }
        }

        /*background : MyPanel {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: control.availableWidth
            radius: 2
            height: implicitHeight
            border.color: customColor.activeBorderColor
        }

        handle: MyPanel {
            x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
            y: control.topPadding + control.availableHeight / 2 - height / 2
            width: 30
            height: 30
            radius: 15
        }*/
    }

    MyText {
        text: slider.rightLabel
        font.pixelSize: slider.textSize
    }



}
