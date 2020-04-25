#!/bin/bash
acpi > state
sed  -i '/Battery 0/d' ./state
while read CHARGE
     do 
   case   ${CHARGE:-0} in
    "Battery 1: Unknown"*)
     echo "  $(cut -c 21-24 state)"
    ;;
    
    "Battery 1: Charg"*)
    echo "  $(cut -c 22-25 state)"
    ;;

    "Battery 1: Disch"*)
    echo "  $(cut -c 25-28 state)"
    ;;

    "Battery 1: Full"*)
    echo "  $(cut -c 18-21 state)"
    ;;
    esac
done  < state
