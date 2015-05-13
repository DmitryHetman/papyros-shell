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
import QtQuick.Layouts 1.0
import Material 0.1
import GreenIsland.Desktop 1.0

Tooltip {
    id: dropdown

    property alias window: preview.window
    property alias item: preview.item

    ColumnLayout {
        id: layout
        anchors.centerIn: parent

        spacing: Units.dp(8)

        WindowPreview {
            id: preview

            Layout.fillHeight: true
            Layout.fillWidth: true

            height: Units.dp(160)

            property var item
            property var window
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: window.title
            color: Theme.dark.textColor
            style: "subheading"
        }
    }

    width: layout.width + Units.dp(16)
    height: layout.height + Units.dp(16)
}
