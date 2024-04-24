#!/bin/bash


if [[ ! -d ~/Desktop/Resources ]]; then
	mkdir ~/Desktop/Resources
	echo "Resources directory created."
fi

#check if batch_15 directory exists,if not create it

if [[ ! -d ~/Desktop/Resources/Batch_15 ]]; then
	mkdir ~/Desktop/Resources/Batch_15
	echo "Batch_15 directory created."
	
fi
#check if batch_16 directory exists,if not create it

if [[ ! -d ~/Desktop/Resources/Batch_16  ]]; then
	mkdir ~/Desktop/Resources/Batch_16
	echo "Batch_16 directory created."

fi

#list all files that begin with 15 and copy them to batch_!6 directory

files_15=$(ls 15*)
if [[ -n "$files_15" ]]; then
	cp $files_15 ~/Desktop/Resources/Batch_15
	echo "all answer scripts of 15 batch have been successfully copied."
else
	echo "no answer script found for 15 batch"
fi

#list all file that begin with 16 and copy them batch_!6 directory

files_16=$(ls 16*)
if [[ -n "files_16" ]]; then
	cp $files_16 ~/Desktop/Resources/Batch_16
	echo "all answer scripts of 16 batch have been successfully copied"
else
	echo "no answer scripts found for 16th batch"
fi

#coupy folder to folder with your index number
echo "enter your index number:"
read indexNumber

if [[ -d ~/Desktop/Resources ]]; then
	cp -r ~/Desktop/Resources ~/Desktop/"$indexNumber"
	echo "Resources directory is successfully copied."

else
	echo "Resources directory not found."
fi
