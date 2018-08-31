#!/bin/bash

sudo -u tor tor

domain="${1}"

if [[ "x${domain}" = "x" ]]; then
  echo "${@}"
  echo '[!!] No domain provided'
  exit
fi

aquatone-discover -d "${domain}"
torify aquatone-scan -d "${domain}" -p small

mkdir ~/aquatone/${domain}
torify webscreenshot \
  -i "~/aquatone/${domain}/urls.txt" \
  -o "~/aquatone/${domain}"

torify aquatone-takeover -d "${domain}"
