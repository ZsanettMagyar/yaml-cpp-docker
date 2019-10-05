# yaml-cpp-docker

This project is able to build a docker image from the https://github.com/jbeder/yaml-cpp/tree/9a3624205e8774953ef18f57067b3426c1c5ada6 project and run it. For any further information about using the yaml-cpp please visit this link.

## Prerequisites

You must have a Jenkins 2.x instance.

I have a CentOS7 virtual machine intsalled from: http://ftp.bme.hu/centos/7.5.1804/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso

Installed tools on CentOS:
  - Docker CE (https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce)
    For using docker I created a unix group (dockergrp) and a unix user (dockermgr) according to https://docs.docker.com/install/linux/linux-postinstall/
  - Jenkins 2.151 
      - scripts for building Jenkins in docker: https://github.com/ZsanettMagyar/CICD/tree/master/build/docker/jenkins)
      - run Jenkins in docker: https://github.com/ZsanettMagyar/CICD/blob/master/runtime/cicd/buildjenkins/run.sh

## Dockerfile
Base image is Ubuntu Bionic (18.04): https://hub.docker.com/_/ubuntu?tab=description&page=1&name=bioni

### Installation of necessary dependencies for the build:
  - git
  - gcc
  - g++
  - cmake
  - python-dev

These installations will avoid the following errors during the build:
1.  No CMAKE_CXX_COMPILER could be found.

```console
root@f9636d742ab0:/yaml-cpp/build# cmake ..
-- The CXX compiler identification is unknown
CMake Error at CMakeLists.txt:3 (project):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

-- Configuring incomplete, errors occurred!
```

2. gcc: error trying to exec 'cc1plus': execvp: No such file or directory

```console
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
```

https://stackoverflow.com/questions/8878676/compile-error-g-error-trying-to-exec-cc1plus-execvp-no-such-file-or-dir/22072238

3. Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)

https://stackoverflow.com/questions/24174394/cmake-is-not-able-to-find-python-libraries

4. add_executable

```console
-- Found PythonInterp: /usr/bin/python (found version "2.7.15")
CMake Error at test/CMakeLists.txt:23 (add_executable):
  add_executable called with incorrect number of arguments
 ....
```

https://stackoverflow.com/questions/50300939/cmake-add-executable-called-with-incorrect-number-of-arguments

--> use the verified commit: 9a3624205e8774953ef18f57067b3426c1c5ada6

5. Undefined reference to 'operator delete(void*)'

https://stackoverflow.com/questions/7015285/undefined-reference-to-operator-deletevoid

### Clone the yaml-cpp project

Verified commit: https://github.com/jbeder/yaml-cpp/tree/9a3624205e8774953ef18f57067b3426c1c5ada6

### Build the yaml-cpp project

Installation steps: https://github.com/jbeder/yaml-cpp/blob/9a3624205e8774953ef18f57067b3426c1c5ada6/install.txt

