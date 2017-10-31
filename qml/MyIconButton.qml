import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: button
    property color activeBorderColor:   "#CCCCCC"
    property color passiveBorderColor:  "#202020"
    property color activeLedColor:      customColor.red
    property color passiveLedColor:     customColor.green
    property bool hasPassiveLed: false
    property bool hasActiveLed: false
    property bool active;
    property bool isCheckable : false
    property string icon : "attention.svg"
    property string text: ""
    property int textSize: 30

    signal clicked;

    width: 60
    height: 60

    radius: 10
    border.color: active ? activeBorderColor : passiveBorderColor
    border.width: 4
    color: "#303030"


    LinearGradient {
        anchors.fill: parent
        anchors.margins: 3
        source: button
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#404040" }
            GradientStop { position: 1.0; color: "#202020" }
        }
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: hasActiveLed||hasPassiveLed ? led.top : parent.bottom
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        smooth: true
        source: parent.icon != "" ? "../images/"+parent.icon :""
        fillMode: Image.PreserveAspectFit
    }

    MyText {
        anchors.horizontalCenter: parent.horizontalCenter
        //width: 50
        anchors.top: parent.top
        anchors.bottom: hasActiveLed||hasPassiveLed ? led.top : parent.bottom
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        text: button.text
        font.pixelSize: button.textSize
    }

    Rectangle {
        id: led
        color: button.active ? activeLedColor : passiveLedColor
        visible: button.active ? button.hasActiveLed : button.hasPassiveLed
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width-20
        height: 4
        anchors.bottomMargin: 10
        anchors.bottom: parent.bottom
        radius: 1
    }

    Glow {
        anchors.fill: led
        radius: 3
        samples: 5
        color: button.active ? activeLedColor : passiveLedColor
        visible: button.active ? button.hasActiveLed : button.hasPassiveLed
        source: led
    }

    MouseArea {
        anchors.fill: parent
        onPressedChanged: {
            if(pressed)
                button.clicked();
            if(button.isCheckable )
            {
                if ( pressed === true)
                    button.active =!button.active

            }
            else
            {
                button.active = pressed
            }

        }
    }
}
