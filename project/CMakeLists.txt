cmake_minimum_required(VERSION 3.16)
project(project)

set(CMAKE_C_FLAGS ${CMAKE_C_FLAGS} "-fprofile-arcs -ftest-coverage -fPIC -O0")

file(GLOB SOURCES *.cpp)
file(GLOB INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR})

add_library(${PROJECT_NAME} ${SOURCES})

set(PROJECT_LIBRARIES ${PROJECT_NAME} PARENT_SCOPE)
set(PROJECT_INCLUDE_DIRS ${INCLUDE_DIRS} PARENT_SCOPE)