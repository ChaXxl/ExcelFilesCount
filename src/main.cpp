#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    // 设置应用图标
    app.setWindowIcon(QIcon(":/images/favicon.ico"));

    QQmlApplicationEngine engine;
    QObject::connect(
            &engine,
            &QQmlApplicationEngine::objectCreationFailed,
            &app,
            []() { QCoreApplication::exit(-1); },
            Qt::QueuedConnection);
    engine.loadFromModule("ExcelFilesCount", "Main");

    return app.exec();
}
