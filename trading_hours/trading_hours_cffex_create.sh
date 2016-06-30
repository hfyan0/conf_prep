#!/bin/bash

DEST_FILE=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_cffex.csv
SYMBOL_LIST="IF IH IC"

###################################################
echo "Symbol,FromDate,TradingHours" > $DEST_FILE

for i in $SYMBOL_LIST
do
    for j in $(seq 1 12)
    do
        if [[ $j -lt 10 ]]
        then
            j="0"$j
        fi
        for k in $(seq 10 20)
        do
            echo "$i""$k""$j"",2010-01-01,091500,113000,130000,151500,151500"   >> $DEST_FILE
        done
    done
done
