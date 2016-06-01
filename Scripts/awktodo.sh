## # test ##

# 1.
# grep -e $1 ~/todo.txt |\
# awk /a/ {print $1 $2}

# 2.
# awk '/test/{print $1 $4 $5 $6 $7 $8 $9}' ~/todo.txt

# 3. 
#Finds the wanted task
cat ~/todo.txt | grep $1 >/tmp/test2.txt
#Removes the task from todo (taken from ~/Scripts/todoremove.sh)
cat ~/todo.txt | grep -v $1 >/tmp/test.txt
cp /tmp/test.txt ~/todo.txt
# replaces _ with X in tmp file and appends the wanted task to the todo file
sed 's/_/X/g' /tmp/test2.txt >> ~/todo.txt 

# 4. (optimizing the 3. version)
#Finds the wanted task
# grep $1 ~/todo.txt >/tmp/test2.txt
#Removes the task from todo (taken from ~/Scripts/todoremove.sh)
# cat ~/todo.txt | grep -v $1 >/tmp/test.txt
# cp /tmp/test.txt ~/todo.txt
# replaces _ with X in tmp file and appends the wanted task to the todo file
# sed 's/_/X/g' /tmp/test2.txt >> ~/todo.txt 