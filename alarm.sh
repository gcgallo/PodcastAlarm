#!/bin/bash

usage(){
  echo `basename $0`: ERROR: $* 1>&2
  echo usage: `basename $0` '-a to add a new alarm | -s to set alarm |  -t to trigger | -k to kill alarm |  -z to snooze'
  exit 1 
}

# add_alarm(){
# choose alarm number and channel
# echo 1
# }

set_alarm(){
#crontab choose time day
  echo $alarm_num
  echo $alarm_url
  echo $1
  hr=$(echo $1 | awk -F: '{ print $1 }' | xargs echo)
  min=$(echo $1 | awk -F: '{ print $2 }' | xargs echo) 
  echo $min
  echo $hr
  (crontab -l 2>/dev/null; echo "$min $hr * * * /home/gg/alarm.sh -a $alarm_num -u $alarm_url -t") | crontab -
}

list_alarms(){
#list all currently set alarms with alarm number?
   crontab -l
}

trigger_alarm(){
  youtube-dl --playlist-end 1 -o "~/PodcastAlarm/%(title)s.%(ext)s" -x $alarm_url
  mplayer *.opus &
  echo $! > ./alarm_$alarm_num.pid
}

kill_alarm(){
  kill $(cat alarm_$1.pid)
  rm ./alarm_$1.pid
  rm ./*.opus
}

snooze(){

  read -n 1 -s -p "Press any key to continue"

}

#delete_alarm(){
  #delete alarm specified by alarm number
#}

while getopts "a:u:s:ltk:zd:" opt; do
  case $opt in
     a ) alarm_num=$OPTARG;;
     u ) alarm_url=$OPTARG;; 
     s ) set_alarm $OPTARG;;
     l ) list_alarms;;
     t ) trigger_alarm;;
     k ) kill_alarm $OPTARG;;
     z ) snooze;;
     d ) delete_alarm $OPTARG;;
     * ) usage;;
  esac
done
