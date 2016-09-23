import QtQuick 2.3
Component {
  Item {
    id: main
    width: grid.cellWidth; height: grid.cellHeight
    Image {
      id: item; parent: loc
      x: main.x + 5; y: main.y + 5; z: -1
      width: main.width - 10; height: main.height - 10;
      fillMode: Image.PreserveAspectFit; smooth: true
      source: icon ? icon : ""
      Rectangle {
        id: captionBox
        anchors.fill: parent;
        anchors.margins: 30
        border.color: "#555"; border.width: 6
        color: "#333"; 
        visible: type == "folder"
        radius: 0.5 * width
        Text {
          anchors.centerIn: parent
          text: "Film"
        }
      }
      Rectangle {
        anchors.fill: parent;
        border.color: "#326487"; border.width: 3
        color: "transparent"; radius: 0
        visible: item.state == "active"
      }
      Rectangle {
        anchors.fill: parent;
        border.color: "#ff0000"; border.width: 3
        color: "transparent"; radius: 0
        visible: loc.selectedId == gridId
      }
      Behavior on x { 
        enabled: item.state != "active" && item.state != "insert"
        NumberAnimation { duration: 300; easing.type: Easing.OutQuart} 
      }
      Behavior on y { 
        enabled: item.state != "active" && item.state != "insert"
        NumberAnimation { duration: 300; easing.type: Easing.OutQuart}
      }
      states: [
        State {
          name: "active"
          when: loc.currentId == gridId && icons.get(loc.index).type != "folder"
          PropertyChanges { 
            target: item
            x: loc.mouseX - width/2
            y: loc.mouseY - height/2
            scale: 1.1
            z: 10 
          }
        },
        State {
          name: "aboutToInsert"
          when: loc.currentId == gridId && icons.get(loc.index).type == "folder"
          PropertyChanges { 
            target: item
            x: loc.mouseX - width/2
            y: loc.mouseY - height/2
            scale: 0.5
            z: 10 
          }
        }
      ]
    }
  }
}
