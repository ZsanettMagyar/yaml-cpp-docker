FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git \
    cmake

RUN git clone https://github.com/jbeder/yaml-cpp.git

RUN mkdir build  && \
    cd build && \
    cmake .. && \
    make && \
    make install
