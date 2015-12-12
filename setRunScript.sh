#!/bin/bash
###############################################################################
## Creates a .run.sh file on home directory and adds the alias "run" for it in
## ~/.bashrc
## Todo:Done, Basic funtionality of Script
## 	Automatic convertion from runn.sh to this script, (using sed?)
## 	Done, Add alias to user .basrc
## 	Add comments
###############################################################################

## Variable decleration
RUN=~/.run.sh

touch $RUN     	#make .run.sh file
chmod +x $RUN  	#make it execuable

# 'steam' the code for the run script into ~/.run.sh
echo " 
#!/bin/bash
#######################################################################
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
		bash \$FILE     #Runs the file in bash
	else
		echo \"OK then.\"
	fi
fi
" > $RUN
# append an alias for the run script in ~/.bashrc
echo "# An alias for the run 'command'
alias run=~/.run.sh" >> ~/.bashrc
