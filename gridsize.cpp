#include "gridsize.h"
using namespace std;
#include <string>

GridSize::GridSize(QObject *parent, int x1, int y1) : QObject(parent)
{
    x=x1;
    y=y1;
    newGridSize();
}

void GridSize::newCoor(int nx, int ny){
    x=nx;
    y=ny;
    newGridSize();
}

QString GridSize::readGridSize() {
    return (QString("Taille de la grille : ")+QString::number(x)+QString("x")+QString::number(y));
}   //On renvoie un QString pour être directement compatible avec ce que lit Qt
