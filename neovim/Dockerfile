FROM elongeau/base 
MAINTAINER elongeau

RUN apt-get update && \
    apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y --force-yes
RUN git clone https://github.com/neovim/neovim.git neovim
WORKDIR /neovim
RUN make cmake
RUN make install
WORKDIR /
RUN rm -rf /neovim

RUN alias -g nvim="nvim -u ~/.vimrc"
CMD bash

