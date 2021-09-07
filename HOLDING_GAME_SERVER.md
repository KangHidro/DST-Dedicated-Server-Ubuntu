Requirement VPS: Ubuntu 20 LTS, 02 chip N2/N2D, 8GB RAM, 15GB SSD, allow HTTP/HTTPS, Nearest region

Command:

```
sudo passwd (Change Admin password)

su

dpkg --add-architecture i386;

apt update && apt upgrade

apt install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget screen unzip

/sbin/sysctl -w net.ipv4.tcp_keepalive_time=60 net.ipv4.tcp_keepalive_intvl=60 net.ipv4.tcp_keepalive_probes=5

timedatectl set-timezone Asia/Ho_Chi_Minh

apt install firefox ubuntu-desktop --no-install-recommends

add-apt-repository multiverse

apt install lib32gcc1

apt install xrdp

adduser xrdp ssl-cert

systemctl restart xrdp

ufw allow from 192.168.33.0/24 to any port 3389

ufw allow 3389

useradd -m steam

adduser steam sudo

sudo passwd steam

exit
```

Connect VPS via RDP, Account steam

Turn off auto lock screen, Blank screen delay

Open firefox + download steam

`sudo dpkg -i "/home/steam/Downloads/steam_latest.deb"`

Open Steam app or run in Terminal: `steam`

config game all, create game preset (on VPS or your PC then copy to VPS)

Ctrl + H to Show hidden + dot file/folder

Logout Steam

Shutdown server

Edit VPS to Chip E2, Type e2-medium (02 vCPU, 4GB RAM)

Create VPS Machine Images

Create new cheaper VPS from Machine Images: 02 E2 chipset, 4GB RAM, default region

Connect VPS via RDP

Login steam, copy config, holding game
