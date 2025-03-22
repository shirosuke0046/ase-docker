# ase-docker

## Usage

```bash
mkdir ./arkdata
docker run -d --name ark-survival-evolved \
    --restart=always \
    -p 7777:7777/udp \
    -p 7778:7778/udp \
    -p 27015:25015/udp \
    -p 27020:25020/tcp \  # for RCONPort
    -v ./arkdata:/arkdata \
    shirosuke0046/ark-survival-evolved
```

### Configuration

|Variable             |Default value|
|:-------------------:|:-----------:|
|MAP_NAME             |TheIsland    |
|SESSION_NAME         |MyArkSession |
|PORT                 |7777         |
|QUERY_PORT           |27015        |
|DISABLE_BATTLEYE     |False        |

If you want to modify other settiongs in the configuration files, please edit `./arkdata/Config/LinuxServer/GameUserSettings.ini` and `./arkdata/Config/LinuxServer/Game.ini` after the first launch.
