cmake_minimum_required(VERSION 3.0)
project(zlib)

include_directories(include)

file(GLOB SOURCES "src/*.c")

add_library(zlib SHARED ${SOURCES})
target_include_directories(zlib PUBLIC include)
