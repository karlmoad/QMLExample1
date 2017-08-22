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
               property int spacer: 30
               property int swooshHeight: 200
               property int swooshBodyHeight: 80
               property int swooshLegHeight: 120
               property int swooshLegWidth: 200
               property int pX: 0
               property int pY: 0
               onPaint:{
                   var context = canvas.getContext("2d")
                   context.lineWidth = 5
                   context.strokeStyle = "#9999FF"
                   context.fillStyle = "#9999FF"

                   context.beginPath()

                   //start point
                   pX = canvas.width - spacer
                   pY = spacer
                   context.moveTo(pX,pY)

                   //Draw top line
                   pX = spacer + swooshLegWidth
                   context.lineTo(pX,pY)


                   //Draw top curve
                   var cp1X = pX - (swooshLegWidth/2)
                   var cp1Y = pY
                   var cp2X = pX - (swooshLegWidth)
                   var cp2Y = pY - 5

                   pX = spacer
                   pY += swooshHeight - swooshLegHeight

                   context.bezierCurveTo(cp1X, cp1Y, cp2X, cp2Y, pX, pY)
                   context.stroke()





               }
           }
       }
}

