#include "grid.h"
using namespace std;
#include <iostream>
#include <string>
#include <vector>
#include <random>

int newCaseRoll(){  //fonction aléatoire retournant 2 ou 4 en fonction d'une proba définie (ici 0.9)
    double a=(double)rand()/RAND_MAX;
    if (a<0.9) return 2;
    else return 4;
}

string defineColor(int k){  //fonciton permettant de trouver la couleur associée à une valeur
    switch(k){
    case 0:
        return("#CCCCCC");
    case 2:
        return("#F1EADF");
    case 4:
        return("#E9D28E");
    case 8:
        return("#F1BD73");
    case 16:
        return("#E9941B");
    case 32:
        return("#F76A31");
    case 64:
        return("#FF3D1B");
    case 128:
        return("#FFEA59");
    case 256:
        return("#FFE73D");
    case 512:
        return("#FFE424");
    case 1024:
        return("#FFE214");
    case 2048:
        return("#FFE000");
    }
    return("#FFE000");  //même couleur pour toutes les cases supérieures à 2048
}

Grid::Grid(QObject *parent, int taille) : QObject(parent)   //Création du tableau (ne sert qu'au démarrage de l'app)
{
    for(int i=0; i<taille; i++){
        QVector<int> L;
        QVector<QString> M;
        for(int j=0; j<taille; j++){
            L.push_back(0);
            M.push_back(QString("#CCCCCC"));
        }
        tableau.push_back(L);
        tableauCouleurs.push_back(M);
    }
    int xa=rand()%taille;
    int ya=rand()%taille;
    int xb, yb;
    do{xb=rand()%taille;yb=rand()%taille;}
    while (xa==xb && ya==yb);
    tableau[xa][xb]=newCaseRoll();
    tableau[xb][yb]=newCaseRoll();
    this->majCouleurs();
    gridChanged();
}

void Grid::reset(int taille){   //même chose que le constructeur, mais pour réinitialiser à la taille souhaitée
    tableau.clear();    //On vide d'abord le tableau
    for(int i=0; i<taille; i++){    //On y rajoute des cases nulles, pour définir les cases du tableau
        QVector<int> L;
        QVector<QString> M;             //pareil pour les couleurs, on rajoute des cases "grises"
        for(int j=0; j<taille; j++){
            L.push_back(0);
            M.push_back(QString("#CCCCCC"));
        }
        tableau.push_back(L);
        tableauCouleurs.push_back(M);
    }
    int xa=rand()%taille;   //On défini une première case à ajouter
    int ya=rand()%taille;
    int xb, yb;
    do{xb=rand()%taille;yb=rand()%taille;}  //On en défini une deuxième
    while (xa==xb && ya==yb);   //et on réitère jusqu'à ce qu'on en ai généré une différente de la première
    tableau[xa][ya]=newCaseRoll();  //On rentre ces deux nouveaux blocs dans le tableau
    tableau[xb][yb]=newCaseRoll();
    this->majCouleurs();    //On met à jour les couleurs
    scoreChanged();     //et on active tous les signaux pour maj l'affichage de l'app
    objectifChanged();
    gridChanged();
}

void Grid::majCouleurs(){
    if (tableau.size()==tableauCouleurs.size()){    //Si les tailles correspondent,
        for(int i=0;i<tableau.size();i++){          //on récupère les couleurs correspondantes à chaque case
            for(int j=0; j<tableau.size(); j++){
                tableauCouleurs[i][j]=QString::fromStdString(defineColor(tableau[i][j]));
            }
        }
    }
    else{   //cas où le tableau de jeu a été réinitialisé, on recréée le tableau des couleurs
        tableauCouleurs.clear();
        for(int i=0;i<tableau.size();i++){
            QVector<QString> L;
            for(int j=0; j<tableau.size(); j++){
                L.push_back(QString::fromStdString(defineColor(tableau[i][j])));
            }
            tableauCouleurs.push_back(L);
        }
    }
    colorChanged();     //signal de changement des couleurs pour maj l'affichage de l'app
}

