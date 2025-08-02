FROM openjdk:11-jdk-slim

WORKDIR /app

COPY bot.sh bot.sh
RUN chmod +x bot.sh

CMD ["/bin/bash", "-c", "./bot.sh"]
