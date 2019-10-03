FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git \
    gcc \
    g++ \
    cmake \
    python-dev

RUN export CXX=/usr/bin/gcc

RUN git clone https://github.com/jbeder/yaml-cpp.git \
    cd yaml-cpp && \
    mkdir build  && \
    cd build && \
    cmake .. && \
    make && \
    make install
