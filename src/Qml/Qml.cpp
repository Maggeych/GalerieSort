// Copyright © 2016, Freiburg.
// Author: Markus Frey. All Rights Reserved.

#include "Qml/Qml.h"

#include <QQuickWindow>
#include <QtQml>
#include <QtGui/QImageReader>
#include <string>
#include <iostream>
#include <vector>

// _____________________________________________________________________________
Qml::Qml(int argc, char* argv[]) : app(argc, argv), mainComponent(&engine) {

  engine.rootContext()->setContextProperty("backend", &qmlBackend);
  QStringList imageNameFilters;
  QMimeDatabase mimeDatabase;
  foreach (const QByteArray &m, QImageReader::supportedMimeTypes()) {
    foreach (const QString &suffix, mimeDatabase.mimeTypeForName(m).suffixes()) {
      imageNameFilters.append(QStringLiteral("*.") + suffix);
      imageNameFilters.append(QStringLiteral("*.") + suffix.toUpper());
    }
  }
  engine.rootContext()->setContextProperty("imageNameFilters",
      imageNameFilters);
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
