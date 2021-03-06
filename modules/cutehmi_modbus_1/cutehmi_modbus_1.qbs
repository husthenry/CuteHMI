import qbs

ModuleLib {
	name: "cutehmi_modbus_1"

	files: [
        "cutehmi_modbus_1.json",
        "cutehmi_modbus_1.qrc",
        "include/cutehmi/modbus/AbstractDevice.hpp",
        "include/cutehmi/modbus/Client.hpp",
        "include/cutehmi/modbus/Coil.hpp",
        "include/cutehmi/modbus/DiscreteInput.hpp",
        "include/cutehmi/modbus/Exception.hpp",
        "include/cutehmi/modbus/HoldingRegister.hpp",
        "include/cutehmi/modbus/InputRegister.hpp",
        "include/cutehmi/modbus/Service.hpp",
        "include/cutehmi/modbus/internal/AbstractConnection.hpp",
        "include/cutehmi/modbus/internal/DataContainer.hpp",
        "include/cutehmi/modbus/internal/DummyConnection.hpp",
        "include/cutehmi/modbus/internal/LibmodbusConnection.hpp",
        "include/cutehmi/modbus/internal/RTUConnection.hpp",
        "include/cutehmi/modbus/internal/RegisterTraits.hpp",
        "include/cutehmi/modbus/internal/ServiceThread.hpp",
        "include/cutehmi/modbus/internal/TCPConnection.hpp",
        "include/cutehmi/modbus/internal/common.hpp",
        "include/cutehmi/modbus/internal/functions.hpp",
        "include/cutehmi/modbus/internal/platform.hpp",
        "include/cutehmi/modbus/logging.hpp",
        "src/cutehmi/modbus/AbstractDevice.cpp",
        "src/cutehmi/modbus/Client.cpp",
        "src/cutehmi/modbus/Coil.cpp",
        "src/cutehmi/modbus/DiscreteInput.cpp",
        "src/cutehmi/modbus/Exception.cpp",
        "src/cutehmi/modbus/HoldingRegister.cpp",
        "src/cutehmi/modbus/InputRegister.cpp",
        "src/cutehmi/modbus/Service.cpp",
        "src/cutehmi/modbus/internal/DummyConnection.cpp",
        "src/cutehmi/modbus/internal/LibmodbusConnection.cpp",
        "src/cutehmi/modbus/internal/RTUConnection.cpp",
        "src/cutehmi/modbus/internal/ServiceThread.cpp",
        "src/cutehmi/modbus/internal/TCPConnection.cpp",
        "src/cutehmi/modbus/internal/functions.cpp",
        "src/cutehmi/modbus/logging.cpp",
        "src/cutehmi/modbus/plugin/ModbusNodeData.cpp",
        "src/cutehmi/modbus/plugin/ModbusNodeData.hpp",
        "src/cutehmi/modbus/plugin/Plugin.cpp",
        "src/cutehmi/modbus/plugin/Plugin.hpp",
        "src/cutehmi/modbus/plugin/PluginNodeData.cpp",
        "src/cutehmi/modbus/plugin/PluginNodeData.hpp",
    ]

	Depends { name: "Qt.concurrent" }

	Depends { name: "cutehmi_1" }
	Depends { name: "cutehmi_xml_1" }
	Depends { name: "cutehmi_services_1" }

	Depends { name: "libmodbus" }

	Export {
		Depends { name: "Qt.concurrent" }

		Depends { name: "cutehmi_1" }
	}
}
