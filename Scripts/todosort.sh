#!/bin/bash
cat ~/todo.txt | sort > /tmp/tmp.todo
mv /tmp/tmp.todo ~/todo.txt
