#!/bin/bash -x

echo Welcome to Flip coin Combination

H=0
T=0
HH=0
TT=0
HT=0
TH=0
HHH=0
HHT=0
HTH=0
THH=0
TTT=0
TTH=0
THT=0
HTT=0
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

for ((i=1; i<=$flip; i++))
do
        coin1=$((RANDOM%2))
        coin2=$((RANDOM%2))
        coin3=$((RANDOM%2))
        if [ $coin1 -eq 0 -a $coin2 -eq 0 -a $coin3 -eq 0 ]
        then
                ((HHH++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 1 -a $coin3 -eq 0 ]
        then
                ((TTH++))
        elif [ $coin1 -eq 0 -a $coin2 -eq 1 -a $coin3 -eq 0 ]
        then
                ((HTH++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 0 -a $coin3 -eq 0 ]
        then
                ((THH++))
        elif [ $coin1 -eq 0 -a $coin2 -eq 0 -a $coin3 -eq 1 ]
        then
                ((HHT++))
        elif [ $coin1 -eq 0 -a $coin2 -eq 1 -a $coin3 -eq 1 ]
        then
                ((HTT++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 0 -a $coin3 -eq 1 ]
        then
                ((THT++))
        elif [ $coin1 -eq 1 -a $coin2 -eq 1 -a $coin3 -eq 1 ]
        then
                ((TTT++))
        fi
done

h=$(echo "scale=2; $H/$flip" | bc )
t=$(echo "scale=2; $T/$flip" | bc )

hh=$(echo "scale=2; $HH/$flip" | bc )
tt=$(echo "scale=2; $TT/$flip" | bc )
ht=$(echo "scale=2; $HT/$flip" | bc )
th=$(echo "scale=2; $TH/$flip" | bc )

hhh=$(echo "scale=2; $HHH/$flip" | bc )
hht=$(echo "scale=2; $HHT/$flip" | bc )
hth=$(echo "scale=2; $HTH/$flip" | bc )
thh=$(echo "scale=2; $THH/$flip" | bc )
ttt=$(echo "scale=2; $TTT/$flip" | bc )
tth=$(echo "scale=2; $TTH/$flip" | bc )
tht=$(echo "scale=2; $THT/$flip" | bc )
htt=$(echo "scale=2; $HTT/$flip" | bc )

H_percent=$(echo "scale=2; $h*100" | bc )
T_percent=$(echo "scale=2; $t*100" | bc )

HH_percent=$(echo "scale=2; $hh*100" | bc )
TT_percent=$(echo "scale=2; $tt*100" | bc )
HT_percent=$(echo "scale=2; $ht*100" | bc )
TH_percent=$(echo "scale=2; $th*100" | bc )

HHH_percent=$(echo "scale=2; $hhh*100" | bc )
HHT_percent=$(echo "scale=2; $hht*100" | bc )
HTH_percent=$(echo "scale=2; $hth*100" | bc )
THH_percent=$(echo "scale=2; $thh*100" | bc )
TTT_percent=$(echo "scale=2; $ttt*100" | bc )
TTH_percent=$(echo "scale=2; $tth*100" | bc )
HTT_percent=$(echo "scale=2; $htt*100" | bc )
THT_percent=$(echo "scale=2; $tht*100" | bc )

combination["H"]=$H_percent
combination["T"]=$T_percent

combination["HH"]=$HH_percent
combination["TT"]=$TT_percent
combination["HT"]=$HT_percent
combination["TH"]=$TH_percent

combination["HHH"]=$HHH_percent
combination["HHT"]=$HHT_percent
combination["HTH"]=$HTH_percent
combination["THH"]=$THH_percent
combination["TTT"]=$TTT_percent
combination["TTH"]=$TTH_percent
combination["HTT"]=$HTT_percent
combination["THT"]=$THT_percent

for key in ${!combination[@]}
do
        echo "$key : ${combination[$key]} %"
done

