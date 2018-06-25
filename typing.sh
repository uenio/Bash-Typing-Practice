#!/bin/bash
while getopts "hf:" OPTION
do
	case $OPTION in
		h)
			cat files/help.txt
			exit
			;;
		f)
			echo "The value of -f is $OPTARG"
			MYOPTF=$OPTARG
			echo $MYOPTF
			exit
			;;
		\?)
			echo "Used for the help menu"
			exit
			;;
	esac
done

./scripts/main.sh
