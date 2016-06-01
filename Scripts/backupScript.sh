## backup script ##
#Locations to backup:
#	.config/
#			awesome/
#			terminator/
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
  	  ~/.i3\
	  ~/Scripts\
	  ~/.conkyrc\
	  ~/Documents\
	  ~/todo.txt\
	  ~/.bashrc\
	  ~/.vimrc\
	  ~/.vim\
	  ~/Copy/Backup/
