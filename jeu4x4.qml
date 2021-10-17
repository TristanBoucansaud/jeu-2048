import QtQuick 2.0

Item {
    id: jeu4x4

    Rectangle{
        x: 73
        y: 168
        width: 304
        height: 304
        color: "#666666"
        focus: true
        Keys.onPressed: {
            switch(event.key){
            case Qt.Key_Left:
                vueGrille.left();
                break;
            case Qt.Key_Right:
                vueGrille.right();
                break;
            case Qt.Key_Up:
                vueGrille.up();
                break;
            case Qt.Key_Down:
                vueGrille.down();
                break;
            }
            if (vueGrille.gameOver()){
                gameOver.visible=true
            }
        }

        Rectangle{
            id: case11
            width: 71
            height: 71
            x: 4
            y: 4
            color: vueGrille.colorQML[0][0]
            Text {
                id: text11
                text: vueGrille.gridQML[0][0]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case12
            width: 71
            height: 71
            x: 79
            y: 4
            color: vueGrille.colorQML[0][1]
            Text {
                id: text12
                text: vueGrille.gridQML[0][1]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case13
            width: 71
            height: 71
            x: 154
            y: 4
            color: vueGrille.colorQML[0][2]
            Text {
                id: text13
                text: vueGrille.gridQML[0][2]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case14
            width: 71
            height: 71
            x: 229
            y: 4
            color: vueGrille.colorQML[0][3]
            Text {
                id: text14
                text: vueGrille.gridQML[0][3]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }

        Rectangle{
            id: case21
            width: 71
            height: 71
            x: 4
            y: 79
            color: vueGrille.colorQML[1][0]
            Text {
                id: text21
                text: vueGrille.gridQML[1][0]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case22
            width: 71
            height: 71
            x: 79
            y: 79
            color: vueGrille.colorQML[1][1]
            Text {
                id: text22
                text: vueGrille.gridQML[1][1]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case23
            width: 71
            height: 71
            x: 154
            y: 79
            color: vueGrille.colorQML[1][2]
            Text {
                id: text23
                text: vueGrille.gridQML[1][2]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case24
            width: 71
            height: 71
            x: 229
            y: 79
            color: vueGrille.colorQML[1][3]
            Text {
                id: text24
                text: vueGrille.gridQML[1][3]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }

        Rectangle{
            id: case31
            width: 71
            height: 71
            x: 4
            y: 154
            color: vueGrille.colorQML[2][0]
            Text {
                id: text31
                text: vueGrille.gridQML[2][0]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case32
            width: 71
            height: 71
            x: 79
            y: 154
            color: vueGrille.colorQML[2][1]
            Text {
                id: text32
                text: vueGrille.gridQML[2][1]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case33
            width: 71
            height: 71
            x: 154
            y: 154
            color: vueGrille.colorQML[2][2]
            Text {
                id: text33
                text: vueGrille.gridQML[2][2]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }
        }
        Rectangle{
            id: case34
            width: 71
            height: 71
            x: 229
            y: 154
            color: vueGrille.colorQML[2][3]
            Text {
                id: text34
                text: vueGrille.gridQML[2][3]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }
        }

        Rectangle{
            id: case41
            width: 71
            height: 71
            x: 4
            y: 229
            color: vueGrille.colorQML[3][0]
            Text {
                id: text41
                text: vueGrille.gridQML[3][0]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case42
            width: 71
            height: 71
            x: 79
            y: 229
            color: vueGrille.colorQML[3][1]
            Text {
                id: text42
                text: vueGrille.gridQML[3][1]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case43
            width: 71
            height: 71
            x: 154
            y: 229
            color: vueGrille.colorQML[3][2]
            Text {
                id: text43
                text: vueGrille.gridQML[3][2]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }
        Rectangle{
            id: case44
            width: 71
            height: 71
            x: 229
            y: 229
            color: vueGrille.colorQML[3][3]
            Text {
                id: text44
                text: vueGrille.gridQML[3][3]
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 20
                font.family: "Verdana"
                color: "#000000"
            }

        }

    }
    Rectangle{
        id: score
        width: 170
        height: 100
        x:40
        y:25
        color: rectangleColor
        Text {
            id: textScore
            text: qsTr("Score :\n\n")+vueGrille.scoreQML
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 20
            font.family: "Verdana"
            color: presentationColor
        }
    }
    Rectangle{
        id: objectif
        width: 170
        height: 100
        x:240
        y:25
        color: rectangleColor
        Text {
            id: texteObjectif
            text: qsTr("Objectif :\n\n")+vueGrille.objectifQML
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 20
            font.family: "Verdana"
            color: presentationColor
        }
    }
    MouseArea{
        id: reset
        width: 170
        height: 38
        x:40
        y:492
        onClicked: vueGrille.reset(4)
        Rectangle{
            id: rectReset
            anchors.fill: parent
            color: rectangleColor
            Text {
                id: textReset
                text: qsTr("Réinitialiser")
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 16
                font.family: "Verdana"
                color: presentationColor
            }
        }
    }
    MouseArea{
        id: retourMenu
        width: 170
        height: 38
        x:240
        y:492
        onClicked: {
            menu.visible=true
            jeu4.visible=false
        }

        Rectangle{
            id: rectRetourMenu
            anchors.fill: parent
            color: rectangleColor
            Text {
                id: textRetourMenu
                text: qsTr("Retour menu")
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 16
                font.family: "Verdana"
                color: presentationColor
            }
        }
    }
    Window{
        id: gameOver
        visible: false
        color: "#cccccc"
        minimumWidth: 200
        minimumHeight: 100
        maximumWidth: 200
        maximumHeight: 100
        title: qsTr("GAME OVER")
        Text {
            id: textGameOver
            text: qsTr("GAME OVER")
            width: 200
            height: 60
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
            font.family: "Verdana"
            color: rectangleColor
        }
        MouseArea{
            id: quitterGameOver
            x: 50
            y: 60
            width: 100
            height: 30
            onClicked: {
                vueGrille.reset(4)
                gameOver.visible=false
            }

            Rectangle{
                id: rectQuitterGameOver
                anchors.fill: parent
                color: rectangleColor
                Text {
                    id: textQuitterGameOver
                    text: qsTr("Rejouer")
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 16
                    font.family: "Verdana"
                    color: presentationColor
                }
            }
        }
    }

}
