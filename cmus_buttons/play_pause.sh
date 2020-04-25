#!/bin/bash
status=$(cmus-remote -C status)
#status2="*reset*"
#if [ "$status" == "$status2" ]  ; then echo " " ; else 
case   ${status:-0} in

0)
 echo " "   
;;
*playing*)
echo " "
;;
*"status paused"*)
echo " "
;;
*"stopped"*)
echo " "
;;
*"reset"*)
echo "exiting"
;;
esac
#fi
