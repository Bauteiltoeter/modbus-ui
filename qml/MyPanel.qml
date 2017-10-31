import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: button


    signal clicked;

    width: 150
    height: 40

    radius: 10
    border.color: customColor.borderColor
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
}
