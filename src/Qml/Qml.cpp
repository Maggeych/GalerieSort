// Copyright © 2016, Freiburg.
// Author: Markus Frey. All Rights Reserved.

#include "Qml/Qml.h"

#include <QQuickWindow>
#include <QtQml>
#include <string>
#include <iostream>
#include <vector>

// _____________________________________________________________________________
Qml::Qml(int argc, char* argv[]) : app(argc, argv), mainComponent(&engine) {

  engine.rootContext()->setContextProperty("backend", &qmlBackend);
  mainComponent.loadUrl(QUrl::fromLocalFile("Qml/main.qml"));
  mainComponent.create();

  if (mainComponent.isError()) {
    std::cout << "Error in main.qml: "
      << qPrintable(mainComponent.errorString()) << std::endl;
  }
}

// _____________________________________________________________________________
void Qml::run() {
  app.exec();
}
