## backup script ##
#Locations to backup:
#	.config/
#			awesome/
#			terminator/
#			dunst/
#			ranger/
#	.i3
#	Scripts/
#	.conkyrc
#       Documents/
#	todo.txt
#       .bashrc
#       .vimrc
#       .vim/
#
#Save to ~/Copy/Backup/
##

rsync -av ~/.config/awesome\
	  ~/.config/terminator\
	  ~/.config/dunst\
	  ~/.config/ranger\
  	  ~/.i3\
	  ~/Scripts\
	  ~/.conkyrc\
	  ~/Documents\
	  ~/todo.txt\
	  ~/.bashrc\
	  ~/.vimrc\
	  ~/.vim\
	  ~/testdir\
	  ~/Copy/Backup/
