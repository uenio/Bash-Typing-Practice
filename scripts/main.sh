#!/bin/bash

totalChars=0
correctChars=0
maxWordLength=5
maxSentenceLength=6

letterArray=()

bold=$(tput bold)
normal=$(tput sgr0)

main () {
  load_letter_array
  print_whole_array $letterArray


  #a=$(get_random_sentence)
  #echo $a
}

load_letter_array () {
  while read -r line
  do
    for ((i=0;i<${#line};i++))
    do
      letterArray+=${line:$i:1}
    done
  done < "plans/left-hand-typing.txt"
}

print_whole_array () {
  #$printedArray=$1
  for each in "${letterArray[@]}"
  do
    echo "$each"
  done
}

print_random_letters () {
	for i in {1..10}
	do
		# clear
		randomLetter=${letterArray[$RANDOM % ${#letterArray[@]}]}
		printf "${bold}$randomLetter${normal}\n"
		read  -n 1 -p "Keyboard Input : " inputLetter
	
		printf "\n"

		if [ "$randomLetter" == "$inputLetter" ]
		then
			printf "Correct!\n"
			(( correctChars++ ))
		fi

		printf "$inputLetter\n"
		(( totalChars++ ))
	done
}

rand_int_in_range () {
	local min=$1
	local max=$2
	return $(( ( RANDOM % max )  + min ))
}

get_random_sentence () {
	rand_int_in_range 1 $maxSentenceLength
	local length=$?

	randomSentence=""
	for ((i=1;i<=length;i++))
	do
                nextWord=$(get_random_word)
                randomSentence+=$nextWord
		randomSentence+=" "
        done
        echo $randomSentence
}

get_random_word () {
	rand_int_in_range 1 $maxWordLength
	local length=$?

	randomWord=""
	for ((i=1;i<=length;i++))
        do
		nextChar=$(get_random_character)
		randomWord+=$nextChar
        done
	echo $randomWord
}

get_random_character () {
	rand_int_in_range 0 ${#letterArray[@]}
	randIndex=$?

	randomLetter=${letterArray[$randIndex]}
	echo $randomLetter
}

print_results () {
	echo "Correct: $correctChars"
	echo "Total: $totalChars"
}

main

