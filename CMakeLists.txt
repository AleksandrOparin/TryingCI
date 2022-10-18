cmake_minimum_required(VERSION 3.16)
project(test)

add_subdirectory(project)

message("PROJECT_INCLUDE_DIRS = ${PROJECT_INCLUDE_DIRS}")
message("PROJECT_LIBRARIES = ${PROJECT_LIBRARIES}")

add_executable(${PROJECT_NAME} main.cpp)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -coverage -lgcov" )

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_LIBRARIES})

add_subdirectory(tests)
