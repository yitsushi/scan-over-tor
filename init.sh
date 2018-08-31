#!/bin/bash

#sudo -u tor tor
tor

domain="${1}"

if [[ "x${domain}" = "x" ]]; then
  echo "${@}"
  echo '[!!] No domain provided'
  exit 1
fi

mkdir -p  "/root/aquatone/${domain}"

torify nikto \
  -h "https://${domain}/" \
  -Display v \
  -output "/root/aquatone/${domain}/nikto.txt"

#aquatone-discover -d "${domain}"
#aquatone-scan -d "${domain}" -p small
#
#mkdir /root/aquatone/${domain}
#torify webscreenshot \
#  -i "/root/aquatone/${domain}/urls.txt" \
#  -o "/root/aquatone/${domain}"
#
#torify aquatone-takeover -d "${domain}"
