#!/bin/bash

# Update & Install package
apt update
apt install -y curl jq

# Get Token from Youtube Token Generator
YTGEN_URL="http://ytgen:8080"
while ! curl -s $YTGEN_URL > /dev/null; do
    sleep 1
    echo "Youtube Token Generator no response, wait for 3 sec"
    sleep 2
done

curl -s http://ytgen:8080/token | jq -r '"ytpotoken=\"\(.potoken)\"\nytvisitordata=\"\(.visitor_data)\""' | tee -a config.txt

# Run JMusicBot.jar
java -Dnogui=true -jar JMusicBot.jar
