#!/bin/bash
###############################################################################
## 				Runn Script v1,6
## Creates a .run.sh file on home directory and adds the alias "run" for it in
## ~/.bashrc
## Todo:Done, 	Basic funtionality of Script
## 		Automatic convertion from runn.sh to this script, (using sed?)
## 	Done,	Add alias to user .basrc
## 		Add comments
## 	Done,	Make the script more informative 
## 	Done,	Checks if alias already exsist in .bashrc 
## 	Done, 	ack when the script is done
## 	Done,	Check version of Script, overwrite if older
## 		use version number with "." instead of "," 
## 		Check if run.sh already exsists 
###############################################################################

## Variable declaration
RUN=~/.run.sh
D=`pwd`
CHALI=`cat ~/.bashrc | grep '~/.run.sh'` # does not work with $RUN instead, unknown reason
RUNNV=`cat ~/.run.sh | grep "Runn" | grep -E -o '[0-9].[0-9]'`
NRUNNV="1,6"

echo "The script run Script Version is: $NRUNNV"
echo "The system run Script version is: $RUNNV"

echo "Setting up 'run script'"
touch $RUN 	#make .run.sh file
chmod +x $RUN  	#make is execuable

# Checks if the users runn Script is older, that the script and then updates it
if [[ "$RUNNV" -ge "$NRUNNV" ]]; then
	echo "script version is not greater then system"
else
	echo "script version is greater then system
therefore the run Script will be updated"
# 'steam' the code for the run script into ~/.run.sh
echo "
#!/bin/bash
#######################################################################
## 				Runn Script v1,6
## Check permissions of the file, make in executable and run it in bash
## Todo: 
## 	X: checks if the FILE is a script
#######################################################################

## Variable decleration
FILE=\$1                 #Sets FILE = the first input
FF=\`file -b \$FILE\`      #Sets FF = the description of the file type

# Checks if the file is a bash script
if [ \"\$FF\"  = \"Bourne-Again shell script, ASCII text executable\" ]; then
	# Checks if the file if Execuable, if not makes it execuable
	if [ -x \$FILE ]; then  
	#	echo \"no chmod\" #(for debugging)
		echo \"\"
	else 
		chmod +x \$FILE
	#	echo \"chmod\"    #(for debugging)
	fi
	bash \$FILE     #Runs the file in bash
	echo \"\$FILE has been run \"
else	
	echo \"File is not a Shell Script\"
	echo \"Do you want to try and run it anyway [y/n]\"
	read answer
	if [ \"\$answer\" == \"y\" ]; then
		# Checks if the file if Execuable, if not makes it execuable
		if [ -x \$FILE ]; then  
		#	echo \"no chmod\" #(for debugging)
			echo \"\"
		else 
			chmod +x \$FILE
		#	echo \"chmod\"    #(for debugging)
		fi
		echo \" running \$FILE \"
		bash \$FILE     #Runs the file in bash
	else
		echo \"OK then.\"
	fi
fi
" > $RUN
fi

# append an alias for the run script in ~/.bashrc if there is not one already
if [[ "$CHALI" == "alias run=~/.run.sh" ]]; then
	echo "bashrc alias already there"
	# Do nothing
else 
	echo "bashrc alias inserted"

	# Add "alias run~/.run.sh" to bashrc
	echo "
# An alias for the run 'command'
alias run=~/.run.sh" >> ~/.bashrc 
fi


