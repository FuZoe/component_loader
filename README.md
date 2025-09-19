相关文档

[Drag事件](https://github.com/FuZoe/Embedded-Development-NoteBook/blob/desktop/Qt/QML%20%26%20QtQuick/Qt%E6%8B%96%E6%94%BE/Drag.md)

QML官方也有实现侧边栏的组件[Drawer（抽屉）](https://doc.qt.io/qt-6/qml-qtquick-controls-drawer.html) ， 但它的局限性是默认会将其父级重设为窗口的 overlay 层。因此，当 Drawer 打开时，它会覆盖住界面上的所有其他元素。

一个Drawer的使用示例：


    import QtQuick
    import QtQuick.Controls
    
    ApplicationWindow {
        id: window
        width: 640
        height: 480
        visible: true
    
        Drawer {
            id: drawer
            width: 200
            height: parent.height
            edge: Qt.LeftEdge
    
            // --- Drawer 的内容 ---
            Column {
                anchors.fill: parent
                spacing: 20
                padding: 20
    
                Label {
                    text: "我是侧边栏内容"
                    font.pixelSize: 16
                }
    
                // 关闭按钮放在 Drawer 内部
                Button {
                    text: "关闭侧边栏"
                    onClicked: drawer.close() // 点击关闭
                }
            }
            // --- Drawer 内容结束 ---
        }
    
        // 主界面的按钮，用于打开抽屉
        Button {
            text: "打开侧边栏"
            onClicked: drawer.open()
            anchors.centerIn: parent
        }
    }
