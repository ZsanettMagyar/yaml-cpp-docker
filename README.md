# yaml-cpp-docker

Docker image from: https://hub.docker.com/_/ubuntu?tab=description&page=1&name=bioni

Errors during build:
No CMAKE_CXX_COMPILER could be found -> export CXX
https://stackoverflow.com/questions/8878676/compile-error-g-error-trying-to-exec-cc1plus-execvp-no-such-file-or-dir/22072238
Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE) -> https://stackoverflow.com/questions/24174394/cmake-is-not-able-to-find-python-libraries

https://stackoverflow.com/questions/50300939/cmake-add-executable-called-with-incorrect-number-of-arguments ???