void Grid::left(){      //bouton flèche gauche
    QVector<QVector<int>> L=tableau;    //On recopie le tableau de jeu initial
    int taille=tableau[0].size();
    for(int i=0; i<tableau.size();i++){     //on traîte les cases ligne par ligne
        tableau[i].removeAll(0);    //on enlève tous les 0
        int k=0;
        while (k<tableau[i].size()-1){  //et on avance DE GAUCHE A DROITE, en fusionnant deux cases égales adjacentes
            if (tableau[i][k]==tableau[i][k+1]){    //si c'est le cas
                tableau[i][k]*=2;   //on double la case k
                tableau[i].removeAt(k+1);   //et on supprime la case k+1
            }
            k++;    //puis on incrémente de 1 dans tous les cas
        }
        while (tableau[i].size()<taille){   //et on rajoute enfin des 0 (cases vides) pour compléter le tableau
            tableau[i].push_back(0);
        }
    }
    if (tableau!=L){     //On veut rajouter un nouveau bloc, mais on le fait que si le tableau a changé !
        this->newCase();    //ajoute une nouvelle case
    }
    this->majCouleurs();    //maj des couleurs
    scoreChanged();     //et activation des signaux
    objectifChanged();
    gridChanged();
}

void Grid::right(){     //bouton flèche droite : même fonctionnement que flèche gauche...
    QVector<QVector<int>> L=tableau;
    int taille=tableau[0].size();
    for(int i=0; i<tableau.size();i++){
        tableau[i].removeAll(0);
        int k=tableau[i].size()-1;
        while (k>0){    //... à la seule différence qu'on va de DROITE A GAUCHE
            if (tableau[i][k]==tableau[i][k-1]){    //si deux cases sont égales
                tableau[i][k]*=2;   //on double la case k
                tableau[i].removeAt(k-1);   //on supprime la case k-1
                k--;    //et on se place à la case k-1, car la case k qu'on étudiait a été décalée en k-1 (on la suit)
            }
            k--;    //dans tous les cas, on incrémente de -1
        }
        while (tableau[i].size()<taille){
            tableau[i].push_front(0);
        }
    }
    if (tableau!=L){
        this->newCase();
    }
    this->majCouleurs();
    scoreChanged();
    objectifChanged();
    gridChanged();
}

void Grid::up(){    //bouton flèche du haut
    this->transpose();  //on transpose notre tableau
    this->left();   //maintenant, flèche du haut sur le tableau de base correspond à flèche de gauche sur ce tableau !
    this->transpose();  //et on remet dans le bon ordre
    this->majCouleurs();    //maj des couleurs (de nouveau car déjà faite dans left() )
    colorChanged();
    gridChanged();
}

void Grid::down(){  //bouton flèche du bas
    this->transpose();
    this->right();  //équivalent à flèche de droite ici
    this->transpose();
    this->majCouleurs();
    colorChanged();
    gridChanged();
}

void Grid::newCase(){   //génère un nouveau bloc aléatoirement
    vector<vector<int>> nuls;   //va venir stocker les coordonnées libres
    for(int i=0; i<tableau.size();i++){
        for(int j=0; j<tableau.size(); j++){
            if (tableau[i][j]==0){  //dès qu'on trouve une case nulle,
                vector<int> caseNulle={i,j};    //on récupère les coordonnées,
                nuls.push_back(caseNulle);      //et on les stocke dans notre vecteur nuls
            }
        }
    }
    int a=rand()%nuls.size();   //on prend une case au hasard dans cette liste de coordonnées
    tableau[nuls[a][0]][nuls[a][1]]=newCaseRoll();  //et on lui rajoute un bloc généré aléatoirement
}

int Grid::score(){  //calcule le score : attention, méthode différente du vrai jeu, on calcule juste la somme des blocs
    int S=0;    //simple fonction de sommation
    for (int i=0; i<tableau.size(); i++){
        for (int j=0; j<tableau.size(); j++){
            S+=tableau[i][j];
        }
    }
    return(S);
}

