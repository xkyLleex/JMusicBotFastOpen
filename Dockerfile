FROM openjdk:11-jdk-slim

WORKDIR /app

COPY . .

CMD ["/bin/bash", "-c", "./bot.sh"]
