#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Error : Please install docker first!" >&2
    exit 1
fi


if command -v docker compose &> /dev/null
then
    DOCKER_COMPOSE_CMD="docker compose"
    echo "Using Docker Compose v2..."
elif command -v docker-compose &> /dev/null
then
    DOCKER_COMPOSE_CMD="docker-compose"
    echo "使用 Docker Compose v1..."
else
    echo "Error : cannot find docker compose or docker-compose command" >&2
    exit 1
fi


sudo $DOCKER_COMPOSE_CMD down

# Download latest JMusicBot.jar
LATEST_URL=$(curl -sL https://api.github.com/repos/SeVile/MusicBot/releases/latest | grep -o '"browser_download_url": ".*JMusicBot.*"' | sed 's/"browser_download_url": "//;s/"//g')

if [ -z "$LATEST_URL" ]; then
    echo "Error: JMusicBot URL not Found" >&2
    exit 1
fi

echo "Downloading... $LATEST_URL"
wget -N -O JMusicBot.jar "$LATEST_URL"
echo "Download Complete! Setup potoken & visitor_data..."

sudo docker rmi jmusicbot
sudo docker build -t jmusicbot .

sudo $DOCKER_COMPOSE_CMD up -d
