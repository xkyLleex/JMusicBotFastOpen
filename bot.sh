#!/bin/bash

apt update
apt install -y curl jq

LATEST_URL=$(curl -sL https://api.github.com/repos/SeVile/MusicBot/releases/latest | grep -o '"browser_download_url": ".*JMusicBot.*"' | sed 's/"browser_download_url": "//;s/"//g')

if [ -z "$LATEST_URL" ]; then
    echo "Error: JMusicBot URL not Found"
    exit 1
fi

echo "Downloading..."
wget -N -O JMusicBot.jar "$LATEST_URL"
echo "Download Complete! Setup potoken & visitor_data..."

curl -s http://ytgen:8080/token | jq -r '"ytpotoken=\(.potoken)\nytvisitordata=\(.visitor_data)"' | tee -a config.txt

java -Dnogui=true -jar JMusicBot.jar



