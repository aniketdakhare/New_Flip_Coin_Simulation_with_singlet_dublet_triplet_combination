#!/bin/bash -x

echo Welcome to Flip coin Combination

heads=0
tails=0
declare -A singlet
for ((i=1; i<=10; i++))
do
        coin=$((RANDOM%2))
        if [ $coin -eq 0 ]
        then
                singlet[c"$i"]="head"
                ((heads++))
        else
                singlet[c"$i"]="tail"
                ((tails++))
        fi
done
for key in ${!singlet[@]}
do
        echo "$key : ${singlet[$key]}"
done
h=$(echo "scale=2; $heads/10" | bc )
t=$(echo "scale=2; $tails/10" | bc )
heads_percent=$(echo "scale=2; $h*100" | bc )
tails_percent=$(echo "scale=2; $t*100" | bc )
echo $heads_percent % of Heads
echo $tails_percent % of Tails
