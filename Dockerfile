FROM ubuntu:18.04

# stage 1: Compiler Toolchain
RUN apt-get update && \
    apt-get install -y build-essential gdb gcc-multilib

# stage 2: QEMU Emulator 
RUN apt-get install -y git
# RUN git clone https://github.com/mit-pdos/6.828-qemu.git qemu
ADD qemu.tar.gz /root/
RUN apt-get install -y python && \
    apt-get install -y libtool-bin && \
    apt-get install -y pkg-config && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y libglib2.0-dev && \
    apt-get install -y libpixman-1-dev

RUN cd /root/qemu && \
    ./configure --disable-kvm --disable-werror --prefix="/usr/local" --target-list="i386-softmmu x86_64-softmmu" && \
    make -j4 && \
    make install && \
    cd /root && rm -rf qemu

# stage 3: gdbgui
RUN apt-get install -y python3 python3-pip 
RUN pip3 install gdbgui

# Others
RUN apt-get install -y bsdmainutils
RUN apt-get install -y pax-utils
RUN apt-get install -y execstack
RUN apt-get install -y elfutils

RUN mkdir -p /root/jos
RUN rm -rf /var/lib/apt/lists/*
