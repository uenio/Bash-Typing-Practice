#!/bin/bash

letterArray=(f g h j)
totalChars=0
correctChars=0
maxWordLength=5
maxSentenceLength=6

bold=$(tput bold)
normal=$(tput sgr0)

main () {
	a=$(print_random_sentence)
	#a=$(print_random_word)
	echo $a
	print_results

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

print_random_sentence () {
	randomSentence=""
	for ((i=1;i<=maxSentenceLength;i++))
	do
                nextWord=$(print_random_word)
                randomSentence+=$nextWord
		randomSentence+=" "
        done
        echo $randomSentence
}

print_random_word () {
	randomWord=""
	for ((i=1;i<=maxWordLength;i++))
        do
		nextChar=$(print_random_character)
		randomWord+=$nextChar
        done
	echo $randomWord
}

print_random_character () {
	randomLetter=${letterArray[$RANDOM % ${#letterArray[@]}]}
	echo $randomLetter
}

print_results () {
	echo "Correct: $correctChars"
	echo "Total: $totalChars"
}

main

