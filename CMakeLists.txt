cmake_minimum_required(VERSION 3.16)

project(component_loader VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CXX_COMPILER "D:/Program Files/mingw64/bin/g++.exe")
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appcomponent_loader
    main.cpp
)

qt_add_qml_module(appcomponent_loader
    URI component_loader
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcomponent_loader PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcomponent_loader
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcomponent_loader
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcomponent_loader
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
