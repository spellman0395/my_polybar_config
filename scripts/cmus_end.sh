#!/bin/bash
status=$(cmus-remote -C status)
case   ${status:-0} in
0)

 echo " 流 "   
;;
*"playing"*)
prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep artist -m 1| cut -c 12-))
song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))

position=$(cmus-remote -C status | grep position | cut -c 10-)
minutes1=$(prepend_zero $(($position / 60)))
seconds1=$(prepend_zero $(($position % 60)))

duration=$(cmus-remote -C status | grep duration | cut -c 10-)
minutes2=$(prepend_zero $(($duration / 60)))
seconds2=$(prepend_zero $(($duration % 60)))

echo -n "$artist  -  $song [$minutes1:$seconds1 / $minutes2:$seconds2]"
memory="$artist  -  $song [$minutes1:$seconds1 / $minutes2:$seconds2"
;;
*"status paused"*)
echo -n $memory
;;
*"stopped"*)
echo "player on & does nothing"
;;


esac
