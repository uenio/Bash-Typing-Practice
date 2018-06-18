#!/bin/bash

letterArray=(f g h j)
<<<<<<< HEAD
totalChars=0
correctChars=0
=======
total=0
numCorrect=0

>>>>>>> c02f1860b6909d926cad7acf865840d3c2c00eb2

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
<<<<<<< HEAD
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
=======
		(( numCorrect++ ))
	fi

	printf "$inputLetter\n"
	(( total++ ))
done


echo $numCorrect
echo $total
>>>>>>> c02f1860b6909d926cad7acf865840d3c2c00eb2
