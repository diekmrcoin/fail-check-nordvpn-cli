#!/bin/bash
OUTPUT_FOLDER="$HOME/.nordvpn-check-status"
if [[ ! -d $OUTPUT_FOLDER ]]
then
    mkdir $OUTPUT_FOLDER
fi

SUCCESS_FILE="$OUTPUT_FOLDER/success.txt"
ERROR_FILE="$OUTPUT_FOLDER/error.txt"

DATE=$(date +"%Y-%m-%d %T")
echo $DATE >> $SUCCESS_FILE
echo $DATE >> $ERROR_FILE

if http -h www.google.es >> $SUCCESS_FILE 2>> $ERROR_FILE; then
    echo "Connection up" >> $SUCCESS_FILE
else
    nordvpn c 1> /dev/null 2>> $ERROR_FILE
    echo "Reconnected!" >> $SUCCESS_FILE
fi

echo "---" >> $SUCCESS_FILE
echo "---" >> $ERROR_FILE
