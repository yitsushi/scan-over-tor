#!/bin/ash

sudo -u tor tor

domain="${1}"

aquatone-discover -d "${domain}"
torify aquatone-scan -d "${domain}" -p large

mkdir ~/aquatone/${domain}
torify webscreenshot \
  -i "~/aquatone/${domain}/urls.txt" \
  -o "~/aquatone/${domain}"

torify aquatone-takeover -d "${domain}"
