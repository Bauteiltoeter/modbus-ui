import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import qmlcontrol.standardpagecontroller 1.0

Grid {
    id: grid
    columns: 6
    anchors.centerIn: parent
    horizontalItemAlignment: Grid.AlignRight
    verticalItemAlignment: Grid.AlignVCenter
    spacing: 10

    StandardPageController {
        id: pc

        onSetCurrentPercentChanged:
        {
            console.log("Setting new current percentage");
          currentSlider.value = pc.setCurrentPercent
        }

        onSetPowerPercentChanged:
        {
            powerSlider.value = pc.setPowerPercent
        }

        onSetResistancePercentChanged: {
            resistanceSlider.value=pc.setResistancePercent
        }
    }

    //################################################
    //################################################
    //################################################

    MyText {
        text: "U:"
    }

    MyText {
        text: pc.latestVoltage //"5.00V"
    }

    Rectangle {
        width: 1
        height: 1
        color: customColor.background
    }

    Rectangle {
        width: 1
        height: 1
        color: customColor.background
    }

    Rectangle {
        width: 1
        height: 1
        color: customColor.background
    }

    Rectangle {
        width: 1
        height: 1
        color: customColor.background
    }


    //################################################
    //################################################
    //################################################

    MyText {
        text: "I:"
    }
    MyText {
        text: pc.latestCurrent

    }

    MyIconButton {
        hasActiveLed: true
        isCheckable: true
        activeLedColor: customColor.green
        activeBorderColor: customColor.green
        icon: ""
        text: "CC"
    }

    MyTextField {
        property bool hasChanges: false
        id: tfSetCurrent
        color: pc.setCurrentError ? customColor.red :  hasChanges? customColor.yellow :  customColor.textColor
        text: pc.setCurrent

        onTextChanged: {
            if(tfSetCurrent.focus)
                hasChanges=true
            pc.validateCurrent(tfSetCurrent.text)
        }

        onAccepted: {
            pc.setCurrent = text
            hasChanges=false
        }
    }

    MyIconButton {
        height: 40
        width: 40
        hasActiveLed: false
        hasPassiveLed: false
        isCheckable: false
        passiveBorderColor: tfSetCurrent.hasChanges ? customColor.yellow : customColor.borderColor
        icon: ""
        text: "OK"
        textSize: 20
        onClicked: {
            tfSetCurrent.hasChanges=false;
            pc.setCurrent=tfSetCurrent.text;
        }
    }



    MySlider {
        id: currentSlider
        from: 1


        value: pc.setCurrentPercent
        to: 100

        onValueChanged: {
          //  console.log("Slider value:"+value)
            pc.setCurrentPercent = value;
        }
    }


    //################################################
    //################################################
    //################################################

    MyText {
        text: "P:"
    }
    MyText {
        text: pc.latestPower


    }
    MyIconButton {
        hasActiveLed: true
        isCheckable: true
        activeLedColor: customColor.green
        activeBorderColor: customColor.green
        icon: ""
        text: "CP"
    }

    MyTextField {
        property bool hasChanges: false
        id: tfSetPower
        text: pc.setPower
        color: pc.setPowerError ? customColor.red :  hasChanges? customColor.yellow :  customColor.textColor

        onTextChanged: {
            if(tfSetPower.focus)
                hasChanges=true
            pc.validatePower(tfSetPower.text)
        }

        onAccepted: {
            pc.setPower = text
            hasChanges=false
        }
    }

    MyIconButton {
        height: 40
        width: 40
        hasActiveLed: false
        hasPassiveLed: false
        isCheckable: false
        passiveBorderColor: tfSetPower.hasChanges ? customColor.yellow : customColor.borderColor
        icon: ""
        text: "OK"
        textSize: 20
        onClicked: {
            tfSetPower.hasChanges=false;
            pc.setPower=tfSetPower.text;
        }
    }

    MySlider {
        id: powerSlider
        from: 1
        value: 25
        to: 100

        onValueChanged: {
           // console.log("Slider value:"+value)
            pc.setPowerPercent = value;
        }
    }

    //################################################
    //################################################
    //################################################

    MyText {
        text: "Ri:"
    }

    MyText {
        text: pc.latestResistance
    }
    MyIconButton {
        hasActiveLed: true
        isCheckable: true
        activeLedColor: customColor.green
        activeBorderColor: customColor.green
        icon: ""
        text: "CR"
    }

    MyTextField {
        property bool hasChanges: false
        id: tfSetResistance
        color: pc.setResistanceError ? customColor.red :  hasChanges? customColor.yellow :  customColor.textColor
        text: pc.setResistance

        onTextChanged: {
            if(tfSetResistance.focus)
                hasChanges=true
            pc.validateResistance(tfSetResistance.text)
        }

        onAccepted: {
            pc.setResistance = text
            hasChanges=false
        }
    }

    MyIconButton {
        height: 40
        width: 40
        hasActiveLed: false
        hasPassiveLed: false
        isCheckable: false
        passiveBorderColor: tfSetResistance.hasChanges ? customColor.yellow : customColor.borderColor
        icon: ""
        text: "OK"
        textSize: 20
        onClicked: {
            tfSetResistance.hasChanges=false;
            pc.setResistance=tfSetResistance.text;
        }
    }


    MySlider {
        id: resistanceSlider
        from: 1
        value: 25
        to: 100
        onValueChanged: {
         //   console.log("Slider value:"+value)
            pc.setResistancePercent = value;
        }
    }
}
