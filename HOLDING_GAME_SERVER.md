Requirement VPS: Ubuntu 20 LTS, 02 chip N2/N2D, 8GB RAM, 15GB SSD, allow HTTP/HTTPS, Nearest region

Command:

```
sudo apt update

sudo timedatectl set-timezone Asia/Ho_Chi_Minh

sudo apt install firefox ubuntu-desktop --no-install-recommends

sudo add-apt-repository multiverse

sudo dpkg --add-architecture i386

sudo apt install lib32gcc1

sudo apt install xrdp

sudo adduser xrdp ssl-cert

sudo systemctl restart xrdp

sudo ufw allow from 192.168.33.0/24 to any port 3389

sudo ufw allow 3389

sudo useradd -m steam

sudo adduser steam sudo

sudo passwd steam
```

Connect VPS via RDP

Open firefox + download steam

`sudo dpkg -i "/home/steam/Downloads/steam_latest.deb"`

turn off auto lock screen

config game all, create game preset (on VPS or your PC then copy to VPS)

Ctrl + H to Show hidden + dot file/folder

Logout Steam

Shutdown server

create VPS Machine Images

Create new cheaper VPS from Machine Images: 02 E2 chipset, 4GB RAM, default region

Connect VPS via RDP

Login steam, copy config, holding game