#!/bin/bash

#Change working directory
WORK_DIR="$(dirname "$(realpath "$0")")"
cd $WORK_DIR

source .settings.sh

# Input XML
xml_file="weather_overlay.xml"

# Getting forecast
weather_output=$(ansiweather -l $WEATHER_LOCATION -a false -f 1 | awk -F': ' '{print $NF}' | awk -F' ' '{print $1}' 2>/dev/null)

# Check it
if [ $? -ne 0 ]; then
    echo "Error inside ansiweather"
    weather_output="Weather data unavailable"
    exit 1
fi

# Edit $xml_file
sed -i "s|<displayText>.*</displayText>|<displayText>Temp: $weather_output</displayText>|" "$xml_file" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error while editing $xml_file whith forecast"
    exit 1
fi
echo "Forecast updated successfull with: $weather_output"

#Send string to camera using ISAPI
curl -k -u "${HIK_USER}:${HIK_PASS}" --digest -X PUT -d @$xml_file "https://${HIK_HOST}/ISAPI/System/Video/inputs/channels/1/overlays/text/1"
