# Copyright © 2016, Freiburg.
# Author: Markus Frey. All Rights Reserved.

project(mainProject)

# ______________________________________________________________________________
# CMake settings.
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
set(CMAKE_AUTOMOC ON)
# ______________________________________________________________________________
# Additional compiler flags.
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
  message(FATAL_ERROR "Compiler ${CMAKE_CXX_COMPILER} has no C++11 support. "
    "Please use a different C++ compiler.")
endif()

set(MAINPROJECT_CUSTOM_COMPILER_FLAGS 
  " -O2 -Wall -Werror -fdiagnostics-color=auto ")

# ______________________________________________________________________________
# Find all packages.
find_package(Qt5Widgets COMPONENTS Quick Core REQUIRED)

# Add library header dirs.
include_directories(include)
include_directories(${Qt5Widgets_INCLUDE_DIRS})

# ______________________________________________________________________________
# 'main' target.
add_executable(main 
  src/main.cpp 
  src/Qml/Qml.cpp 
  src/Qml/Backend.cpp
  )

target_link_libraries(main 
  Qt5::Qml 
  Qt5::Widgets 
  )

qt5_use_modules(main Quick Core)
set_property(TARGET main APPEND_STRING PROPERTY 
  COMPILE_FLAGS ${MAINPROJECT_CUSTOM_COMPILER_FLAGS}
  )

add_custom_command(TARGET main PRE_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_directory
  ${CMAKE_CURRENT_SOURCE_DIR}/Qml $<TARGET_FILE_DIR:main>/Qml)
