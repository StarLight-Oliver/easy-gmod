# Debian base image with SteamCMD
FROM cm2network/steamcmd:root

# DO NOT OVERRIDE THESE
ENV GMODID=4020 \
	GMODDIR=/home/steam/garrysmod \
	SERVERCFG=/home/steam/garrysmod/garrysmod/cfg/server.cfg \
	MOUNTCFG=/home/steam/garrysmod/garrysmod/cfg/mount.cfg

# Environment variables
ENV HOSTNAME="A Garry's Mod Server" \
    GMODPORT=27015 \
    CLIENTPORT=27005 \
	MAXPLAYERS=20 \
	GAMEMODE=sandbox \
	GAMEMAP=gm_flatgrass \
	WORKSHOPID="" \
	LOGINTOKEN=""

# Add files
WORKDIR /home/steam/
COPY --chown=steam mount.cfg autoupdatescript.txt ./
COPY --chown=steam easygmod.sh .
RUN chmod a+rx easygmod.sh

# Start main script
USER steam
CMD ./easygmod.sh

# Set up container
EXPOSE 27015/udp 27005/udp
VOLUME ${GMODDIR} ${CSSDIR} ${TF2DIR}