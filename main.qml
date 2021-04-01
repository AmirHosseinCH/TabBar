import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: 'Tab Bar'
    Rectangle {
        id: container
        property var sources: ['user.png', 'bell.png', 'folder.png', 'envelope.png']
        property var activeSources: ['user-active.png', 'bell-active.png', 'folder-active.png', 'envelope-active.png']
        property var backgroundColors: ['#1789fc', '#e76f51', '#2a9d8f', '#f6aa1c']
        property var rectColors: ['#bcdbf7', '#ecdbd6', '#a5dbd4', '#fde1ac']
        property var radii: [[20, 20, 20, 40], [20, 20, 20, 20], [20, 20, 20, 20], [20, 20, 40, 20]]
        property int currentIndex: 0
        width: 400
        height: 200
        radius: 10
        color: backgroundColors[currentIndex]
        anchors.centerIn: parent
        Behavior on color {
            ColorAnimation {
                duration: 1000
            }
        }
        CurvedRectangle {
            width: 350
            height: 100
            color: '#ffffff'
            cornersRadius: [0, 0, 40, 40]
            anchors.centerIn: parent
            Row {
                spacing: 5
                anchors.centerIn: parent
                Repeater {
                    model: 4
                    delegate: Item {
                        width: 80
                        height: 80
                        CurvedRectangle {
                            color: container.rectColors[index]
                            cornersRadius: container.radii[index]
                            opacity: index === container.currentIndex ? 1 : 0
                            anchors.fill: parent
                            Behavior on opacity {
                                NumberAnimation {
                                    duration: 1000
                                }
                            }
                        }
                        Image {
                            id: icon
                            source: 'icons/' + (index === container.currentIndex ? container.activeSources[index] : container.sources[index])
                            sourceSize: Qt.size(25, 25)
                            anchors.centerIn: parent
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    container.currentIndex = index
                                }
                            }
                            ColorOverlay {
                                anchors.fill: icon
                                source: icon
                                color: container.backgroundColors[container.currentIndex]
                                Behavior on color {
                                    ColorAnimation {
                                        duration: 1000
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
