#!/bin/bash

letterArray=(f g h j)
total=0
numCorrect=0


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
		(( numCorrect++ ))
	fi

	printf "$inputLetter\n"
	(( total++ ))
done


echo $numCorrect
echo $total
