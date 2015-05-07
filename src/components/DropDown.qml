/*
 * Papyros Shell - The desktop shell for Papyros following Material Design
 * Copyright (C) 2015 Michael Spencer
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
import QtQuick 2.0
import Material 0.1
import "."

PopupBase {
    id: popover

    implicitWidth: units.dp(300)

    width: implicitWidth
    height: implicitHeight

    default property alias content: container.data

    View {
        id: container

        elevation: 2
        radius: units.dp(2)

        opacity: showing ? 1 : 0
        visible: opacity > 0

        height: parent.height

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.right

            verticalCenterOffset: showing ? 0 : popover.side == Qt.AlignTop ? height/2 : -height/2

            Behavior on verticalCenterOffset {
                NumberAnimation { duration: 250 }
            }
        }

        Behavior on opacity {
            NumberAnimation { duration: 250 }
        }
    }
}
