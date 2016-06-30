#!/bin/bash

source /home/qy/Dropbox/dataENF/blmg/common_path.sh

DEST_FILE=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_nyse.csv
DEST_FILE_SIMPLE1=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_nyse_simple.csv
DEST_FILE_SIMPLE2=/home/qy/Dropbox/nirvana/conf/trading_hours_us_simple.csv

###################################################
echo "Symbol,FromDate,TradingHours" > $DEST_FILE
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE1
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE2

for i in $SYMBOLLIST_USSTK_1 $SYMBOLLIST_USSTK_2 $SYMBOLLIST_USSTK_3 $SYMBOLLIST_USSTK_4
do
    ##################################################
    echo "$i,1900-01-01,000000,235959,040000"               >> $DEST_FILE
    echo "$i,2015-03-08,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2015-03-09,000000,040000,213000,235959,040000" >> $DEST_FILE
    echo "$i,2015-11-01,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2015-11-02,000000,050000,223000,235959,050000" >> $DEST_FILE

    echo "$i,2015-11-26,000000,050000,050000"               >> $DEST_FILE
    echo "$i,2015-11-27,223000,235959,235959"               >> $DEST_FILE
    echo "$i,2015-11-28,000000,020000,223000,235959,020000" >> $DEST_FILE
    echo "$i,2015-11-29,000000,050000,223000,235959,050000" >> $DEST_FILE

    echo "$i,2015-12-25,000000,020000,020000"               >> $DEST_FILE
    echo "$i,2015-12-26,223000,235959,235959"               >> $DEST_FILE
    echo "$i,2015-12-27,000000,050000,223000,235959,050000" >> $DEST_FILE

    echo "$i,2016-03-13,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2016-03-14,000000,040000,213000,235959,040000" >> $DEST_FILE
    ##################################################

    ##################################################
    echo "$i,1900-01-01,000000,040000,213000,235959,040000" >> $DEST_FILE_SIMPLE1
    echo "$i,1900-01-01,000000,040000,213000,235959,040000" >> $DEST_FILE_SIMPLE2
    ##################################################
done
