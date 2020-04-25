#!/bin/bash
bon=""
boff=""
bconn=""
bstatus=$(bluetoothctl show)
con="Controller 34:F3:9A:51:DE:56 (public)"
coff="No default controller available"

case   $bstatus  in

$con*)
echo "  $bon  "
;;

$cof*)
echo "  $boff  "
;;
esac


