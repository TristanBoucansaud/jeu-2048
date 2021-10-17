import QtQuick 2.0

Item {
    property alias CasesColor: rectCases.color
    MouseArea{
        id: cases
        width: 96
        height: 96
        Rectangle{
            id: rectCases
            anchors.fill: parent
            color: "#cccccc"
        }
    }
}
