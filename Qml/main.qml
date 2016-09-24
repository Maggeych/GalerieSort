import QtQuick 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.0
import Qt.labs.folderlistmodel 1.0

ApplicationWindow {
  id: mainWindow
	visible: true
	title: "Main Window"
	color: "#222222"
  toolBar: ToolBar {
      Column {
        Button {
          text: "Select folder for browsing..."
          onClicked: fileDialog.open()
        }
        Slider { 
          width: 200
          id: zoomSlider
          minimumValue: 100
          maximumValue: 300
          value: 200
        }
      }
  }

  FileDialog {
    id: fileDialog
    title: "Choose a folder with some images"
    selectFolder: true
    onAccepted: folderModel.folder = fileUrl + "/"
  }

  SplitView {
    anchors.fill: parent
    ScrollView {
      Rectangle {
        anchors {
          topMargin: 20; bottomMargin: 20
          leftMargin: 20; rightMargin: 20
        }
        width: 100
        height: 100
      }
    }

    ScrollView {
      GridView {
        id: browser
        interactive: false
        cellWidth: zoomSlider.value; cellHeight: (3 / 4) * zoomSlider.value;
        anchors {
          topMargin: 20; bottomMargin: 20
          leftMargin: 20; rightMargin: 20
          fill: parent
        }

        FolderListModel { 
          id: folderModel
          objectName: "folderModel"
          folder: "/home/maggeych/Pictures/" 
          sortField: "Time"
          nameFilters: imageNameFilters
          showDirs: false
        }
        model: folderModel
        delegate: IconItem { }
      }
    }
  }
}
