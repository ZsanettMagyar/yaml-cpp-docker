FROM ubuntu:18.04

RUN git clone https://github.com/jbeder/yaml-cpp.git

RUN mkdir build  && \
    cd build && \
    cmake .. && \
    make && \
    make install
