#!/bin/bash
cat ~/todo.txt | grep -v $1 >/tmp/test.txt
cp /tmp/test.txt ~/todo.txt