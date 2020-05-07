#!/bin/bash
acpi > state
sed  -i '/Battery 0/d' ./state
while read CHARGE
     do 
   case   ${CHARGE:-0} in
    "Battery 1: Unknown"*)
     PROC=$(cut -c 21-24 state)
        case   ${PROC:-0} in
        *10%*)
        notify-send "LOW ENERGY"
        ;;
        esac
     echo " $PROC"
    ;;

    
    "Battery 1: Charg"*)
    PROC=$(cut -c 22-25 state)
    echo " $PROC"
    ;;


    "Battery 1: Disch"*)
    PROC=$(cut -c 25-28 state)
         case   ${PROC:-0} in
        *10%*)
        notify-send "LOW ENERGY"
        ;;
        esac
    echo " $PROC"
    ;;


    "Battery 1: Full"*)
    PROC=$(cut -c 18-21 state)
    echo " $PROC"
    ;;
    esac
done  < state
