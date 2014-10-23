FROM fedora:20
RUN yum -y -q install which git stow vim
WORKDIR /root
# `stow` will refuse to write over existing files
RUN mv .bashrc .bashrc~ && \
    git clone https://github.com/dminkovsky/dotfiles.git # nocache
WORKDIR /root/dotfiles
RUN git submodule update --init && \
    stow vim && \
    stow bashrc-linux && \
    stow bashrc.d
ENV TERM screen-256color
WORKDIR /root
CMD ["/bin/bash"]

