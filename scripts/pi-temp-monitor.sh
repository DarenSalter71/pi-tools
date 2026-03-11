#!/usr/bin/env bash

LOGFILE = "/home/darensalteruk/scripts/pi-temp.log"
THRESHOLD = 75

# Get Temperature
TEMP = $(vcgencmd measure_temp | grep -o  '[0-9]*\.[0-9]*')

# Log Temperature
echo "$(date '+%Y-%m-%d %H:%M:%S'),${TEMP}" >> $LOGFILE

# Convert to Integer for  Comparison
TEMP_INT = ${TEMP%.*}

#Run Comparison

if [ "$TEMP_INT" -ge "$THRESHOLD" ]; then
	echo "WARNING WILL ROBINSON: Pi CPU Temperature is ${TEMP}(c)"
fi
