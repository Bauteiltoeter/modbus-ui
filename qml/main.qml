import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 750
    height: 480

    title: qsTr("Stromquelle")

    Item {
        id: customColor
        property color green: "#19ff00"
        property color red: "#ff3f00"
        property color yellow: "#A1A203"
        property color textColor: "#CCCCCC"
        property color background: "#303030"
        property color borderColor: "#202020"
        property color activeBorderColor: "#CCCCCC"
    }


    background: Rectangle {
        anchors.fill: parent

        color: customColor.background
    }

    MyText {
        id: opModeText
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 15
        anchors.leftMargin: 15
        text: "Operation mode:"
    }

    ComboBox {
        anchors.top: opModeText.top
        anchors.left:opModeText.right
        width: 150
        background: MyPanel {
            width: parent.width
            height: parent.height
        }



        model: [ "Standard", "Akkuschänder", "Oops" ]

    }

    FrameMain {

    }



    MyButton {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        text: "Output enable"
        isCheckable: true
        hasActiveLed: false
        hasPassiveLed: false
        activeBorderColor: customColor.green
        activeTextColor: customColor.green
    }


}
