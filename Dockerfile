FROM base/archlinux:latest

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm \
      ca-certificates \
      python python-setuptools python-pip

RUN mkdir -p /var/log/tor
# && chown tor.tor /var/log/tor
RUN mkdir -p /var/lib/tor
# && chown tor.tor /var/lib/tor

RUN curl -sLo wapiti.tar.gz https://sourceforge.net/project && \
      tar -zxf wapiti.tar.gz && \
      cd wapiti3-3.0.1/ && \
      python setup.py install

COPY torrc /etc/tor/torrc
#RUN chown tor /etc/tor/torrc

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
