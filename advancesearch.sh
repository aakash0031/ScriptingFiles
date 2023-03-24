#!/bin/bash


###########################################
#
# practicing about case statement...
#
##########################################


FILENAME=$1

if [ ! "$FILENAME" ]; then
	echo "Please enter the file name to continue....MANDATORY!!!!"
        exit
fi

echo "Enter the operation you want to perform with the file.."
echo "Select the below options to proceed..."
echo "1 - Search a word from file "


read COMMAND
case "$COMMAND" in
	1)
		echo "Welcome to the grep world...."
		echo "grep stands for global regular expression print..."
		OPERATION=Y;
		while [ "$OPERATION" == 'Y' ]
		do
		   echo "Enter the word you want to search..."
		   read WORD
		   echo "are you interested to search with more advanced operation??? Y/N "
		   read OPE
		   if [ "$OPE" == 'Y' ]; then
			   echo "Please choose the options below to perform the operation..."
			   echo "1 - View output with line numbers.."
			   echo "2 - View all the words except the word you have entered.."
			   echo "3 - View the words which are equal with the case insensitive with the word you have entered..."
			   echo "4 - View the lines after the word..Ex-if you enter 4 it will display 4 lines after the word. "
			   echo "5 - View the lines before the word..Ex-if you enter 4 it will display 4 lines before the word. "
			   echo "6 - View the lines which are end with some perticular word.."
			   echo "7 - View the lines which are start with some perticular word.." 
			   echo "* - exit "
	                  read OP
		          case "$OP" in
		          1) 
			        /usr/bin/grep -n $WORD $FILENAME
				;;
		          2)
			        /usr/bin/grep -v $WORD $FILENAME
			     ;;
		          3)
			     /usr/bin/grep -i $WORD $FILENAME
			     ;;
			  4)
		             echo "Enter The number of lines you want to view after the word..."
			     read N
			     /usr/bin/grep -nA$N $WORD $FILENAME
			     ;;
			  5)
			     echo "Enter The number of lines you want to view before the word..."
                             read N
                             /usr/bin/grep -nB$N $WORD $FILENAME
                             ;;
			  6)
		            echo "Enter the word with which you want to see the line start with..."
			    read W
			    /usr/bin/grep ^$W $FILENAME
			    ;;
			  7)
	                    echo "Enter the word with which you want to see the line end with..."
			   read W
			    /usr/bin/grep $W$ $FILENAME
			    ;;
			  *)
		            echo "Do you really want to exit from the search...?? Y/N"
			    read ANS
			    if [ "$ANS" == 'Y' ]; then
				   echo "Thank you for using this script to search..."
				   exit
			    else
				   echo "Keep Searching...."
			    fi 

	        	esac
		    else
			    /usr/bin/grep $WORD $FILENAME
			    echo
			    echo "Choose advance search for better experience..."
		   fi
		   echo "Do you want to search more word from the file...? Y/N"
		   read OPERATION
	       done
	      ;;
	2)
		echo "Operations will be update soon...stay tune to get more features.."
		;;
	*)
		echo "Operations will be update soon...stay tune to get more features.."
	
		;;
esac

