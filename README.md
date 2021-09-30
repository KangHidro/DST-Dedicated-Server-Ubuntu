# DST-Dedicated-Server-Ubuntu-VPS-Google-Cloud

_Dành cho VPS Windows:_ https://dont-starve-game.fandom.com/vi/wiki/Dedicated_server

## CHUẨN BỊ

1. Một thẻ Visa/MasterCard tài khoản tầm 30k.
- Nên dùng thẻ Debit và chỉ để 30k trong tài khoản để tránh trường hợp trừ tiền oan do bất cẩn.
- Nếu làm theo hướng dẫn này thì chắc chắn không bị trừ tiền oan.
- Nếu bạn muốn tìm một loại thẻ chi phí ít nhất thì mình xin giới thiệu thẻ CAKE.
- Khi đăng ký VPS sẽ bị trừ $1 để verify tài khoản, sau đó google sẽ trả lại.
<details>
 <summary><b><i>Bạn muốn biết chi tiết về thẻ CAKE? Click để xem!</i></b></summary>
 
 - Thẻ CAKE miễn mọi loại phí, đặc biệt là phí thường niên, các thẻ Visa/MasterCard khác mất mỗi năm tầm 100k dù để không, không dùng.
 - Đăng ký tài khoản eKyc online không cần ra ngân hàng.
 - Sau khi đăng ký tài khoản thành công nhớ đăng ký mở thẻ ngay vì mất tầm 7 ngày thẻ mới được gửi về nhà nhé!
 - Chi tiết ưu đãi xem tại: https://gist.github.com/KangHidro/e4fc3d46ffdb98357eb9db8fa8b317fb#các-lợi-ích-cụ-thể

</details>

2. Ảnh CMND/CCCD của chủ thẻ Visa/MasterCard để Google xác minh danh tính.

3. Ảnh chụp mặt trước của thẻ Visa/MasterCard, PHẢI che 12 số đầu, chỉ để lại 4 số cuối, để Google xác minh không phải thẻ ảo.

4. Một tài khoản Google cho mỗi 3 tháng (vì mỗi thẻ dùng Free được 3 tháng).

## ĐĂNG KÝ VPS

1. Đăng nhập: https://console.cloud.google.com/

2. Tạo 1 project tên gì cũng được: https://console.cloud.google.com/projectcreate

3. Đăng ký Free trial ($300/90d): https://console.cloud.google.com/freetrial/signup/tos

4. Upload ảnh CMND/CCCD, ảnh thẻ Visa/MasterCard đã chuẩn bị, chờ 2-3 ngày để được duyệt.

5. Bật API (Enable): https://console.cloud.google.com/marketplace/product/google/compute.googleapis.com

6. Tạo VM Machine: https://console.cloud.google.com/compute/instancesAdd

Cấu hình như sau:

> Region:  asia-southeast1 (Singapore) (Gần VN, đỡ lag)
>
> Series: N2 hoặc N2D (phải chọn N2/N2D để đỡ lag)
> 
> Machine type:  n2-standard-2 (2 vCPU, 8GB Memory)
>
> Boot disk: Ubuntu - Ubuntu 18.04 LTS
>
> Firewall: Allow HTTP traffic + Allow HTTPS traffic
>
> Giá ~$75/tháng, vậy là 3 tháng không tới $300, không sợ bị hớ tiền

7. Create!

## THỰC HIỆN

1. Tại Trang "VM instances", bấm "SSH" của máy ảo mới tạo

2. Gõ lần lượt các lệnh sau:

`sudo passwd` (phải đổi password server để tránh bị hack mất)

`Nhập password, màn hình sẽ không hiện gì nhưng nó vẫn vào đấy`

`su`

`Nhập password mới đổi xong`

`dpkg --add-architecture i386;`

`apt update && apt upgrade`

`apt install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget screen unzip`

`/sbin/sysctl -w net.ipv4.tcp_keepalive_time=60 net.ipv4.tcp_keepalive_intvl=60 net.ipv4.tcp_keepalive_probes=5`

`mkdir -p ~/steamcmd/ && cd ~/steamcmd/`

`wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && tar -xvzf steamcmd_linux.tar.gz`

`Khoan chưa tắt SSH vội`

3. Đăng nhập Klei và tạo Token cho server https://accounts.klei.com/

