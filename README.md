# yaml-cpp-docker

## Docker image
https://hub.docker.com/_/ubuntu?tab=description&page=1&name=bioni

## Errors during build

### No CMAKE_CXX_COMPILER could be found.

root@f9636d742ab0:/yaml-cpp/build# cmake ..
-- The CXX compiler identification is unknown
CMake Error at CMakeLists.txt:3 (project):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

-- Configuring incomplete, errors occurred!

### gcc: error trying to exec 'cc1plus': execvp: No such file or directory

root@f9636d742ab0:/yaml-cpp/build# cmake ..
-- The CXX compiler identification is unknown
-- Check for working CXX compiler: /usr/bin/gcc
-- Check for working CXX compiler: /usr/bin/gcc -- broken
CMake Error at /usr/share/cmake-3.10/Modules/CMakeTestCXXCompiler.cmake:45 (message):
  The C++ compiler

    "/usr/bin/gcc"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: /yaml-cpp/build/CMakeFiles/CMakeTmp

    Run Build Command:"/usr/bin/make" "cmTC_e07bc/fast"
    /usr/bin/make -f CMakeFiles/cmTC_e07bc.dir/build.make CMakeFiles/cmTC_e07bc.dir/build
    make[1]: Entering directory '/yaml-cpp/build/CMakeFiles/CMakeTmp'
    Building CXX object CMakeFiles/cmTC_e07bc.dir/testCXXCompiler.cxx.o
    /usr/bin/gcc     -o CMakeFiles/cmTC_e07bc.dir/testCXXCompiler.cxx.o -c /yaml-cpp/build/CMakeFiles/CMakeTmp/testCXXCompiler.cxx
    gcc: error trying to exec 'cc1plus': execvp: No such file or directory
    CMakeFiles/cmTC_e07bc.dir/build.make:65: recipe for target 'CMakeFiles/cmTC_e07bc.dir/testCXXCompiler.cxx.o' failed
    make[1]: *** [CMakeFiles/cmTC_e07bc.dir/testCXXCompiler.cxx.o] Error 1
    make[1]: Leaving directory '/yaml-cpp/build/CMakeFiles/CMakeTmp'
    Makefile:126: recipe for target 'cmTC_e07bc/fast' failed
    make: *** [cmTC_e07bc/fast] Error 2

  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  CMakeLists.txt:3 (project)

-- Configuring incomplete, errors occurred!

https://stackoverflow.com/questions/8878676/compile-error-g-error-trying-to-exec-cc1plus-execvp-no-such-file-or-dir/22072238

### Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)

https://stackoverflow.com/questions/24174394/cmake-is-not-able-to-find-python-libraries

### add_executable

-- Found PythonInterp: /usr/bin/python (found version "2.7.15")
CMake Error at test/CMakeLists.txt:23 (add_executable):
  add_executable called with incorrect number of arguments


CMake Error at test/CMakeLists.txt:24 (target_sources):
  Cannot specify sources for target "yaml-cpp-tests" which is not built by
  this project.


CMake Error at test/CMakeLists.txt:28 (target_include_directories):
  Cannot specify include directories for target "yaml-cpp-tests" which is not
  built by this project.


CMake Error at test/CMakeLists.txt:33 (target_compile_options):
  Cannot specify compile options for target "yaml-cpp-tests" which is not
  built by this project.


CMake Error at test/CMakeLists.txt:37 (target_link_libraries):
  Cannot specify link libraries for target "yaml-cpp-tests" which is not
  built by this project.

-- Configuring incomplete, errors occurred!
See also "/yaml-cpp/build/CMakeFiles/CMakeOutput.log".
See also "/yaml-cpp/build/CMakeFiles/CMakeError.log".

https://stackoverflow.com/questions/50300939/cmake-add-executable-called-with-incorrect-number-of-arguments ???
