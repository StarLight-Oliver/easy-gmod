# Easy Gmod
A small fork of [Easy Gmod](https://github.com/Phyremaster/easy-gmod) that just remove tf2 and css content. along with some other minor changes for my own use.

## How to use this
Here's an example command:
```
docker run -p 27015:27015/udp phyremaster/easy-gmod
```

## Reference for 
### Ports
- `27015` - TCP - RCON
- `27015` - UDP - SRCDS (the Garry's Mod server)
- `27005` - UDP - SRCDS client port (used for the multiplayer server list)

### Volumes
- `/home/steam/garrysmod` - The Garry's Mod server files
- `/home/steam/css` - The Counter Strike: Source content files
- `/home/steam/tf2` - The Team Fortress 2 content files

### Environment variables (change `server.cfg` or SRCDS launch command)
- `GMODPORT` - `-port` - the SRCDS (Garry's Mod server) port - `27015`
- `CLIENTPORT` - `-clientport` - the SRCDS client port (for the server list) - `27005`
- `MAXPLAYERS` - `-maxplayers` - the maximum number of concurrent players allowed - `20`
- `GAMEMODE` - `+gamemode` - the gamemode to host - `sandbox`
- `GAMEMAP` - `+map` - the map to host when the server starts - `gm_flatgrass`
- `WORKSHOPID` - `+host_workshop_collection` - the Workshop ID of the addon collection to host
- `LOGINTOKEN` - `+sv_setsteamaccount` - the login token for the Steam Game Server Account

## Technical
This project uses `cm2network/steamcmd:root` as a base image ([GitHub](https://github.com/CM2Walki/steamcmd), [Docker Hub](https://hub.docker.com/r/cm2network/steamcmd)) and takes some inspiration from `zennoe/gmod-css-tf2:latest` ([GitHub](https://github.com/Zennoe/docker-gameservers), [Docker Hub](https://hub.docker.com/r/zennoe/gmod-css-tf2)). This project is not affiliated with Facepunch Studios or Valve. I had nothing to do with the creation of the Half Life games, the Counter Strike games, Garry's Mod, or SRCDS. I just built something around those things.

### Base Project pages
- [GitHub](https://github.com/Phyremaster/easy-gmod)
- [Docker Hub](https://hub.docker.com/r/phyremaster/easy-gmod)
