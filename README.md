The purpose of this repository is to show an example on how to build CMake Interface Targets.  It is broken up into three examples:

## Example 1 - Build Scripts
The first example demonstrates the most basic way of building source code.  *i.e.* some files and a build script that manually specifies inclusion and library paths.  This example also builds the actual library that subsequent examples assume to exist. (Therefore, run this first.)

**Building**:
```sh
cd example-01-basic_build
./build.sh
```

## Example 2 - Basic CMake

The second example sets the project up with CMake.  The CMake code here also manually species the include and linking paths, making it little better than the build script.

**Building**:
```sh
cd example-02-basic_cmake
mkdir bld
cd bld
cmake -GNinja ..
ninja
```

This example makes explicit use of `link_directories` and `target_include_directories` in the make `CMakeLists.txt` file to specify exactly how `ExtraLib` should be included.  Note, this would have to be done in a similar way for all executables in this project that required `ExtraLib`.

## Example 3 - Find Scripts

The third example builds on the second example where a *Find* script script is written that prepares an `Extra` interface target such that the main `CMakeLists.txt` file can simply add `ExtraLib` along with all its settings and dependencies as one target.

**Building**:
```sh
cd example-02-cmake
mkdir bld
cd bld
cmake -GNinja ..
ninja
```

The advantage of the interface target is that the *Find* script has total control over how the library should be included, or in other words, the details of the dependency are completely encapsulated in the *Find* script.
