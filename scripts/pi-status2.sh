
#!/usr/bin/env bash


while true; do
   clear
   echo "============================="
   echo "==== Raspberry Pi Status ===="
   echo "CPU Temperature : $(vcgencmd measure_temp)"
   echo 
   top -bn1 |  grep "Cpu(s)" 
   echo
   free -h
   sleep 2
done

 
