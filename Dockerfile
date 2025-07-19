FROM cm2network/steamcmd:root-bookworm

RUN apt update -y && apt upgrade -y && \
    apt install -y perl-modules curl lsof libc6-i386 lib32gcc-s1 bzip2 && \
    mkdir -p /arkdata && chmod 0777 /arkdata

USER steam
WORKDIR /home/steam

RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/ARK +login anonymous +app_update 376030 -beta preaquatica +quit && \
    ln -s /home/steam/steamcmd /home/steam/ARK/Engine/Binaries/ThirdParty/SteamCMD/Linux && \
    ln -s /home/steam/Steam/steamapps /home/steam/ARK/Engine/Binaries/ThirdParty/SteamCMD/Linux/steamapps && \
    ln -s /arkdata /home/steam/ARK/ShooterGame/Saved

COPY ./run.sh ./

ENTRYPOINT ["bash", "-c"]

CMD ["./run.sh"]
