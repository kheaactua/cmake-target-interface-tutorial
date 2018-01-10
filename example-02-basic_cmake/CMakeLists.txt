project(EX2)

cmake_minimum_required(VERSION 3.9)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}  -std=c++11")

# Assuming lib is already build
set(VENDOR_DIR ${CMAKE_SOURCE_DIR}/../vendor CACHE PATH "Path to Vendors")
set(EXTRA_LIB_BASE_DIR ${VENDOR_DIR}/extra CACHE PATH "Path to Extra Lib")

add_executable(app main.cpp)
target_include_directories(app PUBLIC ${EXTRA_LIB_BASE_DIR}/include)
target_link_libraries(app ${EXTRA_LIB_BASE_DIR}/libextra.a)

# vim: ts=2 sw=2 sts=2 noet ffs=unix ft=cmake :
