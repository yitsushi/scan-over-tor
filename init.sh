#!/bin/bash

sudo -u tor tor

domain="${1}"

if [[ "x${domain}" = "x" ]]; then
  echo "${@}"
  echo '[!!] No domain provided'
  exit
fi

aquatone-discover -d "${domain}"
aquatone-scan -d "${domain}" -p small

mkdir /root/aquatone/${domain}
torify webscreenshot \
  -i "/root/aquatone/${domain}/urls.txt" \
  -o "/root/aquatone/${domain}"

torify aquatone-takeover -d "${domain}"
