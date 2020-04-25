#!/bin/bash
#$(acpi) > $STATE
while read CHARGE
     do 
    case   ${CHARGE:-0} in
    "Battery 1"*)
    echo $CHARGE 
    ;;
     esac
done  < state