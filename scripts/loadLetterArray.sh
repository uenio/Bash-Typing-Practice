#!/bin/bash
PATH_TO_LEFT_HAND_PLANS="../plans/left-hand-typing.txt"


while read -r line
do
  for ((i=0;i<${#line};i++))
  do
    letterArray+=${line:$i:1}
  done
done < $PATH_TO_LEFT_HAND_PLANS
