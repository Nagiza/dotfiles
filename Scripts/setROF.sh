#!/bin/bash
############################################################
#			    rmTmpFiles
#				
#############################################################
sudo apt-get update
sudo apt-get install trash-cli

TMPDIR=~/Downloads/tmpfiles/

mkdir $TMPDIR

echo "
## Alias for rm tmp files in "$TMPDIR"
alias rmtmpfiles='find "$TMPDIR" -type f -mtime +10 -exec trash {} \\;' " >> ~/.bashrc
