#!/bin/bash

DEST_FILE=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_hkse.csv
DEST_FILE_SIMPLE1=/home/qy/Dropbox/nirvana/conf_prep/trading_hours/trading_hours_hkse_simple.csv
DEST_FILE_SIMPLE2=/home/qy/Dropbox/nirvana/conf/trading_hours_hk_simple.csv

source /home/qy/Dropbox/dataENF/blmg/common_path.sh
SYMBOLLIST_HK2=$(echo $SYMBOLLIST_HKSTK_D1 | tr ' ' '\n' | awk '{printf("%05d\n",$1)}')
SYMBOLLIST_HKSTK_D1="HSI HHI $SYMBOLLIST_HKSTK_D1 $SYMBOLLIST_HK2"

###################################################
echo "Symbol,FromDate,TradingHours" > $DEST_FILE
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE1
echo "Symbol,FromDate,TradingHours" > $DEST_FILE_SIMPLE2

for i in $SYMBOLLIST_HKSTK_D1
do

    echo "$i,1900-01-01,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2007-08-10,143000,160000,160000"                 >> $DEST_FILE
    echo "$i,2007-08-11,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2007-12-24,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2007-12-25,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2007-12-31,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2008-01-01,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2008-02-06,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2008-02-07,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2008-06-25,143000,160000,160000"                 >> $DEST_FILE
    echo "$i,2008-06-26,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2008-12-24,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2008-12-25,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2008-12-31,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2009-01-01,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2009-09-15,143000,160000,160000"                 >> $DEST_FILE
    echo "$i,2009-09-16,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2009-12-24,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2009-12-25,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2009-12-31,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2010-01-01,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2010-12-24,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2010-12-25,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2010-12-31,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2011-01-01,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2011-02-02,100000,123000,123000"                 >> $DEST_FILE
    echo "$i,2011-02-03,100000,123000,143000,160000,160000"   >> $DEST_FILE
    echo "$i,2011-03-07,093000,120000,133000,160000,160000"   >> $DEST_FILE
    echo "$i,2012-03-05,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2012-07-24,130000,160000,160000"                 >> $DEST_FILE
    echo "$i,2012-07-25,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2012-12-24,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2012-12-25,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2012-12-31,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2013-01-01,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2013-04-08,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2013-05-22,130000,160000,160000"                 >> $DEST_FILE
    echo "$i,2013-05-23,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2013-09-23,130000,160000,160000"                 >> $DEST_FILE
    echo "$i,2013-09-24,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2013-12-24,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2013-12-25,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2013-12-31,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2014-01-01,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2014-01-30,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2014-01-31,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2014-09-16,130000,160000,160000"                 >> $DEST_FILE
    echo "$i,2014-09-17,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2014-12-24,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2014-12-25,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2014-12-31,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2015-01-01,093000,120000,130000,160000,160000"   >> $DEST_FILE
    echo "$i,2015-02-18,093000,120000,120000"                 >> $DEST_FILE
    echo "$i,2015-02-19,093000,120000,130000,160000,160000"   >> $DEST_FILE

    ##################################################
    echo "$i,1900-01-01,093000,120000,130000,160000,160000"   >> $DEST_FILE_SIMPLE1
    echo "$i,1900-01-01,093000,120000,130000,160000,160000"   >> $DEST_FILE_SIMPLE2
    ##################################################
done
