#!/bin/bash

if [[ $# -eq 0 ]]
then
    echo "arg 1 : [1 / 2] the number of digits for year"
    exit
fi

SRC_FOLDER=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/
DEST_FOLDER=/home/qy/Dropbox/nirvana/conf/
CONTRACT_MTH_CODE="F G H J K M N Q U V X Z"

$SRC_FOLDER/trading_hours_hkfe_create.sh   $1
$SRC_FOLDER/trading_hours_hkse_create.sh
$SRC_FOLDER/trading_hours_nyse_create.sh
$SRC_FOLDER/trading_hours_sgx_create.sh    $1
$SRC_FOLDER/trading_hours_cffex_create.sh


cat $SRC_FOLDER/trading_hours_hkfe.csv  | grep Symbol | uniq                             > $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_hkfe.csv  | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_hkse.csv  | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_cme.csv   | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_nyse.csv  | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_sgx.csv   | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
cat $SRC_FOLDER/trading_hours_cffex.csv | sort | uniq | grep -v Symbol | sed '/^$/d'    >> $DEST_FOLDER/trading_hours.csv