int Grid::objectif(){   //calcule l'objectif suivant (prochain plus gros bloc à former)
    int maxi=tableau[0][0]; //simple programme de recherche du maximum...
    for (int i=0; i<tableau.size(); i++){
        for (int j=0; j<tableau.size(); j++){
            if (tableau[i][j]>maxi){
                maxi=tableau[i][j];
            }
        }
    }
    return(maxi*2); //... qu'on multiplie par 2 pour trouver le prochain objectif !
}

bool Grid::gameOver(){  //recherche si le jeu n'a plus d'issues
    for (int i=0; i<tableau.size();i++){    //on étudie toutes les lignes horizontales...
        for (int j=0; j<tableau.size()-1;j++){
            if (tableau[i][j]==0 || tableau[i][j+1]==0 || tableau[i][j]==tableau[i][j+1]){  //si on trouve un zéro ou deux cases adjacentes égales
                return(false);  //c'est qu'on a une option de jeu, on retourne false directement
            }
        }
    }
    this->transpose();  //on va étudier les lignes verticales, donc on transpose et on réitère
    for (int i=0; i<tableau.size();i++){    //pareil qu'au dessus
        for (int j=0; j<tableau.size()-1;j++){
            if (tableau[i][j]==0 || tableau[i][j+1]==0 || tableau[i][j]==tableau[i][j+1]){
                this->transpose();
                return(false);
            }
        }
    }
    this->transpose();  //on oublie pas de remettre dans le bon sens
    return true;    //si on a trouvé aucune option de jeu, on retourne true : le jeu est fini
}

QVector<QVector<int>> Grid::readGrid() {    //retourne le tableau sous forme de QVector<QVector>int>>, qui récepte les signaux
    QVector<QVector<int>> L=tableau;    //mais on doit retourner un tableau 6x6 pour ne pas causer d'erreurs
    if (tableau.size()==4){
        for (int i=0; i<tableau.size(); i++){
            L[i].push_back(0);
            L[i].push_back(0);
        }
        L.push_back(QVector<int>({0,0,0,0,0,0}));
        L.push_back(QVector<int>({0,0,0,0,0,0}));
    }
    if (tableau.size()==5){
        for (int i=0; i<tableau.size(); i++){
            L[i].push_back(0);
        }
        L.push_back(QVector<int>({0,0,0,0,0,0}));
    }
    return (L);
}

QVector<QVector<QString>> Grid::readColor(){    //retourne le tableau des couleurs sous forme QVector<QVector<QString>> (QString et pas string pour réceptionner les signaux)
    QVector<QVector<QString>> L=tableauCouleurs;    //mais on doit retourner un tableau 6x6 pour ne pas causer d'erreurs
    if (tableauCouleurs.size()==4){
        for (int i=0; i<tableauCouleurs.size(); i++){
            L[i].push_back(QString("#cccccc"));
            L[i].push_back(QString("#cccccc"));
        }
        L.push_back(QVector<QString>({QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc")}));
        L.push_back(QVector<QString>({QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc")}));
    }
    if (tableauCouleurs.size()==5){
        for (int i=0; i<tableauCouleurs.size(); i++){
            L[i].push_back(QString("#cccccc"));
        }
        L.push_back(QVector<QString>({QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc"),QString("#cccccc")}));
    }
    return(L);
}

QString Grid::readScore(){  //retourne le score sous forme QString
    return QString::number(this->score());
}

QString Grid::readObjectif(){   //retourne l'objectif sous forme QString
    return QString::number(this->objectif());
}

int Grid::sizeGrid(){   //récupère le format du tableau
    return(tableau.size());
}

void Grid::transpose(){     //Transpose le tableau de jeu
    QVector<QVector<int>> L;    //on crée une liste vite
    for(int i=0; i<tableau.size(); i++){
        QVector<int> ligne;
        for(int j=0; j<tableau.size(); j++){    //On recopie le tableau, en inversant les indices
            ligne.push_back(tableau[j][i]);
        }
        L.push_back(ligne);
    }
    tableau=L;  //L est la transposée de tableau : on remplace tableau par L
}

