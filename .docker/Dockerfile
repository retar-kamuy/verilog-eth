FROM rockylinux:8
ENV CC=clang
ENV CXX=clang++
RUN dnf -y install git autoconf make clang bison flex \
    && dnf -y --enablerepo=powertools install gperf \
    && git clone https://github.com/steveicarus/iverilog.git \
    && cd iverilog \
    && autoconf \
    && ./configure \
    && make -j`nproc` \
    && make install \
    && make check \
    && cd .. \
    && rm -rf iverilog \
    && dnf -y install python3.12 python3.12-pip \
    && alternatives --set python3 /usr/bin/python3.12 \
    && pip3 install cocotb cocotbext-axi cocotbext-pcie cocotb-test \
    && dnf -y install epel-release \
    && dnf -y install gtkwave libGL \
    && dnf clean all
