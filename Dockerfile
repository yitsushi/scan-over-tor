FROM base/archlinux:latest

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm \
      base-devel \
      tor torsocks \
      ca-certificates \
      python2 python2-pip python2-setuptools \
      imagemagick graphicsmagick \
      nodejs npm \
      git ruby

RUN echo "git ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/git
USER git
RUN mkdir /tmp/AUR

RUN cd /tmp/AUR && \
      git clone https://aur.archlinux.org/phantomjs-bin.git && \
      cd phantomjs-bin && \
      makepkg -si --noconfirm

USER root

# Missing:
#  xorg-server-xvfb ->
#    Xvfb :0 -screen 0 1024x768x8 -nolisten tcp &
#    nope yet

ENV PATH="/root/.gem/ruby/2.5.0/bin:${PATH}"

RUN gem install --no-doc --no-ri \
      aquatone bigdecimal json
RUN pip2 install webscreenshot

RUN mkdir -p /var/log/tor && chown tor.tor /var/log/tor
RUN mkdir -p /var/lib/tor && chown tor.tor /var/lib/tor

COPY torrc /etc/tor/torrc
RUN chown tor /etc/tor/torrc

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
