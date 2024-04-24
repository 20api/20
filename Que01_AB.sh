#!/bin/bash

#check if studentinfo.log exists.
if [[ -f "studentinfo.log" ]]; then
	echo "studentinfo.log already exists."
	
	if [[ ! -w "studentinfo.log" ]]; then
		echo "Adding write permision to studentinfo.log"
		chmod +w studentinfo.log

fi

else 
	echo "creating studentinfo.log"
	touch studentinfo.log
	chmod +w studentinfo.log
fi

while true; do

echo "Enter the index number :"
read index

#display option

echo "Select option"

echo "1.student details:"
echo "2.continue"
echo "3.exit"
read option

case $option in
	1)

echo "Enter the lastname:"
read lastname

echo "ENter the Register number:"
read regnum

echo "enter  user name:"
read uname

echo "enter password:"
read -s password

echo "confirm password:"
read -s password

if [[ "$password" == "confirmpassword" ]]; then
	#statements
	echo "password match"
else
	echo "password do not match"

	while true; do
		echo "re-enter confirm password:"
		read -s confirmpassword
		if [[ "$password" == "$confirmpassword" ]]; then
			echo "password match"
			break

		else
			echo "password do not match."
			#statements
		fi
	done
fi

#store studenet details in studentinfo.log

echo "index number: $index" >> studentinfo.log
echo "Last name: $lastname" >> studentinfo.log
echo "Register number: $regnum" >> studentinfo.log
echo "User name: $uname" >> studentinfo.log
echo "password:$password" >> studentinfo.log
echo "" >> studentinfo.log
		;;

2) 
    continue 
    ;;

    3)
          echo "exiting.."
          exit
          ;;

          *) 
echo "invalid option! try again."
;;
esac

done