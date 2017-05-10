# PodcastAlarm  
(work in progress)
a shell script cron job for playing the lastest episode of a podcast at a specific time

# pre-requistes  
a reliable internet connection  
cron  
youtube-dl (pip install youtube-dl)   
ffmpeg (if using RasPi refer to https://www.jeffreythompson.org/blog/2014/11/13/installing-ffmpeg-for-raspberry-pi/)   
mplayer (sudo apt-get install mplayer) 

# instructions  

Choose a youtube channel, user, or playlist you would like 
to use as your alarm. Ideally, this channel would only upload 
one episode per day, or otherwise provides a playlist for the 
particular show you wish to use.   
 
Clone this repo  

cd into the repo  

Run the following command:  
```./alarm.sh -a <alarm_num> -u <alarm_url> -s <hr:min>```

where:  
```
alarm_num = abitrary identfier to distinguish multiple alarms  
alarm_url = url of desired youtube channel/playlist  
hr:min = time of day you wish to set alarm to trigger in 24hr format 
```
to kill a triggered alarm, run the following:  
```
./alarm.sh -k <alarm_num>
```
to permanently delete an alarm:  
```
./alarm.sh -d <alarm_num>
```
this may need to be run twice to work properly?  

# features to be added  
key press for killing alarm, instead having to type command   
press any key snooze feature, variable or predefined snooze time,
or maybe random snooze time???   
generalize to work with any podcast, not just ones available on youtube.  
integrate into RasPi MP3 project?  
