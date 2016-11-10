#!/bin/bash

# source /home/qy/Dropbox/dataENF/blmg/common_path.sh
PATHTOPDNCONFIG=/home/qy/Dropbox/nirvana/conf/zsun_b2spy_pdn_ibmdi_iboti.ini

DMATHSCT=/home/qy/Dropbox/utilities/dmath
DFMTSCT=/home/qy/Dropbox/utilities/dfmt
ALLCORPACTIONFILE=/home/qy/Dropbox/nirvana/conf_prep/corp_action_prep/corp_action_prep.csv
ALLCORPACTIONFILE2=/home/qy/Dropbox/nirvana/conf_prep/corp_action_prep/corp_action_prep_2.csv
REPLACEUNKWNWITHPREVPROG=/home/qy/Dropbox/nirvana/conf_prep/corp_action_prep/getPrevVal.sh
TMPFILE1=/tmp/rf_backup_$(whoami)/tmp_chkLatestDivdUSStk_1
TMPFILE2=/tmp/rf_backup_$(whoami)/tmp_chkLatestDivdUSStk_2
TMPFILE3=/tmp/rf_backup_$(whoami)/tmp_chkLatestDivdUSStk_3

SYMBOLLIST=$(cat $PATHTOPDNCONFIG | grep SubscriptionSymbols | awk -F= '{print $2}' | tr ',' ' ' | tr '[:upper:]' '[:lower:]')

rm -f $ALLCORPACTIONFILE
touch $ALLCORPACTIONFILE

for sym in $SYMBOLLIST
do
    capital_sym=$(echo $sym | tr '[:lower:]' '[:upper:]')
    wget -w 2 -t 20 -T 20 --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -O $TMPFILE1 http://www.nasdaq.com/symbol/$sym/dividend-history
    cat $TMPFILE1 | grep Grid_exdate_ | sed -e 's/^.*exdate//' | sed -e 's/span>.*$//' | sed -e 's/<.*$//' | sed -e 's/^.*>//' | awk -F/ 'BEGIN{OFS="-"}{printf("%04d-",$3); printf("%02d-",$1); printf("%02d\n",$2)}' | sed -e "s/$/,$capital_sym/" > $TMPFILE2
    cat $TMPFILE1 | grep dividendhistoryGrid_CashAmount | sed -e 's/^.*CashAmount//' | sed -e 's/span>.*$//' | sed -e 's/<.*$//' | sed -e 's/^.*>//' | sed -e 's/$/,1/' > $TMPFILE3
    paste -d, $TMPFILE2 $TMPFILE3 >> $ALLCORPACTIONFILE
done

cat $ALLCORPACTIONFILE | sort | tac > $TMPFILE1
cat $TMPFILE1 > $ALLCORPACTIONFILE


#####################
# erase old stuff for easy viewing
#####################
    # iCnt=0
    # OLDDATESTR=$($DMATHSCT $(date +'%Y%m%d') -$iCnt)
    # OLDDATESTR_=$(echo $OLDDATESTR | $DFMTSCT)
    #
    # while [[ -z $(cat $ALLCORPACTIONFILE | grep -n $OLDDATESTR_) ]]
    # do
    #     iCnt=$(expr $iCnt + 1)
    #     OLDDATESTR=$($DMATHSCT $(date +'%Y%m%d') -$iCnt)
    #     OLDDATESTR_=$(echo $OLDDATESTR | $DFMTSCT)
    # done
    #
    # HOWMANYLINESREMAIN=$(cat $ALLCORPACTIONFILE | grep -n $OLDDATESTR_ | awk -F: '{print $1}' | head -n 1)
    #
    # cat $ALLCORPACTIONFILE | head -n $HOWMANYLINESREMAIN > $TMPFILE1
    # cat $TMPFILE1 > $ALLCORPACTIONFILE


###################################################
# replace -- with previous value
###################################################
$REPLACEUNKWNWITHPREVPROG $ALLCORPACTIONFILE | uniq > $ALLCORPACTIONFILE2

rm -f $TMPFILE1 $TMPFILE2 $TMPFILE3
