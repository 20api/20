#!/bin/bash

grading() {
	local mark=$1
	if [[ mark>=80 && mark<=100 ]]; then
		grade="A"

	elif [[ mark>=60 && mark<=79 ]]; then
		grade="B"

	elif [[ mark>=40 && mark<=59 ]]; then
		grade="C"

	elif [[ mark>=20 && mark<=39 ]]; then
		grade="D"
	elif [[ mark>=10 && mark<=19 ]]; then
		grade="E"
	else
		grade="F"
	fi

	echo "$grade"
}


#main script 

echo "Enter the marks of student (0 to 100),type 'q' to quit:"

while true; do
	read -p "Enter mark:" mark
	if [[ $mark == 'q' ]]; then
		break
	fi

	if [[ marks>=0 && mark<=100 ]]; then
		echo "$mark" >> mark-sheet
		grade=$(grading "$mark")
		echo "$grade" >> mark-grades

	else
		echo "enter a valid mark"
	fi
done

echo "Marks and grade saved file sheet and"