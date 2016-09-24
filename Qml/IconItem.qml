import QtQuick 2.3
Component {

  Item {
    id: main
    width: browser.cellWidth; height: browser.cellHeight
    Image {
      id: item; // parent: loc
		anchors {
			topMargin: 10; bottomMargin: 10
			leftMargin: 10; rightMargin: 10
			fill: parent
		}
      fillMode: Image.PreserveAspectFit; smooth: true
      source: folderModel.folder + fileName

      // Rectangle {
      //   anchors.fill: parent;
      //   border.color: "#326487"; border.width: 3
      //   color: "transparent"; radius: 0
      //   visible: item.state == "active"
      // }

      // Rectangle {
      //   anchors.fill: parent;
      //   border.color: "#ff0000"; border.width: 3
      //   color: "transparent"; radius: 0
      //   visible: loc.selectedId == gridId
      // }
      // Behavior on x { 
      //   // enabled: item.state != "active" && item.state != "insert"
      //   NumberAnimation { duration: 300; easing.type: Easing.OutQuart} 
      // }
      // Behavior on y { 
      //   // enabled: item.state != "active" && item.state != "insert"
      //   NumberAnimation { duration: 300; easing.type: Easing.OutQuart}
      // }
      // states: [
      //   State {
      //     name: "active"
      //     when: loc.currentId == gridId && icons.get(loc.index).type != "folder"
      //     PropertyChanges { 
      //       target: item
      //       x: loc.mouseX - width/2
      //       y: loc.mouseY - height/2
      //       scale: 1.1
      //       z: 10 
      //     }
      //   },
      //   State {
      //     name: "aboutToInsert"
      //     when: loc.currentId == gridId && icons.get(loc.index).type == "folder"
      //     PropertyChanges { 
      //       target: item
      //       x: loc.mouseX - width/2
      //       y: loc.mouseY - height/2
      //       scale: 0.5
      //       z: 10 
      //     }
      //   }
      // ]
    }
  }
}
