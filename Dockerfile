FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git \
    gcc \
    g++ \
    cmake \
    python-dev

RUN export CXX=/usr/bin/g++ && \
    export CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0'

RUN git clone -n https://github.com/jbeder/yaml-cpp.git && \
    cd yaml-cpp && \
    git checkout 9a3624205e8774953ef18f57067b3426c1c5ada6 && \
    mkdir build  && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    version=$(cat yaml-cpp.pc | grep Version | awk '{print $2}') && \
    tar -zcvf yaml-cpp-$version.tar.gz *
