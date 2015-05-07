/*
* Papyros Shell - The desktop shell for Papyros following Material Design
* Copyright (C) 2015 Michael Spencer <sonrisesoftware@gmail.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.3
import Material 0.1
import Material.Desktop 0.1

import "../../components"
import "../../indicators"
import "../../launcher"

View {
    id: panel

    property Indicator selectedIndicator

    backgroundColor: shell.state == "exposed" ? Qt.rgba(0,0,0,0) : Qt.rgba(0.2, 0.2, 0.2, 1)
    height: units.dp(56)

    Behavior on backgroundColor {
        ColorAnimation { duration: 300 }
    }

    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    Row {
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom

        }

        IndicatorView {
            width: height
            iconSize: units.dp(24)
            indicator: AppDrawer {
                id: appDrawer
            }
        }

        Repeater {
            model: [
            "papyros-files", "firefox", "gnome-terminal",
            "gnome-control-center"]
            delegate: Ink {
                width: parent.height
                height: width

                DesktopFile {
                    id: desktopFile
                    appId: modelData
                }

                AppIcon {
                    iconName: desktopFile.iconName
                    name: desktopFile.name
                    anchors.centerIn: parent
                    width: parent.width * 0.55
                    height: width
                }

                onClicked: desktopFile.launch()
            }
        }
    }

    Row {
        id: indicatorsRow

        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            rightMargin: units.dp(16)
        }

        IndicatorView {
            indicator: DateTimeIndicator {}
        }

        Repeater {
            model: shell.indicators
            delegate: IndicatorView {
                indicator: modelData
            }
        }
    }
}
