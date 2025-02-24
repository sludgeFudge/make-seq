#!/bin/sh

# simple sciprt for making image sequences
# does 2 things:
# 1) renumbers the image sequence from 0
# 2) prepends the directory's name before the sequence number
#
# NOTE: merely renames the entire file, does not check if an image or even the same file type

# Reading Material
# Bash String Manipulation: https://tldp.org/LDP/abs/html/string-manipulation.html
# Zero Padding in Variables: https://stackoverflow.com/questions/5584470/how-to-increment-a-zero-padded-int-in-bash
# For Loops: https://www.geeksforgeeks.org/bash-scripting-for-loop/

count=0
# what is the parent directory's name?
pre=${PWD##*/}

echo "Make sure you've backed up"
echo "Ensure you are currently in the directory of the image sequence"
echo "Ensure that only the image sequence is within this directory"
echo "Recommended that the directory name has no spaces"
echo "----"
echo "Enter any value to continue, otherwise terminate the program with Ctrl+C."
read ans

for i in *; do
	# printf has a function (-v) to send to a variable,
	# %04d zero pads to 4 digits
	printf -v frame "%04d" $count

	# ${i##*.} extracts the extension name
	mv -v "$i" "$pre"_"$frame"."${i##*.}"
	count=$((count+1))

	# debugging
	#echo "count: " $count
	#echo "frame: " $frame
	#read ans;
done
