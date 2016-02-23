cmake_minimum_required (VERSION 3.0)
project (Indri C CXX)
set (Indri_VERSION_MAJOR 5)
set (Indri_VERSION_MINOR 9)


add_subdirectory(xpdf)
add_subdirectory(antlr)
add_subdirectory(zlib)
add_subdirectory(lemur)

#flex_target(FLex1 ${CMAKE_CURRENT_SOURCE_DIR}/TextParser.l  ${CMAKE_CURRENT_BINARY_DIR}/TextParser.cpp)
#flex_target(FLex2 ${CMAKE_CURRENT_SOURCE_DIR}/TextTokenizer.l  ${CMAKE_CURRENT_BINARY_DIR}/TextTokenizer.cpp)

file(GLOB SOURCES "src/*.c*")
include_directories(include)
add_library(indri SHARED ${SOURCES})
target_link_libraries(indri lemur xpdf antlr zlib)

target_include_directories(indri PUBLIC include)