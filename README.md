# JMusicBotFastOpen

[REF MusicBot by jagrosh](https://github.com/jagrosh/MusicBot)
[REF Fork MusicBot by SeVile](https://github.com/SeVile/MusicBot)

Prerequisites:
- Discord bot key
- Docker and Docker Compose

## Get files
You can using Git to get all file you need
```shell
git clone https://github.com/xkyLleex/JMusicBotFastOpen
```

## Setup setting
1. Change the config.txt.example to config.txt
   ```shell
   mv config.txt
   ```

2. Set the ID and Token
   - Follow [HERE](https://jmusicbot.com/finding-your-user-id/) to set you ID in config.txt
   - Follow [HERE](https://jmusicbot.com/getting-a-bot-token/) to set the bot Token

Make sure that you replace the ID and Token in *config.txt*, It will look like this:
```
owner=123456789
token=ABCD1234abcd5678
...
```

## Build & Run

```shell
chmod +x start.sh
./start.sh
```

## Q & A
If you have any question, please let me know in the repository issues.
