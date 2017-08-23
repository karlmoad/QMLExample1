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

           Canvas {
               id: canvas
               anchors.fill: parent
               property int gap: 5
               property int sectionWidth: canvas.width - (gap*2)
               property int swoopBaseHeight: 40
               property int swoopBaseWidth: 100
               property double swoopBodyHeight: (swoopBaseHeight -gap)/2
               property int cx: 0 + (sectionWidth + gap)
               property int cy: 0 + gap
               onPaint:{
                   var ctx = canvas.getContext("2d")
                   ctx.lineWidth = 1
                   ctx.strokeStyle = "#9999FF"
                   ctx.fillStyle = "#9999FF"

                   //Set upper right corner
                   ctx.moveTo(cx,cy)
                   cx = (cx - sectionWidth) + swoopBaseWidth
                   ctx.lineTo(cx,cy)










                   ctx.stroke()
               }
           }
       }
}
