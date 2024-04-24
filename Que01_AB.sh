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


#cal

#!/bin/bash

# Function to calculate factorial recursively
factorial() {
    local num=$1
    if ((num == 0)); then
        echo 1
    elif ((num < 0)); then
        echo "Factorial of negative number doesn't exist."
    else
        echo $((num * $(factorial $((num - 1)))))
    fi
}

# Main script for calculator
echo "Enter the first number:"
read num1

echo "Select operation:"
echo "+ : Addition"
echo "- : Subtraction"
echo "* : Multiplication"
echo "/ : Division"
echo "% : Modulus"
echo "^ : Power"
read -p "Enter your choice: " operation

echo "Enter the second number:"
read num2

case $operation in
    "+")
        result=$((num1 + num2))
        ;;
    "-")
        result=$((num1 - num2))
        ;;
    "*")
        result=$((num1 * num2))
        ;;
    "/")
        if ((num2 == 0)); then
            echo "Error: Division by zero!"
            exit 1
        fi
        result=$(bc <<< "scale=2; $num1 / $num2")
        ;;
    "%")
        result=$((num1 % num2))
        ;;
    "^")
        result=$(bc <<< "$num1^$num2")
        ;;
    *)
        echo "Invalid operation!"
        exit 1
        ;;
esac

echo "Result: $result"
