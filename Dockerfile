FROM base/archlinux:latest

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm \
      tor torsocks \
      ca-certificates \
      nikto

#RUN mkdir -p /var/log/tor && chown tor.tor /var/log/tor
#RUN mkdir -p /var/lib/tor && chown tor.tor /var/lib/tor

COPY torrc /etc/tor/torrc
#RUN chown tor /etc/tor/torrc

COPY init.sh /
RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]
