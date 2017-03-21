#!/bin/bash

usage(){
  echo `basename $0`: ERROR: $* 1>&2
  echo usage: `basename $0` '-a to add a new alarm | -s to set alarm |  -t to trigger | -k to kill alarm |  -z to snooze'
  exit 1 
}

add_alarm(){
#choose alarm number and channel
}

set_alarm(){
#crontab choose time day
}

trigger_alarm(){
  youtube-dl --playlist-end 1 -x https://www.youtube.com/user/technewstoday
  mplayer *.opus &
  echo $! > ./technews.pid
}

kill_alarm(){
  kill $(cat alarm.pid)
  rm /home/gg/alarm/alarm.pid
  rm /root/*.opus
}

snooze(){
#crontab reset add x minutes default 10? or random?
}
while getopts "a:s:t:kz:" opt; do
  case $opt in
     a ) add_alarm;;
     s ) set_alarm;;
     t ) trigger_alarm;;
     k ) kill_alarm;;
     z ) snooze;;
     * ) usage;;
  esac
done
