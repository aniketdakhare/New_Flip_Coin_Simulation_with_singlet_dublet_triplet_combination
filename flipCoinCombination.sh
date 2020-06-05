#!/bin/bash -x

echo Welcome to Flip coin Combination

H=0
T=0
HH=0
TT=0
HT=0
TH=0
read -p "How many times do you want to flip the coins?   " flip
declare -A combination
for ((i=1; i<=$flip; i++))
do
        coin=$((RANDOM%2))
        if [ $coin -eq 0 ]
        then
               ((H++))
        else
               ((T++))
        fi
done

for ((i=1; i<=$flip; i++))
do
        coin1=$((RANDOM%2))
        coin2=$((RANDOM%2))
        if [ $coin1 -eq 0 -a $coin2 -eq 0 ]
        then
               ((HH++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 1 ]
        then
               ((TT++))
        elif [ $coin1 -eq 0 -a $coin2 -eq 1 ]
        then
                ((HT++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 0 ]
        then
                ((TH++))
        fi
done
h=$(echo "scale=2; $H/$flip" | bc )
t=$(echo "scale=2; $T/$flip" | bc )
hh=$(echo "scale=2; $HH/$flip" | bc )
tt=$(echo "scale=2; $TT/$flip" | bc )
ht=$(echo "scale=2; $HT/$flip" | bc )
th=$(echo "scale=2; $TH/$flip" | bc )

H_percent=$(echo "scale=2; $h*100" | bc )
T_percent=$(echo "scale=2; $t*100" | bc )
HH_percent=$(echo "scale=2; $hh*100" | bc )
TT_percent=$(echo "scale=2; $tt*100" | bc )
HT_percent=$(echo "scale=2; $ht*100" | bc )
TH_percent=$(echo "scale=2; $th*100" | bc )

combination["H"]=$H_percent
combination["T"]=$T_percent
combination["HH"]=$HH_percent
combination["TT"]=$TT_percent
combination["HT"]=$HT_percent
combination["TH"]=$TH_percent
for key in ${!combination[@]}
do
        echo "$key : ${combination[$key]} %"
done
