#!/bin/bash

#sudo -u tor tor
tor

domain="${1}"
ip="${2}"

if [[ "x${domain}" = "x" ]]; then
  echo "${@}"
  echo '[!!] No domain provided'
  exit 1
fi

mkdir -p  "/root/aquatone/${domain}"

torify wapiti \
  -u "https://${domain}/" \
  -o  "/root/aquatone/${domain}"

#aquatone-discover -d "${domain}"
#aquatone-scan -d "${domain}" -p small
#
#mkdir /root/aquatone/${domain}
#torify webscreenshot \
#  -i "/root/aquatone/${domain}/urls.txt" \
#  -o "/root/aquatone/${domain}"
#
#torify aquatone-takeover -d "${domain}"
