#!/bin/bash

letterArray=(f g h j)
maxWordLength=5

main () {
	echo "log">log.txt
        a=$(get_random_word)
        echo $a
}

rand_int_in_range () {
	local min=$1
	local max=$2
	currRand=$RANDOM
	echo "CRan: $currRand">>log.txt
	res=$(( ( currRand % max )  + min ))
	echo "RINT: $res">>log.txt
	return $res
}

get_random_word () {
	rand_int_in_range 1 $maxWordLength
	local length=$?

	randomWord=""
	for ((i=1;i<=length;i++))
        do
		nextChar=$(get_random_character)
		#get_random_character
		randomWord+=$nextChar
		echo "GWord: $randomWord">>log.txt
        done
	echo $randomWord
}

get_random_character () {
	rand_int_in_range 0 ${#letterArray[@]}
	randIndex=$?

	randomLetter=${letterArray[$randIndex]}
	echo "GChar: $randomLetter">>log.txt
	echo $randomLetter
}

main

