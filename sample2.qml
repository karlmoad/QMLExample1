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
                   PanelHanlder.runCommand(qsTr("MINIMIZE"))
                   root.showMinimized()
               }

           }

           Canvas {
               id: canvas
               anchors.fill: parent
               property int margin: 10
               property int gap: 5
               property int sectionWidth: canvas.width - (margin*2)
               property int swoopBaseHeight: 40
               property int swoopBaseWidth: 200
               property double swoopBodyHeight: (swoopBaseHeight -gap)/2
               property int cx: 0
               property int cy: 0
               onPaint:{
                   var ctx = canvas.getContext("2d")
                   ctx.lineWidth = 1
                   ctx.strokeStyle = "#9999FF"
                   ctx.fillStyle = "#9999FF"

                   //setup strt point
                   cx = sectionWidth + margin
                   cy = margin

                   //Set upper right corner
                   ctx.moveTo(cx,cy)
                   cx = (cx - sectionWidth) + swoopBaseWidth
                   ctx.lineTo(cx,cy)

                   //outer curve
                   var cp1x = margin
                   var cp1y = margin
                   cx -= swoopBaseWidth
                   cy += swoopBodyHeight + gap + swoopBaseHeight
                   var cp2x = margin
                   var cp2y = margin
                   ctx.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, cx, cy)

                   //base bottom
                   cx += swoopBaseWidth
                   ctx.lineTo(cx,cy)

                   //inner curve
                   cp1x = cx
                   cp1y = cy -(swoopBaseHeight + gap)
                   cp2x = cx
                   cp2y = cy -(swoopBaseHeight + gap)
                   cx += swoopBaseWidth / 2
                   cy -= (swoopBaseHeight + gap)
                   ctx.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, cx, cy)

                   //body bottom
                   cx = sectionWidth + margin
                   ctx.lineTo(cx,cy)

                   ctx.closePath()
                   ctx.fill()

               }
           }
       }
}
