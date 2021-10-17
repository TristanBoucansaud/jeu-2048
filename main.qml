import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: menu
    visible: true
    color: "#ccc9c1"
    minimumWidth: 450
    minimumHeight: 550
    maximumWidth: 450
    maximumHeight: 550
    property alias presentationColor: presentation.color    //propriétés modifiables pour toute l'application
    property alias rectangleColor: rectangle.color
    property alias menuColor: menu.color
    title: qsTr("2048")


    Rectangle {
        id: rectangle   // Affichage du titre du jeu
        x: 25
        y: 40
        width: 400
        height: 60
        color: "#8e8164"

        Text {
            id: presentation
            color: "#e2dbcb"
            text: qsTr("BIENVENUE SUR CE 2048 !!")
            anchors.fill: parent
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Verdana"
        }
    }

    MouseArea {
        id: jouer   //Bouton jouer
        x: 75
        y: 150
        width: 300
        height: 50
        onClicked: {    //On vérifie sur quel mode de jeu on est réglé (4x4, 5x5 ou 6x6)
            if (vueGrille.sizeGrid()==4){
                jeu4.visible=true;
                menu.visible=false;
            }
            else if (vueGrille.sizeGrid()==5){
                jeu5.visible=true;
                menu.visible=false;
            }
            else if (vueGrille.sizeGrid()==6){
                jeu6.visible=true;
                menu.visible=false;
            }
        }

        Rectangle {
            id: rectJouer
            color: rectangleColor
            anchors.fill: parent

            Text {
                id: textJouer
                color: presentationColor
                text: qsTr("Jouer")
                anchors.fill: parent
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Verdana"
            }
        }
    }

    MouseArea {     //Bouton règles
        id: regles
        x: 75
        y: 250
        width: 300
        height: 50
        onClicked: {
            fen_regles.visible=true     //affiche la fenètre des règles et cache la fenêtre principale
            menu.visible=false
        }

        Rectangle {
            id: rectRegles
            color: rectangleColor
            anchors.fill: parent

            Text {
                id: textRegles
                color: presentationColor
                text: qsTr("Règles")
                anchors.fill: parent
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Verdana"
            }

        }
    }

    MouseArea {
        id: parametres      //Bouton paramètres
        x: 75
        y: 350
        width: 300
        height: 50
        onClicked: {
            fen_parametres.visible=true     //affiche la fenêtre paramètres et cache le menu
            menu.visible=false
        }

        Rectangle {
            id: rectParametres
            color: rectangleColor
            anchors.fill: parent

            Text {
                id: textParametres
                color: presentationColor
                text: qsTr("Paramètres")
                anchors.fill: parent
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Verdana"
            }
        }
    }

    MouseArea {
        id: quitter     //Quitte l'application
        x: 75
        y: 450
        width: 300
        height: 50
        onClicked: {
            menu.close()
        }

        Rectangle {
            id: rectQuitter
            color: rectangleColor
            anchors.fill: parent

            Text {
                id: textQuitter
                color: presentationColor
                text: qsTr("Quitter")
                anchors.fill: parent
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.family: "Verdana"
            }
        }
    }

    Window {
        id: fen_regles      //Fenêtre Règles
        minimumWidth: 450
        minimumHeight: 300
        maximumWidth: 450
        maximumHeight: 300
        visible: false
        color: menuColor
        title: qsTr("Règles du 2048")

        Rectangle {
            id: affRegles
            x: 25
            y: 10
            width: 400
            height: 245
            color: rectangleColor

            Text {
                id: reglement
                color: presentationColor        //affichage des règles dans un rectangle
                text: qsTr("Les règles sont les suivantes :\n
Utilisez les flèches pour faire bouger les cubes
vers un bord

Deux blocs adjacents de même valeur vont
s'additionner et fusionner

Des blocs de 2 ou 4 apparaissent à chaque fois

Atteignez un score de 2048 pour gagner
la partie !")
                anchors.fill: affRegles
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Verdana"
            }
        }
        MouseArea {
            id: quitterRegles   //Bouton pour quitter les règles et revenir au menu
            x: 175
            y: 265
            width: 100
            height: 25
            onClicked: {
                menu.visible=true
                fen_regles.visible=false
            }

            Rectangle {
                id: rectQuitterRegles
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textQuitterRegles
                    color: presentationColor
                    text: qsTr("Compris !")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }
    }

    Window {

        id: fen_parametres  //Fenêtre Paramètres
        minimumWidth: 400
        minimumHeight: 230
        maximumWidth: 400
        maximumHeight: 230
        visible: false
        color: menuColor
        title: qsTr("Paramètres du 2048")


        Text {
            id: textSize
            x: 200
            y: 30
            width: 0
            height: 0
            color: rectangleColor
            text: vueTailleGrille.sizeQML   //Texte qui récupère le mode de jeu actuel
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Verdana"
        }

        MouseArea {
            id: taille4     //Série de 3 boutons qui vont modifier le mode de jeu
            x: 40
            y: 60
            width: 100
            height: 30
            onClicked: {vueTailleGrille.newCoor(4,4)    //Règle le jeu sur du 4x4
                vueGrille.reset(4)}

            Rectangle {
                id: rectTaille4
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textTaille4
                    color: presentationColor
                    text: qsTr("4x4")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }

        MouseArea {
            id: taille5     //Deuxième bouton (5x5)
            x: 150
            y: 60
            width: 100
            height: 30
            onClicked: {vueTailleGrille.newCoor(5,5)
                vueGrille.reset(5)}

            Rectangle {
                id: rectTaille5
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textTaille5
                    color: presentationColor
                    text: qsTr("5x5")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }

        MouseArea {
            id: taille6     //Bouton 6x6
            x: 260
            y: 60
            width: 100
            height: 30
            onClicked: {vueTailleGrille.newCoor(6,6)
                vueGrille.reset(6)}

            Rectangle {
                id: rectTaille6
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textTaille6
                    color: presentationColor
                    text: qsTr("6x6")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }

        MouseArea {
            id: changerCouleur      //Change la couleur des rectangles et des textes sur des couleurs prédéfinies
            x: 80
            y: 120
            width: 240
            height: 30
            onClicked: {       //Constitue une ronde, on peut switcher entre 4 couleurs différentes
                if (rectangleColor=="#8e8164"){
                    rectangleColor="#70919C"
                    presentationColor="#B8DBE7"
                    menuColor="#CCD7DB"
                }
                else if (rectangleColor=="#70919c"){
                    rectangleColor="#80926C"
                    presentationColor="#D0E7B8"
                    menuColor="#CCD3C5"
                }
                else if (rectangleColor=="#80926c"){
                    rectangleColor="#AF4E4E"
                    presentationColor="#EAB4B4"
                    menuColor="#CCBBBB"
                }
                else{
                    menuColor="#CCC9C1"
                    rectangleColor="#8e8164"
                    presentationColor="#e2dbcb"
                }
            }

            Rectangle {
                id: rectCouleur
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textCouleur
                    color: presentationColor
                    text: qsTr("Changer la couleur")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }
        MouseArea {
            id: fermerParametres    //Bouton pour quitter les paramètres et revenir au menu
            x: 80
            y: 180
            width: 240
            height: 30
            onClicked: {
                menu.visible=true
                fen_parametres.visible=false
            }

            Rectangle {
                id: rectFermerParametres
                color: rectangleColor
                anchors.fill: parent

                Text {
                    id: textFermerParametres
                    color: presentationColor
                    text: qsTr("Fermer les paramètres")
                    anchors.fill: parent
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Verdana"
                }
            }
        }
    }

    // FENÊTRE DE JEU EN 4x4
    Window{

        id : jeu4
        visible: false
        color: menuColor
        minimumWidth: 450
        minimumHeight: 550
        maximumWidth: 450
        maximumHeight: 550
        title: qsTr("2048 : 4x4")


        Rectangle{
            x: 73
            y: 168
            width: 304
            height: 304
            color: "#666666"
            focus: true
            Keys.onPressed: {   //On paramètre dès maintenant les interactions avec les flèches
                switch(event.key){  //On cherche la touche pressée, on active la méthode associée
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
                if (vueGrille.gameOver()){  //Après quoi on vérifie si le jeu est terminé
                    gameOver.visible=true   //Si c'est le cas, on affiche la fenêtre de game over
                }
            }

            Rectangle{      //16 rectangles : cases du jeu, puisant leurs valeurs dans des QVector<QVector<...>>
                id: case11  //Case (1, 1), et ainsi de suite
                width: 71
                height: 71
                x: 4
                y: 4
                color: vueGrille.colorQML[0][0]   //Récupère la couleur de la case associé à sa valeur
                Text {
                    id: text11
                    text: vueGrille.gridQML[0][0]   //Récupère la valeur de la case
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

        } //Fin du paramétrage des cases du jeu
        Rectangle{
            id: score   //Affichage du score (somme de toutes les cases dans le jeu)
            width: 170
            height: 100
            x:40
            y:25
            color: rectangleColor
            Text {
                id: textScore
                text: qsTr("Score :\n\n")+vueGrille.scoreQML    //On récupère le score
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
            id: objectif    //Affichage de l'objectif suivant (prochain gros bloc à atteindre)
            width: 170
            height: 100
            x:240
            y:25
            color: rectangleColor
            Text {
                id: texteObjectif
                text: qsTr("Objectif :\n\n")+vueGrille.objectifQML  //On récupère l'objectif
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
            id: reset   //Bouton RESET en bas, pour réinitialiser le jeu et relancer une partie
            width: 170
            height: 38
            x:40
            y:492
            onClicked: vueGrille.reset(4)   //Reset du jeu en 4x4
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
            id: retourMenu      //Bouton de retour au menu : ne reset pas le jeu !
            width: 170
            height: 38
            x:240
            y:492
            onClicked: {
                menu.visible=true       //Cache le jeu et affiche le menu
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
        Window{     //Fenêtre de Game Over associée au jeu 4x4
            id: gameOver
            visible: false
            color: menuColor
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
                id: quitterGameOver     //Bouton pour quitter le Game Over et reset le jeu
                x: 50
                y: 60
                width: 100
                height: 30
                onClicked: {
                    vueGrille.reset(4)      //reset automatique du jeu
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

    // FENÊTRE DU JEU EN 5x5 : exactement le même fonctionnement qu'en 4x4 (pas d'autres commentaires ici)
    Window{

        id : jeu5
        visible: false
        color: menuColor
        minimumWidth: 450
        minimumHeight: 550
        maximumWidth: 450
        maximumHeight: 550
        title: qsTr("2048 : 5x5")


        Rectangle{
            x: 73
            y: 168
            width: 303
            height: 303
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
                    gameOver5.visible=true
                }
            }

            Rectangle{
                id: case511
                width: 57
                height: 57
                x: 3
                y: 3
                color: vueGrille.colorQML[0][0]
                Text {
                    id: text511
                    text: vueGrille.gridQML[0][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case512
                width: 57
                height: 57
                x: 63
                y: 3
                color: vueGrille.colorQML[0][1]
                Text {
                    id: text512
                    text: vueGrille.gridQML[0][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case513
                width: 57
                height: 57
                x: 123
                y: 3
                color: vueGrille.colorQML[0][2]
                Text {
                    id: text513
                    text: vueGrille.gridQML[0][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case514
                width: 57
                height: 57
                x: 183
                y: 3
                color: vueGrille.colorQML[0][3]
                Text {
                    id: text514
                    text: vueGrille.gridQML[0][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case515
                width: 57
                height: 57
                x: 243
                y: 3
                color: vueGrille.colorQML[0][4]
                Text {
                    id: text515
                    text: vueGrille.gridQML[0][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }

            Rectangle{
                id: case521
                width: 57
                height: 57
                x: 3
                y: 63
                color: vueGrille.colorQML[1][0]
                Text {
                    id: text521
                    text: vueGrille.gridQML[1][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case522
                width: 57
                height: 57
                x: 63
                y: 63
                color: vueGrille.colorQML[1][1]
                Text {
                    id: text522
                    text: vueGrille.gridQML[1][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case523
                width: 57
                height: 57
                x: 123
                y: 63
                color: vueGrille.colorQML[1][2]
                Text {
                    id: text523
                    text: vueGrille.gridQML[1][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case524
                width: 57
                height: 57
                x: 183
                y: 63
                color: vueGrille.colorQML[1][3]
                Text {
                    id: text524
                    text: vueGrille.gridQML[1][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case525
                width: 57
                height: 57
                x: 243
                y: 63
                color: vueGrille.colorQML[1][4]
                Text {
                    id: text525
                    text: vueGrille.gridQML[1][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }

            Rectangle{
                id: case531
                width: 57
                height: 57
                x: 3
                y: 123
                color: vueGrille.colorQML[2][0]
                Text {
                    id: text531
                    text: vueGrille.gridQML[2][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case532
                width: 57
                height: 57
                x: 63
                y: 123
                color: vueGrille.colorQML[2][1]
                Text {
                    id: text532
                    text: vueGrille.gridQML[2][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case533
                width: 57
                height: 57
                x: 123
                y: 123
                color: vueGrille.colorQML[2][2]
                Text {
                    id: text533
                    text: vueGrille.gridQML[2][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case534
                width: 57
                height: 57
                x: 183
                y: 123
                color: vueGrille.colorQML[2][3]
                Text {
                    id: text534
                    text: vueGrille.gridQML[2][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case535
                width: 57
                height: 57
                x: 243
                y: 123
                color: vueGrille.colorQML[2][4]
                Text {
                    id: text535
                    text: vueGrille.gridQML[2][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

            Rectangle{
                id: case541
                width: 57
                height: 57
                x: 3
                y: 183
                color: vueGrille.colorQML[3][0]
                Text {
                    id: text541
                    text: vueGrille.gridQML[3][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case542
                width: 57
                height: 57
                x: 63
                y: 183
                color: vueGrille.colorQML[3][1]
                Text {
                    id: text542
                    text: vueGrille.gridQML[3][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case543
                width: 57
                height: 57
                x: 123
                y: 183
                color: vueGrille.colorQML[3][2]
                Text {
                    id: text543
                    text: vueGrille.gridQML[3][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case544
                width: 57
                height: 57
                x: 183
                y: 183
                color: vueGrille.colorQML[3][3]
                Text {
                    id: text544
                    text: vueGrille.gridQML[3][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case545
                width: 57
                height: 57
                x: 243
                y: 183
                color: vueGrille.colorQML[3][4]
                Text {
                    id: text545
                    text: vueGrille.gridQML[3][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case551
                width: 57
                height: 57
                x: 3
                y: 243
                color: vueGrille.colorQML[4][0]
                Text {
                    id: text551
                    text: vueGrille.gridQML[4][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case552
                width: 57
                height: 57
                x: 63
                y: 243
                color: vueGrille.colorQML[4][1]
                Text {
                    id: text552
                    text: vueGrille.gridQML[4][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case553
                width: 57
                height: 57
                x: 123
                y: 243
                color: vueGrille.colorQML[4][2]
                Text {
                    id: text553
                    text: vueGrille.gridQML[4][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case554
                width: 57
                height: 57
                x: 183
                y: 243
                color: vueGrille.colorQML[4][3]
                Text {
                    id: text554
                    text: vueGrille.gridQML[4][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case555
                width: 57
                height: 57
                x: 243
                y: 243
                color: vueGrille.colorQML[4][4]
                Text {
                    id: text555
                    text: vueGrille.gridQML[4][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 17
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

        }
        Rectangle{
            id: score5
            width: 170
            height: 100
            x:40
            y:25
            color: rectangleColor
            Text {
                id: textScore5
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
            id: objectif5
            width: 170
            height: 100
            x:240
            y:25
            color: rectangleColor
            Text {
                id: texteObjectif5
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
            id: reset5
            width: 170
            height: 38
            x:40
            y:492
            onClicked: vueGrille.reset(5)
            Rectangle{
                id: rectReset5
                anchors.fill: parent
                color: rectangleColor
                Text {
                    id: textReset5
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
            id: retourMenu5
            width: 170
            height: 38
            x:240
            y:492
            onClicked: {
                menu.visible=true
                jeu5.visible=false
            }

            Rectangle{
                id: rectRetourMenu5
                anchors.fill: parent
                color: rectangleColor
                Text {
                    id: textRetourMenu5
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
            id: gameOver5
            visible: false
            color: menuColor
            minimumWidth: 200
            minimumHeight: 100
            maximumWidth: 200
            maximumHeight: 100
            title: qsTr("GAME OVER")
            Text {
                id: textGameOver5
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
                id: quitterGameOver5
                x: 50
                y: 60
                width: 100
                height: 30
                onClicked: {
                    vueGrille.reset(5)
                    gameOver5.visible=false
                }

                Rectangle{
                    id: rectQuitterGameOver5
                    anchors.fill: parent
                    color: rectangleColor
                    Text {
                        id: textQuitterGameOver5
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

    // FENÊTRE DU JEU EN 6x6 : toujours pareil
    Window{

        id : jeu6
        visible: false
        color: menuColor
        minimumWidth: 450
        minimumHeight: 550
        maximumWidth: 450
        maximumHeight: 550
        title: qsTr("2048 : 6x6")


        Rectangle{
            x: 74
            y: 169
            width: 302
            height: 302
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
                    gameOver6.visible=true
                }
            }

            Rectangle{
                id: case611
                width: 48
                height: 48
                x: 2
                y: 2
                color: vueGrille.colorQML[0][0]
                Text {
                    id: text611
                    text: vueGrille.gridQML[0][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case612
                width: 48
                height: 48
                x: 52
                y: 2
                color: vueGrille.colorQML[0][1]
                Text {
                    id: text612
                    text: vueGrille.gridQML[0][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case613
                width: 48
                height: 48
                x: 102
                y: 2
                color: vueGrille.colorQML[0][2]
                Text {
                    id: text613
                    text: vueGrille.gridQML[0][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case614
                width: 48
                height: 48
                x: 152
                y: 2
                color: vueGrille.colorQML[0][3]
                Text {
                    id: text614
                    text: vueGrille.gridQML[0][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case615
                width: 48
                height: 48
                x: 202
                y: 2
                color: vueGrille.colorQML[0][4]
                Text {
                    id: text615
                    text: vueGrille.gridQML[0][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }

            Rectangle{
                id: case616
                width: 48
                height: 48
                x: 252
                y: 2
                color: vueGrille.colorQML[0][5]
                Text {
                    id: text616
                    text: vueGrille.gridQML[0][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }

            Rectangle{
                id: case621
                width: 48
                height: 48
                x: 2
                y: 52
                color: vueGrille.colorQML[1][0]
                Text {
                    id: text621
                    text: vueGrille.gridQML[1][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case622
                width: 48
                height: 48
                x: 52
                y: 52
                color: vueGrille.colorQML[1][1]
                Text {
                    id: text622
                    text: vueGrille.gridQML[1][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case623
                width: 48
                height: 48
                x: 102
                y: 52
                color: vueGrille.colorQML[1][2]
                Text {
                    id: text623
                    text: vueGrille.gridQML[1][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case624
                width: 48
                height: 48
                x: 152
                y: 52
                color: vueGrille.colorQML[1][3]
                Text {
                    id: text624
                    text: vueGrille.gridQML[1][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case625
                width: 48
                height: 48
                x: 202
                y: 52
                color: vueGrille.colorQML[1][4]
                Text {
                    id: text625
                    text: vueGrille.gridQML[1][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case626
                width: 48
                height: 48
                x: 252
                y: 52
                color: vueGrille.colorQML[1][5]
                Text {
                    id: text626
                    text: vueGrille.gridQML[1][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }

            Rectangle{
                id: case631
                width: 48
                height: 48
                x: 2
                y: 102
                color: vueGrille.colorQML[2][0]
                Text {
                    id: text631
                    text: vueGrille.gridQML[2][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case632
                width: 48
                height: 48
                x: 52
                y: 102
                color: vueGrille.colorQML[2][1]
                Text {
                    id: text632
                    text: vueGrille.gridQML[2][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case633
                width: 48
                height: 48
                x: 102
                y: 102
                color: vueGrille.colorQML[2][2]
                Text {
                    id: text633
                    text: vueGrille.gridQML[2][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case634
                width: 48
                height: 48
                x: 152
                y: 102
                color: vueGrille.colorQML[2][3]
                Text {
                    id: text634
                    text: vueGrille.gridQML[2][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case635
                width: 48
                height: 48
                x: 202
                y: 102
                color: vueGrille.colorQML[2][4]
                Text {
                    id: text635
                    text: vueGrille.gridQML[2][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case636
                width: 48
                height: 48
                x: 252
                y: 102
                color: vueGrille.colorQML[2][5]
                Text {
                    id: text636
                    text: vueGrille.gridQML[2][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

            Rectangle{
                id: case641
                width: 48
                height: 48
                x: 2
                y: 152
                color: vueGrille.colorQML[3][0]
                Text {
                    id: text641
                    text: vueGrille.gridQML[3][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case642
                width: 48
                height: 48
                x: 52
                y: 152
                color: vueGrille.colorQML[3][1]
                Text {
                    id: text642
                    text: vueGrille.gridQML[3][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case643
                width: 48
                height: 48
                x: 102
                y: 152
                color: vueGrille.colorQML[3][2]
                Text {
                    id: text643
                    text: vueGrille.gridQML[3][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case644
                width: 48
                height: 48
                x: 152
                y: 152
                color: vueGrille.colorQML[3][3]
                Text {
                    id: text644
                    text: vueGrille.gridQML[3][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case645
                width: 48
                height: 48
                x: 202
                y: 152
                color: vueGrille.colorQML[3][4]
                Text {
                    id: text645
                    text: vueGrille.gridQML[3][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case646
                width: 48
                height: 48
                x: 252
                y: 152
                color: vueGrille.colorQML[3][5]
                Text {
                    id: text646
                    text: vueGrille.gridQML[3][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

            Rectangle{
                id: case651
                width: 48
                height: 48
                x: 2
                y: 202
                color: vueGrille.colorQML[4][0]
                Text {
                    id: text651
                    text: vueGrille.gridQML[4][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case652
                width: 48
                height: 48
                x: 52
                y: 202
                color: vueGrille.colorQML[4][1]
                Text {
                    id: text652
                    text: vueGrille.gridQML[4][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case653
                width: 48
                height: 48
                x: 102
                y: 202
                color: vueGrille.colorQML[4][2]
                Text {
                    id: text653
                    text: vueGrille.gridQML[4][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case654
                width: 48
                height: 48
                x: 152
                y: 202
                color: vueGrille.colorQML[4][3]
                Text {
                    id: text654
                    text: vueGrille.gridQML[4][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case655
                width: 48
                height: 48
                x: 202
                y: 202
                color: vueGrille.colorQML[4][4]
                Text {
                    id: text655
                    text: vueGrille.gridQML[4][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case656
                width: 48
                height: 48
                x: 252
                y: 202
                color: vueGrille.colorQML[4][5]
                Text {
                    id: text656
                    text: vueGrille.gridQML[4][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

            Rectangle{
                id: case661
                width: 48
                height: 48
                x: 2
                y: 252
                color: vueGrille.colorQML[5][0]
                Text {
                    id: text661
                    text: vueGrille.gridQML[5][0]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case662
                width: 48
                height: 48
                x: 52
                y: 252
                color: vueGrille.colorQML[5][1]
                Text {
                    id: text662
                    text: vueGrille.gridQML[5][1]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case663
                width: 48
                height: 48
                x: 102
                y: 252
                color: vueGrille.colorQML[5][2]
                Text {
                    id: text663
                    text: vueGrille.gridQML[5][2]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }

            }
            Rectangle{
                id: case664
                width: 48
                height: 48
                x: 152
                y: 252
                color: vueGrille.colorQML[5][3]
                Text {
                    id: text664
                    text: vueGrille.gridQML[5][3]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case665
                width: 48
                height: 48
                x: 202
                y: 252
                color: vueGrille.colorQML[5][4]
                Text {
                    id: text665
                    text: vueGrille.gridQML[5][4]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }
            Rectangle{
                id: case666
                width: 48
                height: 48
                x: 252
                y: 252
                color: vueGrille.colorQML[5][5]
                Text {
                    id: text666
                    text: vueGrille.gridQML[5][5]
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 14
                    font.family: "Verdana"
                    color: "#000000"
                }
            }

        }
        Rectangle{
            id: score6
            width: 170
            height: 100
            x:40
            y:25
            color: rectangleColor
            Text {
                id: textScore6
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
            id: objectif6
            width: 170
            height: 100
            x:240
            y:25
            color: rectangleColor
            Text {
                id: texteObjectif6
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
            id: reset6
            width: 170
            height: 38
            x:40
            y:492
            onClicked: vueGrille.reset(6)
            Rectangle{
                id: rectReset6
                anchors.fill: parent
                color: rectangleColor
                Text {
                    id: textReset6
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
            id: retourMenu6
            width: 170
            height: 38
            x:240
            y:492
            onClicked: {
                menu.visible=true
                jeu6.visible=false
            }

            Rectangle{
                id: rectRetourMenu6
                anchors.fill: parent
                color: rectangleColor
                Text {
                    id: textRetourMenu6
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
            id: gameOver6
            visible: false
            color: menuColor
            minimumWidth: 200
            minimumHeight: 100
            maximumWidth: 200
            maximumHeight: 100
            title: qsTr("GAME OVER")
            Text {
                id: textGameOver6
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
                id: quitterGameOver6
                x: 50
                y: 60
                width: 100
                height: 30
                onClicked: {
                    vueGrille.reset(6)
                    gameOver6.visible=false
                }

                Rectangle{
                    id: rectQuitterGameOver6
                    anchors.fill: parent
                    color: rectangleColor
                    Text {
                        id: textQuitterGameOver6
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
}


