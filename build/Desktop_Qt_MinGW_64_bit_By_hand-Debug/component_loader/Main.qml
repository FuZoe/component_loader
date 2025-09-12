import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Draggable Component Demo"

    Row {
        spacing: 50
        anchors.centerIn: parent

        // 左侧：可拖拽的模板按钮
        Column {
            spacing: 20

            Text {
                text: "拖拽区"
            }

            Component {
                id: draggableTemplate

                Item {
                    id: dragItem
                    width: 120
                    height: 40

                    Button {
                        id: button
                        anchors.fill: parent
                        text: "拖我"
                    }

                    MouseArea {
                        id: dragHandler
                        anchors.fill: parent
                        drag.target: dragItem

                        onPressed: {
                            console.log("开始拖拽")
                            // 启动拖拽
                            dragItem.Drag.mimeData = {
                                "text/plain": button.text
                            }
                            dragItem.Drag.supportedActions = Qt.CopyAction
                            dragItem.Drag.active = true
                        }

                        onReleased: {
                            console.log("释放拖拽")
                            // 执行drop操作
                            var result = dragItem.Drag.drop()
                            console.log("Drop结果:", result)
                            // 重置位置
                            dragItem.x = 0
                            dragItem.y = 0
                            // 重置拖拽状态
                            dragItem.Drag.active = false
                        }
                    }
                }
            }

            Loader {
                sourceComponent: draggableTemplate
            }
        }

        // 右侧：放置区域
        Column {
            spacing: 20

            Text {
                text: "放置区"
            }

            Rectangle {
                id: dropRect
                width: 300
                height: 400
                color: "#fafafa"
                border.color: "#ccc"

                DropArea {
                    anchors.fill: parent
                    onDropped: function(drop) {  // 修复警告：使用显式参数
                        console.log("接收到拖拽:", drop.text, "位置:", drop.x, drop.y)
                        if (drop.hasText) {
                            // 在放置位置创建新组件
                            var newButton = buttonInstanceComponent.createObject(dropRect, {
                                "x": drop.x,
                                "y": drop.y,
                                "text": drop.text ? drop.text + " (副本)" : "新按钮"
                            })
                            console.log("创建新按钮:", newButton)
                        } else {
                            // 如果没有文本，使用默认文本
                            var newButton = buttonInstanceComponent.createObject(dropRect, {
                                "x": drop.x,
                                "y": drop.y,
                                "text": "拖拽按钮 (副本)"
                            })
                        }
                    }

                    onEntered: function(drag) {  // 修复警告
                        console.log("拖拽进入区域")
                    }
                }
            }
        }
    }

    // 定义可复用的按钮实例组件
    Component {
        id: buttonInstanceComponent
        Button {
            text: "按钮"
            width: 120
            height: 40
        }
    }
}
