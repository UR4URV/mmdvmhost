#!/bin/bash

#wget https://github.com/g4klx/MMDVMHost/blob/master/RSSI.dat
#mv RSSI.dat ./config/

wget https://radioid.net/static/user.csv
cat user.csv | grep -v "RADIO_ID" | awk -F',' '{print $1 "\t" $2 "\t" $3}' > DMRIds.dat
mv DMRIds.dat ./config/
