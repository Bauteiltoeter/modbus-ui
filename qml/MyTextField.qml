import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4


TextField {
    height: 40
    width: 150

    color: customColor.textColor
    font.pixelSize: 27


    background: MyPanel {
        height: parent.height
        width: parent.width
    }




}