4. Tạo game trên máy của bạn, thêm mods các thứ...

5. Mở thư mục trên máy bạn: `Documents/Klei/DoNotStarveTogether/`

6. Copy thư mục (`Cluster_x`) ra ngoài Desktop (Thư mục của game mới tạo, cẩn thận nhầm với game đang chơi dở nhé)

7. (Nên đổi tên thư mục `Cluster_x` thành `d` để làm tiếp theo hướng dẫn này luôn cho khỏi nhầm). Vào trong `Master` (và `Caves` nếu có) xoá thư mục `save` và `backup`

8. Tải file `export-workshop.exe` về, bỏ vào bên trong `Master` hoặc chỗ nào có file `modoverrides.lua`

9. Chạy `export-workshop.exe`, nó hiện ra số lượng mods bạn đã dùng, và tạo file `dedicated_server_mods_setup.lua`

10. Đem `dedicated_server_mods_setup.lua` bỏ ra **bên ngoài** thư mục `Master`

11. Vẫn ở bên ngoài thư mục `Master`, tạo file `cluster_token.txt`, mở ra và dán token mới tạo lúc nãy trên Klei vào, lưu lại

12. Thoát ra và phải chuột vào thư mục `d`, chọn `Send to` → `Compressed (zipped) folder`

13. Quay lại SSH, bấm hình bánh răng chấm ở góc trên phải, chọn `Upload file`, upload file `d.zip` lúc nãy lên

14. Gõ lần lượt các lệnh sau:

`exit`

`su`

`Nhập password`

`unzip d.zip`

`mkdir -p ~/.klei/DoNotStarveTogether/Cluster_1`

`cp -a d/* ~/.klei/DoNotStarveTogether/Cluster_1`

`cp d/dedicated_server_mods_setup.lua $HOME/dontstarvetogether_dedicated_server/mods`

`cd ~`

`vi ~/run_dedicated_servers.sh`

**Copy các dòng sau và dán vào:**

Chú ý: Nếu game không có `Caves` thì gõ dấu `#` đằng trước 02 dòng mình đánh dấu `#####CAVES#####`

```
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
check_for_file "$dontstarve_dir/$cluster_name/Caves/server.ini" #####CAVES#####

./steamcmd.sh +force_install_dir "$install_dir" +login anonymous +app_update 343050 +quit

check_for_file "$install_dir/bin"

cd "$install_dir/bin" || fail

run_shared=(./dontstarve_dedicated_server_nullrenderer)
run_shared+=(-console)
run_shared+=(-cluster "$cluster_name")
run_shared+=(-monitor_parent_process $$)

"${run_shared[@]}" -shard Caves  | sed 's/^/Caves:  /' & #####CAVES#####
"${run_shared[@]}" -shard Master | sed 's/^/Master: /'

#//////////////////////////////////////////////////////////////////////
```

15. Thêm bạn làm admin của game (bạn cần biết `Klei_ID` của mình):

`echo "KU_L3IC3_x6" >>$HOME/.klei/DoNotStarveTogether/Cluster_1/adminlist.txt`  #Kang

Trong đó `KU_L3IC3_x6` là ID của bạn

`chmod 777 $HOME/.klei/DoNotStarveTogether/Cluster_1/adminlist.txt`

`chmod u+x ~/run_dedicated_servers.sh`

16. Chạy server:

Tạo Screen: `screen -S "w"`

Chạy Server: `~/run_dedicated_servers.sh`

Thoát ra khỏi Screen (và chạy ngầm): Bấm `Ctrl A` + `Ctrl D`

Đăng nhập vào Screen tên "w": `screen -x "w"`

17. Cập nhật game, mods các thứ:

`su`

Đăng nhập vào screen và gõ `c_shutdown()` để tắt game.

Sau đó chạy lại `~/run_dedicated_servers.sh` là được.

## XOÁ VPS

Đặt lịch nhắc trước 1 ngày, hết thời hạn 90 ngày vào tài khoản Google cloud, xoá VPS, xoá billing, gỡ thẻ. Tạo tài khoản mới dùng lại thẻ cũ được.

```
1. Xoá hết tất cả các VPS đang có

2. Xoá Billing Account tại https://console.cloud.google.com/billing/linkedaccount

3. Remove Payment Method
```

## ICON TRONG GAME & MỘT SỐ THỨ LINH TINH:

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
