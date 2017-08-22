import QtQuick 2.7
import QtQuick.Window 2.3

Window {
       id: root
       visible: true
       width: 640
       height: 480
       flags: Qt.Window | Qt.FramelessWindowHint
       property int baseHeight: root.height
       property int baseWidth: root.width

       onWindowStateChanged:  {
            console.log(windowState)
       }


       Rectangle {
           id: main
           color: "#000000"
           anchors.fill: parent
           focus: true
           Keys.onPressed: {

               if((event.key === Qt.Key_Q) && (event.modifiers & Qt.ShiftModifier)){
                    Qt.quit()
                }

               if((event.key === Qt.Key_F) && (event.modifiers & Qt.ShiftModifier)){
                    root.showFullScreen()
               }

               if((event.key === Qt.Key_G) && (event.modifiers & Qt.ShiftModifier)){
                   console.log(qsTr("Hit"))
                   root.showMinimized()
               }

           }

           Text {
               text: qsTr("MCP ONLINE")
               anchors.centerIn: parent
               color: "#FFFFFF"
           }
       }
}

