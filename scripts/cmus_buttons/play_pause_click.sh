#!/bin/bash
status=$(cmus-remote -C status)
case   ${status:-0} in

0)
echo " "   
;;

*"playing"*)
cmus-remote --pause
;;

*"status paused"*)
cmus-remote --play
;;

#*"stopped"*)
#cmus-remote --play
#;;

esac
