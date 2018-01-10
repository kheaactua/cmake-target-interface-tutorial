The purpose of this repository is to show an example on how to build CMake Interface Targets.  It is broken up into three examples:

The first example demonstrates the most basic way of building source code.  *i.e.* some files and a build script that manually specifies inclusion and library paths.  This example also builds the actual library that subsequent examples assume to exist. (Therefore, run this first.)

The second example sets the project up with CMake.  The CMake code here also manually species the include and linking paths, making it little better than the build script.

The third example builds on the second example where a *Find* script script is written that prepares an `Extra` interface target such that the main `CMakeLists.txt` file can simply add `ExtraLib` along with all its settings and dependencies as one target.

The advantage of the interface target is that the *Find* script has total control over how the library should be included, or in other words, the details of the dependency are completely encapsulated in the *Find* script.
