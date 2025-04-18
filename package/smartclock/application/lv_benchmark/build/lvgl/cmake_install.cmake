# Install script for directory: /home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX ".")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/hampter/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin/aarch64-buildroot-linux-gnu-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./include/lvgl/" TYPE DIRECTORY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./include/lvgl" TYPE FILE FILES
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lv_version.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lvgl.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lv_conf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./include/lvgl/" TYPE DIRECTORY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/examples" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./include/lvgl/" TYPE DIRECTORY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/demos" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/lvgl/lvgl.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/lib/liblvgl.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lvgl" TYPE FILE FILES
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lv_version.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lvgl.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lv_conf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/lib/liblvgl_thorvg.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lvgl" TYPE FILE FILES
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lv_version.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lvgl.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lv_conf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/lib/liblvgl_demos.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lvgl" TYPE FILE FILES
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lv_version.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lvgl.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lv_conf.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/build/lib/liblvgl_examples.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lvgl" TYPE FILE FILES
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lv_version.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lvgl/lvgl.h"
    "/home/hampter/Desktop/assignment1/lvgl/lv_buildroot/application/lv_benchmark/lv_conf.h"
    )
endif()

