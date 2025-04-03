#!/bin/sh

# Update Garry's Mod
${STEAMCMDDIR}/steamcmd.sh +login anonymous \
    +force_install_dir ${GMODDIR} +app_update ${GMODID} validate +quit

# Start the server
if [ -z "${GMODPORT}" ]
then
    GMODPORT=27015
fi
if [ -z "${CLIENTPORT}" ]
then
    CLIENTPORT=27005
fi
if [ -z "${MAXPLAYERS}" ]
then
    MAXPLAYERS=20
fi
if [ -z "${GAMEMODE}" ]
then
    GAMEMODE=sandbox
fi
if [ -z "${GAMEMAP}" ]
then
    GAMEMAP=gm_flatgrass
fi
if [ -z "${WORKSHOPID}" ]
then
    if [ -z "${LOGINTOKEN}" ]
    then
        exec ${GMODDIR}/srcds_run \
            -autoupdate \
            -steam_dir ${STEAMCMDDIR} \
            -steamcmd_script /home/steam/autoupdatescript.txt \
            -port ${GMODPORT} \
            -clientport ${CLIENTPORT} \
            -maxplayers ${MAXPLAYERS} \
            -game garrysmod \
            +gamemode ${GAMEMODE} \
            +map ${GAMEMAP}
    else
        exec ${GMODDIR}/srcds_run \
            -autoupdate \
            -steam_dir ${STEAMCMDDIR} \
            -steamcmd_script /home/steam/autoupdatescript.txt \
            -port ${GMODPORT} \
            -clientport ${CLIENTPORT} \
            -maxplayers ${MAXPLAYERS} \
            -game garrysmod \
            +sv_setsteamaccount ${LOGINTOKEN} \
            +gamemode ${GAMEMODE} \
            +map ${GAMEMAP}
    fi
else
    if [ -z "${LOGINTOKEN}" ]
    then
        exec ${GMODDIR}/srcds_run \
            -autoupdate \
            -steam_dir ${STEAMCMDDIR} \
            -steamcmd_script /home/steam/autoupdatescript.txt \
            -port ${GMODPORT} \
            -clientport ${CLIENTPORT} \
            -maxplayers ${MAXPLAYERS} \
            -game garrysmod \
            +host_workshop_collection ${WORKSHOPID} \
            +gamemode ${GAMEMODE} \
            +map ${GAMEMAP}
    else
        exec ${GMODDIR}/srcds_run \
            -autoupdate \
            -steam_dir ${STEAMCMDDIR} \
            -steamcmd_script /home/steam/autoupdatescript.txt \
            -port ${GMODPORT} \
            -clientport ${CLIENTPORT} \
            -maxplayers ${MAXPLAYERS} \
            -game garrysmod \
            +sv_setsteamaccount ${LOGINTOKEN} \
            +host_workshop_collection ${WORKSHOPID} \
            +gamemode ${GAMEMODE} \
            +map ${GAMEMAP}
    fi
fi