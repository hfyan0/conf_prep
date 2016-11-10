#!/bin/bash

source /home/qy/Dropbox/dataENF/blmg/common_path.sh

DEST_FILE=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_nyse.csv
DEST_FILE_TMP=/tmp/trading_hours_nyse_tmp
DEST_FILE_SIMPLE1=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_nyse_simple.csv
DEST_FILE_SIMPLE2=/home/qy/Dropbox/nirvana/conf/trading_hours_us_simple.csv

###################################################
echo "Symbol,FromDate,TradingHours" > $DEST_FILE
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE1
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE2

for i in $SYMBOLLIST_USSTK_1 $SYMBOLLIST_USSTK_2 $SYMBOLLIST_USSTK_3 $SYMBOLLIST_USSTK_4 $SYMBOLLIST_USIDX
do
    ##################################################
    echo "$i,1900-01-01,000000,235959,040000"               >> $DEST_FILE

    ###################################################
    # HOLIDAY                     | 2016                                       | 2017
    # New Years Day               | January 1                                  | January 1 (Observed Monday, January 2)
    # Martin Luther King, Jr. Day | January 18                                 | January 16
    # Washington's Birthday       | February 15                                | February 20
    # Good Friday                 | March 25                                   | April 14
    # Memorial Day                | May 30                                     | May 29
    # Independence Day            | July 4                                     | July 4**
    # Labor Day                   | September 5                                | September 4
    # Thanksgiving Day            | November 24*                               | November 23*
    # Christmas                   | December 25 (Observed Monday, December 26) | December 25

    # *Each market will close early at 1:00 p.m. (1:15 p.m. for eligible options) on Friday, November 25, 2016 and Friday, November 24, 2017 (the day after Thanksgiving). Crossing Session orders will be accepted beginning at 1:00 p.m. for continuous executions until 1:30 p.m. on these dates. All times are Eastern.
    # **Each market will close early at 1:00 p.m. (1:15 p.m. for eligible options) on Monday, July 3, 2017. Crossing Session orders will be accepted beginning at 1:00 p.m. for continuous executions until 1:30 p.m. on this date. All times are Eastern.

    ###################################################

    echo "$i,2015-11-26,000000,050000,050000"               >> $DEST_FILE
    echo "$i,2015-11-27,223000,235959,235959"               >> $DEST_FILE
    echo "$i,2015-11-28,000000,020000,223000,235959,020000" >> $DEST_FILE
    echo "$i,2015-11-29,000000,050000,223000,235959,050000" >> $DEST_FILE

    ###################################################
    # Christmas
    ###################################################
    echo "$i,2015-12-25,000000,020000,020000"               >> $DEST_FILE
    echo "$i,2015-12-26,223000,235959,235959"               >> $DEST_FILE
    echo "$i,2015-12-27,000000,050000,223000,235959,050000" >> $DEST_FILE
    # 2016 no need

    ###################################################
    # thanksgiving
    ###################################################
    echo "$i,2016-11-25,000000,020000,223000,235959,020000" >> $DEST_FILE
    echo "$i,2016-11-26,000000,050000,223000,235959,050000" >> $DEST_FILE

    echo "$i,2017-11-24,000000,020000,223000,235959,020000" >> $DEST_FILE
    echo "$i,2017-11-25,000000,050000,223000,235959,050000" >> $DEST_FILE
    ###################################################

    ###################################################
    # day light saving
    ###################################################
    echo "$i,2015-03-08,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2015-03-09,000000,040000,213000,235959,040000" >> $DEST_FILE
    echo "$i,2016-03-13,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2016-03-14,000000,040000,213000,235959,040000" >> $DEST_FILE
    echo "$i,2017-03-12,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2017-03-13,000000,040000,213000,235959,040000" >> $DEST_FILE
    echo "$i,2018-03-11,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2018-03-12,000000,040000,213000,235959,040000" >> $DEST_FILE
    echo "$i,2019-03-10,000000,050000,213000,235959,050000" >> $DEST_FILE
    echo "$i,2019-03-11,000000,040000,213000,235959,040000" >> $DEST_FILE

    echo "$i,2015-11-01,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2015-11-02,000000,050000,223000,235959,050000" >> $DEST_FILE
    echo "$i,2016-11-06,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2016-11-07,000000,050000,223000,235959,050000" >> $DEST_FILE
    echo "$i,2017-11-05,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2017-11-06,000000,050000,223000,235959,050000" >> $DEST_FILE
    echo "$i,2018-11-04,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2018-11-05,000000,050000,223000,235959,050000" >> $DEST_FILE
    echo "$i,2019-11-03,000000,040000,223000,235959,040000" >> $DEST_FILE
    echo "$i,2019-11-04,000000,050000,223000,235959,050000" >> $DEST_FILE
    ##################################################

    ##################################################
    # simple trading hours
    ##################################################
    echo "$i,1900-01-01,000000,040000,213000,235959,040000" >> $DEST_FILE_SIMPLE1
    echo "$i,1900-01-01,000000,040000,213000,235959,040000" >> $DEST_FILE_SIMPLE2
    ##################################################
done

cat $DEST_FILE | sort > $DEST_FILE_TMP
cat $DEST_FILE_TMP > $DEST_FILE
rm -f $DEST_FILE_TMP
