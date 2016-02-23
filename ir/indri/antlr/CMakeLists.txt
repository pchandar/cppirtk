cmake_minimum_required(VERSION 3.0)
project(antlr)

include_directories(include/antlr
                    include)

file(GLOB SOURCES "src/*.c*")
add_library(antlr SHARED ${SOURCES})
target_include_directories(antlr PUBLIC include)
