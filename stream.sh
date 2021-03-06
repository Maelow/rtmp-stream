#!/bin/bash
timestamp=$( date +%T-%D )
echo -e "\n$timestamp" >> ./stream.log
exec >> ./stream.log 2>&1

AUDIOHZ=$1
ACH=$2
VFRAME=$3
VSIZE=$4
VINPUT=/dev/video0
URL=rtmp://a.rtmp.youtube.com/live2
KEY=$5


    avconv \
        -f alsa -ar "$AUDIOHZ" -ac "$ACH" -f s16le -i hw:1,0  \
#        -codec:a \
        -f video4linux2 -framerate "$VFRAME" -video_size "$VSIZE" -i "$VINPUT" \
 #       -codec:v \
        -f flv "$URL/$KEY" \