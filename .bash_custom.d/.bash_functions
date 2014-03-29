h2d(){
  echo "ibase=16;${@^^}" | bc
}
d2h(){
  echo "obase=16;$@" | bc
}
pickline(){
  head -n $1 $2 | tail -n 1
}
tellme(){
  grep $1 ~/PGround/Ref/Linux_Command
}
bigguy(){
  echo "du -ah | sort -h | tail"
  du -ah | sort -h | tail
}
restoremytime(){
  echo "kill all unity-panel-service"
  killall unity-panel-service
}
showkernelerrors(){
  echo "dmesg -xT -l err,crit,emerg"
  dmesg -xT -l err,crit,emerg
}
syncmytime(){
  echo "sudo ntpdate ntp.ubuntu.com"
  sudo ntpdate ntp.ubuntu.com
}
getmyfield(){
  echo 'column -t | cut -d' ' -f$1'
  column -t | cut -d' ' -f$1
}
alarmme(){
  sleep $1 && notify-send $2 &
}
unmuteall(){
  for i in Master Headphone PCM Front Surround Center LFE Side; do
    amixer -c 0 set "$i" playback unmute
  done &>/dev/null
}
extractme () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar -jxvf $1 ;;
            *.tar.gz) tar -zxvf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.dmg) hdiutil mount $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar -xvf $1 ;;
            *.tbz2) tar -jxvf $1 ;;
            *.tgz) tar -zxvf $1 ;;
            *.zip) unzip $1 ;;
            *.ZIP) unzip $1 ;;
            *.pax) cat $1 | pax -r ;;
            *.pax.Z) uncompress $1 --stdout | pax -r ;;
            *.Z) uncompress $1 ;;
            *) echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

unpackme(){
 fn=$(echo "$1" | tr '[:upper:]' '[:lower:]')
 echo "$fn"
 case "$fn" in
        *".tgz"|*.tar.gz)
        	echo "Unpacking targz or tgz";
        	tar xzvf $fn;;
        *.lzh|*.lha)
        	echo "Unpacking lzh";
        	lha x $fn;;
        *.zip)
        	echo "Unpacking zip";
		unzip $fn;;
        *.tar.bz2|*.tbz)
        	echo "Unpacking tar.bz2 or tbz";
        	tar xjvf $fn;;
        *.bz2)
        	echo "Unpacking bz2";
        	bzip2 -d $fn;;
        *.tar.xz)
        	echo "Unpacking tar.xz";;
        *.7z)
        	echo "Unpacking 7z";
		7z x $fn;;
        *.rar)
        	echo "Unpacking rar";;
        *.tar.Z)
        	echo "Unpacking tar.z";;
        *.tar.bz2|*.tbz2)
        	echo "Unpacking tar.bz2 or tbz2";;
        *.gz)
        	echo "Unpacking gz";
        	gunzip -d $fn;;
        *.z)
        	echo "Unpacking z";;
        *.tar)
        	echo "Unpacking tar";
        	tar xvf $fn;;
        *.arj)
        	echo "Unpacking arj";;
        *.cab)
        	echo "Unpacking cab";;
 esac
}

findPid () {
	 echo 'lsof -t -c "$@"'
	 lsof -t -c "$@" ; 
}
listmyusb(){
	echo 'sudo fdisk -ls'
	sudo fdisk -ls
}
ejectmyusb(){
	echo 'udisks --detach /dev/sdb'
	udisks --detach /dev/sdb
}
playmovie(){
	nohup mplayer $1 >/dev/null 2>&1& 
}

# Play with wikipedia
askwikipedia(){
	dig +short txt "$1".wp.dg.cx
}

# Play with  commandlinefu.com
askcommandlinefu(){
	 curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext"
} 

colormycommand()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1
export MOZILLA_FIVE_HOME=/usr/lib/firefox
PATH="$PATH":$HOME/mycommand
