import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12

Shape {
    id: shape
    property var cornersRadius
    property color color
    layer.enabled: true
    layer.samples: 4
    ShapePath {
        startX: 0
        startY: cornersRadius[0]
        fillColor: color
        PathQuad { x: cornersRadius[0]; y: 0; controlX: 0; controlY: 0 }
        PathLine { x: shape.width - cornersRadius[1]; y: 0 }
        PathQuad { x: shape.width; y: cornersRadius[1]; controlX: shape.width; controlY: 0 }
        PathLine { x: shape.width; y: shape.height - cornersRadius[2] }
        PathQuad { x: shape.width - cornersRadius[2]; y: shape.height; controlX: shape.width; controlY: shape.height }
        PathLine { x: cornersRadius[3]; y: shape.height }
        PathQuad { x: 0; y: shape.height - cornersRadius[3]; controlX: 0; controlY: shape.height }
        PathLine { x: 0; y: cornersRadius[0] }
    }
}
