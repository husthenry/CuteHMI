# Common qmake input for all CuteHMI subprojects.

DESTDIR = $$PWD/../bin

CONFIG += object_parallel_to_source

QMAKE_CXXFLAGS += -std=c++11

UI_DIR = $$_PRO_FILE_PWD_/uic
MOC_DIR = $$_PRO_FILE_PWD_/moc
RCC_DIR = $$_PRO_FILE_PWD_/rcc

# Library versions.
CUTEHMI_BASE_MAJOR = 0
CUTEHMI_WIDGETS_MAJOR = 0
CUTEHMI_MODBUS_MAJOR = 0
