#!/bin/bash

if [[ $# -eq 0 ]]
then
    echo "arg 1 : [1 / 2] the number of digits for year"
    exit
fi

DEST_FILE=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_sgx.csv
SYMBOL_LIST="XU CN"
CONTRACT_MTH_CODE="F G H J K M N Q U V X Z"

###################################################
echo "Symbol,FromDate,TradingHours" > $DEST_FILE


if [[ $1 -eq 1 ]]
then
    for i in $SYMBOL_LIST
    do
        for j in $CONTRACT_MTH_CODE
        do
            for k in $(seq 0 9)
            do
                echo "$i""$j""$k"",2000-01-01,000000,020000,090000,160000,164000,235959,160000"   >> $DEST_FILE
            done
        done
    done

elif [[ $1 -eq 2 ]]
then
    for i in $SYMBOL_LIST
    do
        for j in $CONTRACT_MTH_CODE
        do
            for k in $(seq 0 20)
            do
                if [[ $k -lt 10 ]]
                then
                    k="0"$k
                fi
                echo "$i""$j""$k"",2000-01-01,000000,020000,090000,160000,164000,235959,160000"   >> $DEST_FILE
            done
        done
    done
fi

