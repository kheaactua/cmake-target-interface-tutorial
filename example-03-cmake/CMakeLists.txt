project(EX2)

cmake_minimum_required(VERSION 3.9)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# Assuming lib is already build
set(VENDOR_DIR ${CMAKE_SOURCE_DIR}/../vendor CACHE PATH "Path to Vendors")

# Add our Find Scritps
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/FindScripts)

# Add Extra lib
find_package(Extra)

add_executable(app main.cpp)
target_link_libraries(app Extra)

# vim: ts=2 sw=2 sts=2 noet ffs=unix ft=cmake :
