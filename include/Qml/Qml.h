// Copyright © 2016, Freiburg.
// Author: Markus Frey. All Rights Reserved.

#ifndef INCLUDE_QML_QML_H_
#define INCLUDE_QML_QML_H_

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <stdarg.h>

#include "Qml/Backend.h"

class Qml {
 public:
  Qml(int argc, char* argv[]);
  void run();

 private:
  QGuiApplication app;
  QQmlApplicationEngine engine;
  QQmlComponent mainComponent;

  Backend qmlBackend;
};

#endif  // INCLUDE_QML_QML_H_
