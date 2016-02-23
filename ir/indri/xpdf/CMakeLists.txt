cmake_minimum_required(VERSION 3.0)
project(xpdf)


include_directories(include)
file(GLOB SOURCES "src/*.cc")

add_library(xpdf SHARED ${SOURCES})
target_include_directories(xpdf PUBLIC include)
