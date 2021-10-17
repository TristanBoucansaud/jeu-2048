#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "grid.h"
#include "gridsize.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    GridSize tailleGrille;  //Crée l'objet qui stocke la taille de la grille
    Grid grille;    //Crée l'objet qui stocke la grille

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("vueTailleGrille", &tailleGrille); //Permet d'accéder aux fonctions de tailleGrille
    engine.rootContext()->setContextProperty("vueGrille", &grille); //Permet d'accéder aux fonctions de Grille
    engine.load(url);

    return app.exec();
}
