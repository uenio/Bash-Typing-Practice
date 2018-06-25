#!/bin/bash
while getopts "hl:" OPTION
do
  case $OPTION in
    h)
      cat files/help.txt
      exit
      ;;
    l)
      LEVEL=$OPTARG
      ;;
    \?)
      echo "Used for the help menu"
      exit
      ;;
  esac
done

./scripts/main.sh -l $LEVEL
