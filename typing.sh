#!/bin/bash

letterArray=(f g h j)
totalChars=0
correctChars=0

bold=$(tput bold)
normal=$(tput sgr0)

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

print_results () {
	echo "Correct: $correctChars"
	echo "Total: $totalChars"
}

print_results
