// Copyright © 2016, Freiburg.
// Author: Markus Frey. All Rights Reserved.

#include "Qml/Backend.h"

// _____________________________________________________________________________
Backend::Backend() : QObject() {
}

// _____________________________________________________________________________
Backend::~Backend() {
}

// _____________________________________________________________________________
void Backend::doStuff() {
}

// _____________________________________________________________________________
void Backend::dataIReceive(QString str, ushort sh) {
  str += "do your thing";
  sh += 1;
  emit signalISend(str, sh);
}
