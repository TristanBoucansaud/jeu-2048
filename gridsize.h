#ifndef GRIDSIZE_H
#define GRIDSIZE_H
using namespace std;

#include <QObject>
#include <string>

class GridSize : public QObject //Une classe équivalente à un point (x, y) qui stocke le format pour l'afficher dans les paramètres
{
    Q_OBJECT
public:
    explicit GridSize(QObject *parent = nullptr, int x=4,int y=4 );
    Q_INVOKABLE void newCoor(int, int);     //Permet de modifier les valeurs de x et y
    Q_PROPERTY(QString sizeQML READ readGridSize NOTIFY newGridSize)    //Permet d'afficher le mode de jeu et de le mettre à jour
private:
    int x;
    int y;
    QString readGridSize();

signals:
    void newGridSize();
};

#endif // GRIDSIZE_H
