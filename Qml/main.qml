import QtQuick 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

ApplicationWindow {
  id: mainWindow
	visible: true
	title: "Main Window"
	color: "#222222"
  toolBar: ToolBar {
    RowLayout {
      anchors.centerIn: parent
      Item {
          anchors.centerIn: parent
        Slider { 
          anchors.centerIn: parent
          width: 200
          id: zoomSlider
          minimumValue: 100
          maximumValue: 300
          value: 200
        }
      }
    }
  }
	GridView {
		id: grid
		interactive: false
		anchors {
			topMargin: 30; bottomMargin: 30
			leftMargin: 30; rightMargin: 30
			fill: parent
		}
		cellWidth: zoomSlider.value; cellHeight: zoomSlider.value;
		model: WidgetModel { id: icons }
		delegate: IconItem { }
		MouseArea {
		  property int selectedId: -1
			property int currentId: -1 // Original position in model
			property int newIndex // Current Position in model
			property int index: grid.indexAt(mouseX, mouseY) // Item underneath cursor
			id: loc
			hoverEnabled: true
			preventStealing: true
			anchors.fill: parent
      onPressAndHold: {
        if (index > -1) 
          currentId = icons.get(newIndex = index).gridId
      }
      onClicked: {
        if (index > -1) {
          var gId = icons.get(index).gridId
          selectedId = selectedId != gId ? gId : -1
        } else {
          selectedId = -1
        }
      }
			onReleased: currentId = -1
			onPositionChanged: {
        if (currentId != -1 && index != -1 && index != newIndex) {
          if (icons.get(index).type == "folder") {
          } else {
            icons.move(newIndex, newIndex = index, 1)
          }
        }
			}
		}
	}
}
