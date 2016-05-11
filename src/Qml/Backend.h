// Copyright © 2016, Freiburg.
// Author: Markus Frey. All Rights Reserved.

#ifndef SRC_QML_BACKEND_H_
#define SRC_QML_BACKEND_H_

#include <QObject>
#include <QString>

class Backend : public QObject {
  Q_OBJECT
  // Q_PROPERTY(QVariant myProperty READ getMyProperty
  //     NOTIFY myProperty Changed)
 public:
  Backend();
  virtual ~Backend();
  Q_INVOKABLE void doStuff();

 public slots:
  void dataIReceive(QString str, ushort sh);
 signals:
  void signalISend(QString str, ushort sh);
};

#endif  // SRC_QML_BACKEND_H_
