FROM fedora:20
RUN yum -y -q install which git stow vim deltarpm tmux && \
    cd /root && \
    mv .bashrc .bashrc~ && \
    git clone https://github.com/dminkovsky/dotfiles.git && \
    cd /root/dotfiles && \
    git submodule update --init && \
    stow vim && \
    stow bashrc-linux && \
    stow bashrc.d
ENV TERM screen-256color
WORKDIR /root
COPY .tmux.conf /root/.tmux.conf
CMD ["/bin/bash"]

