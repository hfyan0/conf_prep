#!/bin/bash

SRC=/home/qy/Dropbox/nirvana/conf_prep/lot_size/lot_size_base.csv
DEST=/home/qy/Dropbox/nirvana/conf/lot_size.csv

cat $SRC > $DEST
cat $SRC | sed -e 's/^0*//' >> $DEST
