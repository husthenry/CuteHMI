import QtQuick 2.0
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
	anchors.left: parent.left
	anchors.right: parent.right

	Section {
		anchors.left: parent.left
		anchors.right: parent.right
		caption: "Modbus"

		SectionLayout {
			rows: 2

			Label {
				text: qsTr("Device")
			}
			SecondColumnLayout {
				LineEdit {
					backendValue: backendValues.device
					placeholderText: backendValue.expression
					Layout.fillWidth: true
					showExtendedFunctionButton: true
					showTranslateCheckBox: false
					readOnly: true
				}
			}

			Label {
				text: qsTr("Address")
			}
			SecondColumnLayout {
				SpinBox {
					backendValue: backendValues.address
					minimumValue: 0
					maximumValue: 65535
					Layout.preferredWidth: 80
				}
				Label {
					text: "/"
					tooltip: "Entity address / Entity number"
					width: 20
					horizontalAlignment: Text.AlignHCenter
				}
				SpinBox {
					value:  backendValues.address.value + 400001
					minimumValue: 400001
					maximumValue: 465536
					Layout.preferredWidth: 80
					Layout.alignment: Qt.AlignRight

					onValueChanged: {
						if (backendValues.address.value !== value - 400001)
							backendValues.address.value = value - 400001
					}
				}
			}

			Label {
				text: qsTr("Encoding")
			}
			SecondColumnLayout {
				ComboBox {
					model: ["INT16"]
					backendValue: backendValues.encoding
					Layout.fillWidth: true
					scope: "ModbusHoldingRegister"
				}
			}
		}
	}
}