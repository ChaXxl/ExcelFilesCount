import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 700
    height: 480
    title: "Excel 文件行数统计软件 V1.0"

    // 用于存储矩形的颜色
    property string rectColor: "#1f1f1f"

    // 用于拖拽的区域
    Rectangle {
        id: draggableRect
        anchors.fill: parent
        color: rectColor

        // 提示拖拽
        Text {
            anchors.centerIn: parent
            text: "请将 Excel 文件或者文件夹拖到此处"
            color: "#888888"
            font.pixelSize: 20
        }

        // 接受拖拽
        DropArea {
            anchors.fill: parent

            onEntered: (drop) => {
                if (drop.hasUrls) {
                    draggableRect.color = "#403f3f"
                }
            }

            onExited: (drop) => {
                draggableRect.color = rectColor
            }

            onDropped: (drop) => {
                // 当释放时, 将矩形恢复到默认层级
                draggableRect.color = rectColor
                if (drop.hasUrls) {
                    for (var i =0; i < drop.urls.length; i++) {
                        var url = drop.urls[i].toString();
                        console.log(url);
                    }
                }
            }
        }
    }

    TableView {

    }
}
