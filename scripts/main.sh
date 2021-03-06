#!/bin/bash
PATH_TO_LEFT_HAND_PLANS="plans/left-hand-typing.txt"

level=20
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
  echo "Starting typing now..."
  read  -n 1 -p "Keyboard Input : " inputLetter
  a=$(get_random_sentence)
  prompt_and_check $a
}

load_letter_array () {
  local counter=$level
  while read -r line && (( counter>0 ))
  do
    ((counter--))    
    for ((i=0;i<${#line};i++))
    do
      letterArray+=${line:$i:1}
    done
  done < $PATH_TO_LEFT_HAND_PLANS
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

prompt_and_check () {
  currentPos=0
  currenPhrase=$0
  echo $1

  while [ $currentPos<${#currentPhrase} ] 
  do
    read  -n 1 -p "Keyboard Input : " inputLetter
    if [ "$inputLetter" != "$currentPhrase[$currentPos]" ]
    then 
      echo "Incorrect!"
    fi
    (( currentPos++ ))
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

