#ifndef GRID_H
#define GRID_H
using namespace std;

#include <QObject>
#include <string>
#include <vector>

class Grid : public QObject //Cette classe stocke la grille de jeu ET la grille des couleurs du jeu
{
    Q_OBJECT
public:
    explicit Grid(QObject *parent = nullptr, int taille=4);
    Q_INVOKABLE void reset(int taille); //reset le jeu avec la taille souhaitée
    Q_INVOKABLE int score();    //calcule le score du jeu
    Q_INVOKABLE int objectif(); //calcule l'objectif suivant
    Q_INVOKABLE void left();    //méthode associée à la touche gauche
    Q_INVOKABLE void right();   //... droite
    Q_INVOKABLE void up();      //... haut
    Q_INVOKABLE void down();    //... bas
    Q_INVOKABLE bool gameOver();    //renvoie true si le jeu n'a plus d'issues
    Q_INVOKABLE int sizeGrid();     //renvoie la taille de la grille
    Q_PROPERTY(QVector<QVector<int>> gridQML READ readGrid NOTIFY gridChanged)  //renvoie la grille de jeu à jour
    Q_PROPERTY(QVector<QVector<QString>> colorQML READ readColor NOTIFY colorChanged)   //... grille des couleurs à jour
    Q_PROPERTY(QString scoreQML READ readScore NOTIFY scoreChanged)     //... le score
    Q_PROPERTY(QString objectifQML READ readObjectif NOTIFY objectifChanged)    //... l'objectif
private:
    QVector<QVector<int>> tableau;  //variable du tableau de jeu
    QVector<QVector<QString>> tableauCouleurs;  //variable du tableau des couleurs
    QVector<QVector<int>> readGrid();
    QVector<QVector<QString>> readColor();
    QString readScore();
    QString readObjectif();
    void transpose();       //transpose le tableau de jeu
    void newCase();     //génère une nouvelle case parmi les cases vides
    void majCouleurs();     //met à jour le tableau des couleurs


signals:
    void gridChanged();
    void colorChanged();
    void scoreChanged();
    void objectifChanged();
};

#endif // GRID_H
