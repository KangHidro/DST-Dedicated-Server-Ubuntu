# DST-Dedicated-Server-Ubuntu

_For Windows:_ https://dont-starve-game.fandom.com/vi/wiki/Dedicated_server

`sudo passwd` (change passwd)

`su`

`dpkg --add-architecture i386;`

`apt update && apt upgrade`

`apt install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget screen unzip`

`/sbin/sysctl -w net.ipv4.tcp_keepalive_time=60 net.ipv4.tcp_keepalive_intvl=60 net.ipv4.tcp_keepalive_probes=5`

`mkdir -p ~/steamcmd/ && cd ~/steamcmd/`

`wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && tar -xvzf steamcmd_linux.tar.gz`

https://accounts.klei.com/ => creare token

Create a game from your PC

Open `Documents/Klei/DoNotStarveTogether/`

Open game Folder (Cluster_xxx)

Run "export-workshop.au3" to generate "dedicated_server_mods_setup.lua"

Compress as ZIP, (With parent folder)

Upload, default to /home/<username>

Now you currently are in /home/<username>

then Unzip: `unzip <file>.zip`; Eg. `unzip d.zip`

And copy to `~/.klei/DoNotStarveTogether`:

`mkdir -p ~/.klei/DoNotStarveTogether/Cluster_1`

`cp -a d/* ~/.klei/DoNotStarveTogether/Cluster_1`

`cp d/dedicated_server_mods_setup.lua $HOME/dontstarvetogether_dedicated_server/mods`

`cd ~`

`vi ~/run_dedicated_servers.sh`

```
#//////////////////////////////////////////////////////////////////////
#// Change cluster_name variable
#//////////////////////////////////////////////////////////////////////

#!/bin/bash

steamcmd_dir="$HOME/steamcmd"
install_dir="$HOME/dontstarvetogether_dedicated_server"
cluster_name="Cluster_1"
dontstarve_dir="$HOME/.klei/DoNotStarveTogether"

function fail()
{
	echo Error: "$@" >&2
	exit 1
}

function check_for_file()
{
	if [ ! -e "$1" ]; then
		fail "Missing file: $1"
	fi
}

cd "$steamcmd_dir" || fail "Missing $steamcmd_dir directory!"

check_for_file "steamcmd.sh"
check_for_file "$dontstarve_dir/$cluster_name/cluster.ini"
check_for_file "$dontstarve_dir/$cluster_name/cluster_token.txt"
check_for_file "$dontstarve_dir/$cluster_name/Master/server.ini"
check_for_file "$dontstarve_dir/$cluster_name/Caves/server.ini"

./steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 +quit

check_for_file "$install_dir/bin"

cd "$install_dir/bin" || fail

run_shared=(./dontstarve_dedicated_server_nullrenderer)
run_shared+=(-console)
run_shared+=(-cluster "$cluster_name")
run_shared+=(-monitor_parent_process $$)

"${run_shared[@]}" -shard Caves  | sed 's/^/Caves:  /' &
"${run_shared[@]}" -shard Master | sed 's/^/Master: /'

#//////////////////////////////////////////////////////////////////////
```

Add admin to Cluster:

`echo "KU_L3IC3_x6" >>$HOME/.klei/DoNotStarveTogether/Cluster_1/adminlist.txt`  #Kang

`chmod 777 $HOME/.klei/DoNotStarveTogether/Cluster_1/adminlist.txt`

`chmod u+x ~/run_dedicated_servers.sh`

****** START ******

`screen -S "w"`

`~/run_dedicated_servers.sh`

********************

Detach screen: `Ctrl A` + `Ctrl D`

Attach screen: `screen -x "w"`


--------------------------------
Update mods only:

`$HOME/dontstarvetogether_dedicated_server/bin/dontstarve_dedicated_server_nullrenderer -only_update_server_mods`


whitelist.txt

Icon:

Arcane: 󰀀

Beefalo: 󰀁

Chest: 󰀂

Chester: 󰀃

Cockpot: 󰀄

Eyeball: 󰀅

Fake Teeth: 󰀆

Farm: 󰀇

Fire: 󰀈

Ghost: 󰀉

Grave: 󰀊

Hambat: 󰀋

Hammer: 󰀌

Heart: 󰀍

Hunger: 󰀎

Lightbulb: 󰀏

Pig: 󰀐

Poop: 󰀑

Red Gem: 󰀒

Sanity: 󰀓

Science Machine: 󰀔

Skull: 󰀕

Top Hat: 󰀖

Web: 󰀗

Torch: 󰀛

Gold Nugget: 󰀚

Swords: 󰀘

Muscle: 󰀙

c_announce("Hello!")

c_regenerateworld()

c_supergodmode("KU_3RvV9eZM")

TheNet:Kick(KU_qE7e88Y0)

ThePlayer.AnimState:SetMultColour(0,0,0,0)
