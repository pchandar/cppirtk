cmake_minimum_required(VERSION 3.0)
project(lemur)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/build")
include_directories(../include
                    include/lemur
                    include)

file(GLOB SOURCES "src/*.c*")
add_library(lemur STATIC ${SOURCES})
target_include_directories(lemur PUBLIC include ../include)
