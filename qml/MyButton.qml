import QtQuick 2.0
import QtGraphicalEffects 1.0

//red
//green
//yellow

Rectangle {
    id: button
    property color activeBorderColor:   "#CCCCCC"
    property color passiveBorderColor:  "#202020"
    property color activeTextColor:     customColor.textColor
    property color passiveTextColor:   customColor.textColor
    property color activeLedColor:      customColor.red
    property color passiveLedColor:     customColor.green
    property bool hasPassiveLed: false
    property bool hasActiveLed: true
    property bool active;
    property bool isCheckable : false
    property string text: "Button"

    signal clicked;

    width: 150
    height: 40

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

    Text {
        id: buttonText
        text: button.text
        anchors.centerIn: parent
        font.pixelSize: parent.height - 12
        color: button.active ? button.activeTextColor : button.passiveTextColor
    }

    Rectangle {
        id: led
        color: button.active ? activeLedColor : passiveLedColor
        visible: button.active ? button.hasActiveLed : button.hasPassiveLed
        height: 10
        width: 10
        radius: 5
        anchors.verticalCenter: button.verticalCenter
        anchors.left: button.left
        anchors.leftMargin: 15

    }

    Glow {
        anchors.fill: led
        radius: 10
        samples: 17
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
