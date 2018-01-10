#!/bin/zsh

set -e

declare -r VENDOR_DIR=../vendor
declare -r EXTRA_LIB_BASE_DIR=${VENDOR_DIR}/extra
declare -r work_dir=$(pwd)

##
# Build our lib
##

cd ${EXTRA_LIB_BASE_DIR}

# Build our object file
clang++ --std=c++11 -o extra_functions.o \
	-Iinclude \
	-c src/extra_functions.cpp

# Create static lib
ar rcs libextra.a extra_functions.o

if [[ ! -e libextra.a ]]; then
	echo "Could not create lib"
	exit -1;
fi

##
# Build our app
##

cd ${work_dir}

# Build our app
clang++ --std=c++11 -o app \
	-I${EXTRA_LIB_BASE_DIR}/include \
	main.cpp \
	-L${EXTRA_LIB_BASE_DIR} -lextra

# vim: set ts=3 sw=3 noet ffs=unix ft=sh :
